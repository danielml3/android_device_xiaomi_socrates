/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.xiaomiparts

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

import org.lineageos.xiaomiparts.Constants
import org.lineageos.xiaomiparts.preferences.RestoreOnBootPreference
import org.lineageos.xiaomiparts.preferences.HighPollingRatePreference
import org.lineageos.xiaomiparts.preferences.ScreenOffFodPreference

class BootCompletedReceiver : BroadcastReceiver() {
    companion object {
        private val preferencesToRestore = listOf<RestoreOnBootPreference>(
            HighPollingRatePreference,
            ScreenOffFodPreference
        )
    }

    override fun onReceive(context: Context, intent: Intent) {
        Log.i(Constants.LOG_TAG, "Received BOOT_COMPLETED intent");

        for (preference in preferencesToRestore) {
            Log.i(Constants.LOG_TAG, "Restoring state for: ${preference.getPreferenceKey()}")

            preference.restoreState(context)
        }
    }
}