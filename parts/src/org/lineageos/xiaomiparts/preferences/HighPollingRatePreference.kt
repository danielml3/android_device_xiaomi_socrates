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

import org.lineageos.xiaomiparts.Constants
import org.lineageos.xiaomiparts.touch.TouchCmdUtil

class HighPollingRatePreference(val mContext: Context, attributes: AttributeSet) : SwitchPreference(mContext, attributes) {
    override fun setChecked(checked: Boolean) {
        super.setChecked(checked)
        setHighPollingRateEnabled(checked) 
    }

    companion object : RestoreOnBootPreference {
        override fun restoreState(context: Context) {
            val sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)
            val isEnabled = sharedPreferences.getBoolean(getPreferenceKey(), false)
            setHighPollingRateEnabled(isEnabled)
        }

        override fun getPreferenceKey(): String {
            return "high_polling_rate"
        }

        private fun setHighPollingRateEnabled(enabled: Boolean) {
            Log.i(Constants.LOG_TAG, "Setting high polling rate status to: $enabled")

            TouchCmdUtil.setTouchMode(
                TouchCmdUtil.GAME_MODE,
                if (enabled) 1 else 0
            )
        }
    }
}