/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.xiaomiparts.touch

import java.io.File

class TouchCmdUtil {
    companion object {
        private const val TOUCH_CMD_NODE = "/sys/devices/virtual/touch/touch_dev/touch_thp_cmd"
        private const val TOUCH_ID = 0

        // Command types
        private const val TOUCH_CMD_TYPE_SET = 0

        // Touch modes
        const val GAME_MODE = 0

        fun setTouchMode(mode: Int, modeValue: Int) {
            // Command format: touch_id,cmd_type,mode,value
            File(TOUCH_CMD_NODE).writeText(
                "$TOUCH_ID,$TOUCH_CMD_TYPE_SET,$mode,$modeValue"
            )
        }
    }
}