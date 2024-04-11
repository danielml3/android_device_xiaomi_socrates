/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.touch@1.0-service.socrates"

#include <android-base/logging.h>
#include <hidl/HidlSupport.h>
#include <hidl/HidlTransportSupport.h>

#include "HighTouchPollingRate.h"

using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;
using android::sp;

using vendor::lineage::touch::implementation::V1_0::HighTouchPollingRate;
using vendor::lineage::touch::V1_0::IHighTouchPollingRate;

int main() {
    android::sp<IHighTouchPollingRate> touchPollingRate = HighTouchPollingRate::getInstance();
    configureRpcThreadpool(1, true /*callerWillJoin*/);

    if (touchPollingRate == nullptr) {
        LOG(ERROR) << "Can't create instance of IHighTouchPollingRate";
        return 1;
    }

    if (touchPollingRate->registerAsService() != ::android::OK) {
        LOG(ERROR) << "Can't register instance of IHighTouchPollingRate";
        return 1;
    }
    LOG(INFO) << "Successfully registered IHighTouchPollingRate";

    joinRpcThreadpool();
    return 0;
}
