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

class DoubleTapToWakePreference(val mContext: Context, attributes: AttributeSet) : SwitchPreference(mContext, attributes) {
    override fun setChecked(checked: Boolean) {
        super.setChecked(checked)
        setDT2WEnabled(checked)
    }

    companion object : RestoreOnBootPreference {
        private const val DT2W_NODE = "/sys/devices/platform/goodix_ts.0/double_tap_enable"

        override fun restoreState(context: Context) {
            val sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)
            val isEnabled = sharedPreferences.getBoolean(getPreferenceKey(), false)
            setDT2WEnabled(isEnabled)
        }

        override fun getPreferenceKey(): String {
            return "double_tap_to_wake"
        }

        private fun setDT2WEnabled(enabled: Boolean) {
            Log.i(Constants.LOG_TAG, "Setting DT2W status to: $enabled")
            File(DT2W_NODE).writeText(if (enabled) "1" else "0")
        }
    }
}
