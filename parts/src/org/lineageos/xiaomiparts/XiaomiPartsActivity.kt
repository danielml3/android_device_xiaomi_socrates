/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.xiaomiparts

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity

import org.lineageos.xiaomiparts.fragments.MainSettingsFragment

class XiaomiPartsActivity : CollapsingToolbarBaseActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        supportFragmentManager.beginTransaction()
            .replace(com.android.settingslib.widget.R.id.content_frame, MainSettingsFragment())
            .commit()
    }
}