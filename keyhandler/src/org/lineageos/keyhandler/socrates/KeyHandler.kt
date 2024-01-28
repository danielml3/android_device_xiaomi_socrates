/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.keyhandler.socrates

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.util.Log
import android.view.KeyEvent

import androidx.preference.PreferenceManager

import com.android.internal.os.DeviceKeyHandler

class KeyHandler(private val context: Context) : BroadcastReceiver(), DeviceKeyHandler, SensorEventListener {
    val LOG_TAG = "KeyHandlerSocrates"

    private var proximitySensor: Sensor? = null
    private var sensorManager: SensorManager? = null

    private var proximityDistance: Float = Float.MAX_VALUE

    init {
        sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        proximitySensor = sensorManager?.getDefaultSensor(Sensor.TYPE_PROXIMITY)

        if (proximitySensor == null) {
            Log.e(LOG_TAG, "Proximity sensor not found")
        }

        val intentFilter = IntentFilter().apply {
            addAction(Intent.ACTION_SCREEN_OFF)
            addAction(Intent.ACTION_SCREEN_ON)
        }

        context.registerReceiver(this, intentFilter)
    }

    // Start of DeviceKeyHandler methods
    override fun handleKeyEvent(event: KeyEvent): KeyEvent? {
        Log.d(LOG_TAG, "Received key event ${event.getKeyCode()}")

        when (event.getKeyCode()) {
            KeyEvent.KEYCODE_WAKEUP -> {
                if (shouldPreventWakeup()) {
                    Log.d(LOG_TAG, "Preventing wakeup")
                    return null
                }
            }
        }

        return event
    }
    // End of DeviceKeyHandler methods

    // Start of BroadcastReceiver methods
    override fun onReceive(ctx: Context?, intent: Intent?) {
        if (intent?.action == Intent.ACTION_SCREEN_OFF) {
            Log.d(LOG_TAG, "Screen turned off")

            if (proximitySensor != null) {
                sensorManager?.registerListener(this, proximitySensor!!, SensorManager.SENSOR_DELAY_NORMAL)
            }
        } else if (intent?.action == Intent.ACTION_SCREEN_ON) {
            Log.d(LOG_TAG, "Screen turned on")
            sensorManager?.unregisterListener(this)
        }
    }
    // End of BroadcastReceiver methods

    // Start of SensorEventListener methods
    override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {
    }

    override fun onSensorChanged(event: SensorEvent) {
        if (event.sensor.type == Sensor.TYPE_PROXIMITY) {
            val proximity = event.values[0]

            Log.d(LOG_TAG, "Received proximity event: $proximity")
            proximityDistance = proximity
        }
    }
    // End of SensorEventListener methods

    private fun shouldPreventWakeup(): Boolean {
        return proximityDistance == 0.0f
    }
}
