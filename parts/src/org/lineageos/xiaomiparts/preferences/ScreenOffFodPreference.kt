/*
* SPDX-FileCopyrightText: 2024 The LineageOS Project
* SPDX-License-Identifier: Apache-2.0
*/

package org.lineageos.xiaomiparts.preferences

import android.content.Context
import android.util.AttributeSet
import android.util.Log
import androidx.preference.PreferenceManager
import androidx.preference.SwitchPreference

import java.io.File

import org.lineageos.xiaomiparts.Constants

class ScreenOffFodPreference(val mContext: Context, attributes: AttributeSet) : SwitchPreference(mContext, attributes) {
    override fun setChecked(checked: Boolean) {
        super.setChecked(checked)
        setScreenOffFodEnabled(checked) 
    }

    companion object : RestoreOnBootPreference {
        private const val SCREEN_OFF_FOD_NODE = "/sys/devices/platform/goodix_ts.0/fod_enable"

        override fun restoreState(context: Context) {
            val sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)
            val isEnabled = sharedPreferences.getBoolean(getPreferenceKey(), false)
            setScreenOffFodEnabled(isEnabled)
        }

        override fun getPreferenceKey(): String {
            return "screen_off_fod"
        }

        private fun setScreenOffFodEnabled(enabled: Boolean) {
            Log.i(Constants.LOG_TAG, "Setting screen off fod status to: $enabled")
            File(SCREEN_OFF_FOD_NODE).writeText(if (enabled) "1" else "0")
        }
    }
}