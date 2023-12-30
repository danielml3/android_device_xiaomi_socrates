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
#define LOG_TAG "android.hardware.biometrics.fingerprint@2.3-service"
#define LOG_VERBOSE "android.hardware.biometrics.fingerprint@2.3-service"

#include <hardware/hardware.h>
#include <hardware/fingerprint.h>
#include "BiometricsFingerprint.h"

#include <inttypes.h>
#include <unistd.h>

#define CMD_FOD_LHBM_STATUS 4
#define CMD_TOUCH_FOD_ENABLE 1001

namespace android {
namespace hardware {
namespace biometrics {
namespace fingerprint {
namespace V2_3 {
namespace implementation {

using RequestStatus =
        android::hardware::biometrics::fingerprint::V2_1::RequestStatus;

BiometricsFingerprint *BiometricsFingerprint::sInstance = nullptr;

BiometricsFingerprint::BiometricsFingerprint() {
    sInstance = this;
    mClientCallback = nullptr;

    m2_1Service = IBiometricsFingerprint2_1::getService();
    if (m2_1Service == nullptr) {
        ALOGE("2.1 fingerprint service not available");
        return;
    } else {
        ALOGI("Successfully bound 2.1 fingerprint service");
    }

    mExtension = IXiaomiFingerprint::getService();
    if (mExtension == nullptr) {
        ALOGE("Fingerprint extension not available");
        return;
    } else {
        ALOGI("Successfully bound fingerprint extension");
    }

    mTouchFeature = ITouchFeature::getService();
    if (mTouchFeature == nullptr) {
        ALOGE("TouchFeature not available");
        return;
    } else {
        ALOGI("Successfully bound TouchFeature");
    }
}

BiometricsFingerprint::~BiometricsFingerprint() {
    m2_1Service = nullptr;
    mExtension = nullptr;
    mTouchFeature = nullptr;
    mClientCallback = nullptr;
}

Return<uint64_t> BiometricsFingerprint::setNotify(
        const sp<IBiometricsFingerprintClientCallback>& clientCallback) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    mClientCallback = clientCallback;
    return m2_1Service->setNotify(clientCallback == nullptr ? nullptr : this);
}

Return<uint64_t> BiometricsFingerprint::preEnroll()  {
    return m2_1Service->preEnroll();
}

Return<RequestStatus> BiometricsFingerprint::enroll(const hidl_array<uint8_t, 69>& hat,
        uint32_t gid, uint32_t timeoutSec) {
    return m2_1Service->enroll(hat, gid, timeoutSec);
}

Return<RequestStatus> BiometricsFingerprint::postEnroll() {
    return m2_1Service->postEnroll();
}

Return<uint64_t> BiometricsFingerprint::getAuthenticatorId() {
    return m2_1Service->getAuthenticatorId();
}

Return<RequestStatus> BiometricsFingerprint::cancel() {
    return m2_1Service->cancel();
}

Return<RequestStatus> BiometricsFingerprint::enumerate()  {
    return m2_1Service->enumerate();
}

Return<RequestStatus> BiometricsFingerprint::remove(uint32_t gid, uint32_t fid) {
    return m2_1Service->remove(gid, fid);
}

Return<RequestStatus> BiometricsFingerprint::setActiveGroup(uint32_t gid,
        const hidl_string& storePath) {
    return m2_1Service->setActiveGroup(gid, storePath);
}

Return<RequestStatus> BiometricsFingerprint::authenticate(uint64_t operationId,
        uint32_t gid) {
    return m2_1Service->authenticate(operationId, gid);
}

Return<bool> BiometricsFingerprint::isUdfps(uint32_t /*sensorId*/) {
    return true;
}

Return<void> BiometricsFingerprint::onFingerDown(uint32_t, uint32_t, float, float) {
    setFodPressed(true);
    return Void();
}

Return<void> BiometricsFingerprint::onFingerUp() {
    setFodPressed(false);
    return Void();
}

// Start of IBiometricsFingerprintClientCallback

Return<void> BiometricsFingerprint::onEnrollResult(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    return mClientCallback->onEnrollResult(deviceId, fingerId, groupId, remaining);
}

Return<void> BiometricsFingerprint::onAcquired(uint64_t deviceId, FingerprintAcquiredInfo acquiredInfo, int32_t vendorCode) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);

    if (acquiredInfo != FingerprintAcquiredInfo::ACQUIRED_VENDOR) {
        mTouchFeature->setTouchMode(0, CMD_TOUCH_FOD_ENABLE, 0);
    }

    return mClientCallback->onAcquired(deviceId, acquiredInfo, vendorCode);
}

Return<void> BiometricsFingerprint::onAuthenticated(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, const hidl_vec<uint8_t>& token) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    return mClientCallback->onAuthenticated(deviceId, fingerId, groupId, token);
}

Return<void> BiometricsFingerprint::onError(uint64_t deviceId, FingerprintError error, int32_t vendorCode) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    return mClientCallback->onError(deviceId, error, vendorCode);
}
Return<void> BiometricsFingerprint::onRemoved(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    return mClientCallback->onRemoved(deviceId, fingerId, groupId, remaining);
}
Return<void> BiometricsFingerprint::onEnumerate(uint64_t deviceId, uint32_t fingerId, uint32_t groupId, uint32_t remaining) {
    std::lock_guard<std::mutex> lock(mClientCallbackMutex);
    return mClientCallback->onEnumerate(deviceId, fingerId, groupId, remaining);
}

// End of IBiometricsFingerprintClientCallback

void BiometricsFingerprint::setFodPressed(bool pressed) {
    mExtension->extCmd(CMD_FOD_LHBM_STATUS, pressed);
    mTouchFeature->setTouchMode(0, CMD_TOUCH_FOD_ENABLE, pressed);
}

IBiometricsFingerprint* BiometricsFingerprint::getInstance() {
    if (!sInstance) {
      sInstance = new BiometricsFingerprint();
    }
    return sInstance;
}

} // namespace implementation
}  // namespace V2_1
}  // namespace fingerprint
}  // namespace biometrics
}  // namespace hardware
}  // namespace android
