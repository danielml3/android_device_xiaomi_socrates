/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ANDROID_HARDWARE_BIOMETRICS_FINGERPRINT_V2_3_BIOMETRICSFINGERPRINT_H
#define ANDROID_HARDWARE_BIOMETRICS_FINGERPRINT_V2_3_BIOMETRICSFINGERPRINT_H

#include <log/log.h>
#include <android/log.h>
#include <hardware/hardware.h>
#include <hardware/fingerprint.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>
#include <android/hardware/biometrics/fingerprint/2.3/IBiometricsFingerprint.h>
#include <android/hardware/biometrics/fingerprint/2.1/IBiometricsFingerprintClientCallback.h>
#include <android/hardware/biometrics/fingerprint/2.1/types.h>

#include <vendor/xiaomi/hw/touchfeature/1.0/ITouchFeature.h>
#include <vendor/xiaomi/hardware/fingerprintextension/1.0/IXiaomiFingerprint.h>

namespace android {
namespace hardware {
namespace biometrics {
namespace fingerprint {
namespace V2_3 {
namespace implementation {

using ::android::hardware::biometrics::fingerprint::V2_3::IBiometricsFingerprint;
using ::android::hardware::biometrics::fingerprint::V2_1::IBiometricsFingerprintClientCallback;
using ::android::hardware::biometrics::fingerprint::V2_1::FingerprintAcquiredInfo;
using ::android::hardware::biometrics::fingerprint::V2_1::FingerprintError;
using ::android::hardware::biometrics::fingerprint::V2_1::RequestStatus;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::hardware::hidl_vec;
using ::android::hardware::hidl_string;
using ::android::sp;

using IBiometricsFingerprint2_1 = ::android::hardware::biometrics::fingerprint::V2_1::IBiometricsFingerprint;

using ::vendor::xiaomi::hw::touchfeature::V1_0::ITouchFeature;
using ::vendor::xiaomi::hardware::fingerprintextension::V1_0::IXiaomiFingerprint;

struct BiometricsFingerprint : public IBiometricsFingerprint, public IBiometricsFingerprintClientCallback {
public:
    BiometricsFingerprint();
    ~BiometricsFingerprint();

    // Method to wrap legacy HAL with BiometricsFingerprint class
    static IBiometricsFingerprint* getInstance();

    // Methods from ::android::hardware::biometrics::fingerprint::V2_1::IBiometricsFingerprint follow.
    Return<uint64_t> setNotify(const sp<IBiometricsFingerprintClientCallback>& clientCallback) override;
    Return<uint64_t> preEnroll() override;
    Return<RequestStatus> enroll(const hidl_array<uint8_t, 69>& hat, uint32_t gid, uint32_t timeoutSec) override;
    Return<RequestStatus> postEnroll() override;
    Return<uint64_t> getAuthenticatorId() override;
    Return<RequestStatus> cancel() override;
    Return<RequestStatus> enumerate() override;
    Return<RequestStatus> remove(uint32_t gid, uint32_t fid) override;
    Return<RequestStatus> setActiveGroup(uint32_t gid, const hidl_string& storePath) override;
    Return<RequestStatus> authenticate(uint64_t operationId, uint32_t gid) override;

    Return<bool> isUdfps(uint32_t sensorId) override;
    Return<void> onFingerDown(uint32_t x, uint32_t y, float minor, float major) override;
    Return<void> onFingerUp() override;

    // Start of IBiometricsFingerprintClientCallback
    Return<void> onEnrollResult(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) override;
    Return<void> onAcquired(uint64_t deviceId, FingerprintAcquiredInfo acquiredInfo, int32_t vendorCode) override;
    Return<void> onAuthenticated(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, const hidl_vec<uint8_t>& token) override;
    Return<void> onError(uint64_t deviceId, FingerprintError error, int32_t vendorCode) override;
    Return<void> onRemoved(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) override;
    Return<void> onEnumerate(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) override;
    // End of IBiometricsFingerprintClientCallback
private:
    static BiometricsFingerprint* sInstance;
    android::sp<IBiometricsFingerprint2_1> m2_1Service;
    android::sp<IXiaomiFingerprint> mExtension;
    android::sp<ITouchFeature> mTouchFeature;
    android::sp<IBiometricsFingerprintClientCallback> mClientCallback;
    std::mutex mClientCallbackMutex;

    void setFODPressListenEnabled(bool enabled);

};

}  // namespace implementation
}  // namespace V2_3
}  // namespace fingerprint
}  // namespace biometrics
}  // namespace hardware
}  // namespace android

#endif  // ANDROID_HARDWARE_BIOMETRICS_FINGERPRINT_V2_1_BIOMETRICSFINGERPRINT_H
