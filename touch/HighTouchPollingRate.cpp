/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.touch@1.0-service.socrates"

#include "HighTouchPollingRate.h"

#include <android-base/logging.h>
#include <stdio.h>

#define POLLING_RATE_PATH "/sys/devices/platform/goodix_ts.0/switch_report_rate"
#define HIGH_POLLING_RATE_VALUE 480

namespace vendor::lineage::touch::implementation::V1_0 {

HighTouchPollingRate* HighTouchPollingRate::sInstance = nullptr;

HighTouchPollingRate::HighTouchPollingRate() {
}

HighTouchPollingRate::~HighTouchPollingRate() {
    sInstance = nullptr;
}

// Methods from ::vendor::lineage::touch::V1_0::IHighTouchPollingRate follow.
Return<bool> HighTouchPollingRate::isEnabled() {
    FILE *node = fopen(POLLING_RATE_PATH, "rt");
    int polling_rate = 0;

    if (node == nullptr) {
        LOG(ERROR) << "Could not open " << POLLING_RATE_PATH;
    }

    fscanf(node, "%*[^0-9]%d", &polling_rate);
    fclose(node);

    LOG(INFO) << "Polling rate is " << polling_rate;
    return polling_rate == HIGH_POLLING_RATE_VALUE;
}

Return<bool> HighTouchPollingRate::setEnabled(bool enabled) {
    FILE *node = fopen(POLLING_RATE_PATH, "wt");
    if  (node == nullptr) {
        LOG(ERROR) << "Could not open " << POLLING_RATE_PATH;
        return false;
    }

    if (fprintf(node, "%d", enabled) < 0) {
        LOG(ERROR) << "Could not write to " << POLLING_RATE_PATH;
        return false;
    }

    fclose(node);
    return enabled;
}

IHighTouchPollingRate* HighTouchPollingRate::getInstance() {
    if (sInstance == nullptr) {
        sInstance = new HighTouchPollingRate();
    }

    return sInstance;
}

}  // namespace vendor::lineage::touch::implementation::V1_0
