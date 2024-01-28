/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.xiaomiparts.preferences

import android.content.Context

/**
 * This interface must be implemented by the preferences that require interacting
 * with non-persistent system components on reboot (for example, writing to a sysfs node)
 * 
 * Preferences implementing this interface should only reference to an unique preference key
 */
interface RestoreOnBootPreference {
    /**
     * This function restores the preference after boot is completed
     */
    fun restoreState(context: Context)

    /** Returns the preference key for the class that implements this interface */
    fun getPreferenceKey(): String
}