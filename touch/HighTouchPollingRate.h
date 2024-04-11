/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <vendor/lineage/touch/1.0/IHighTouchPollingRate.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>

namespace vendor::lineage::touch::implementation::V1_0 {

using ::android::hardware::hidl_array;
using ::android::hardware::hidl_memory;
using ::android::hardware::hidl_string;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::sp;

using ::vendor::lineage::touch::V1_0::IHighTouchPollingRate;

struct HighTouchPollingRate : IHighTouchPollingRate {
public:
    HighTouchPollingRate();
    ~HighTouchPollingRate();

    // Methods from ::vendor::lineage::touch::V1_0::IHighTouchPollingRate follow.
    Return<bool> isEnabled() override;
    Return<bool> setEnabled(bool enabled) override;

    static IHighTouchPollingRate* getInstance();
private:
    static HighTouchPollingRate *sInstance;
};

}  // namespace vendor::lineage::touch::implementation
