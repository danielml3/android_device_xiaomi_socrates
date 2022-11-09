# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    audio.primary.default \
    audio.r_submix.default \
    libtinycompress \
    libeffectsconfig.vendor

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.soundtrigger@2.3-impl

# Automotive
PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@2.0-manager-lib \
    android.automotive.watchdog-V2-ndk.vendor

# ANT
PRODUCT_PACKAGES += \
    com.dsi.ant@1.0.vendor

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# AuthSecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1.vendor \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.audio-V2-ndk.vendor \
    vendor.qti.hardware.bluetooth.audio-V1-ndk.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor \
    audio.bluetooth.default \
    libbluetooth_audio_session

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery

# Camera
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor \
    android.hardware.camera.provider@2.7.vendor \
    android.hardware.camera.common-V1-ndk.vendor \
    android.hardware.camera.device-V1-ndk.vendor \
    android.hardware.camera.provider-V1-ndk.vendor

PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera.aon@1.3.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# CapabilityConfigstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# CAS
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4.vendor \
    vendor.qti.hardware.display.allocator@3.0.vendor \
    vendor.qti.hardware.display.allocator@4.0.vendor \
    vendor.qti.hardware.display.composer@3.1.vendor \
    vendor.qti.hardware.display.demura@2.0.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.3.vendor \
    libdrm.vendor

PRODUCT_PACKAGES += \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.3.vendor

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# DumpState
PRODUCT_PACKAGES += \
    android.hardware.dumpstate-V1-ndk.vendor

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Filesystem
PRODUCT_PACKAGES += \
    libext2_uuid.vendor \
    libsparse.vendor

# Framework detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect.vendor \
    libqti_vndfwk_detect_vendor \
    libvndfwk_detect_jni.qti.vendor \
    libvndfwk_detect_jni.qti_vendor

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Graphics
PRODUCT_PACKAGES += \
    gralloc.default

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss-V2-ndk.vendor

# GUI
PRODUCT_PACKAGES += \
    libgui_vendor

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health@2.1.vendor \
    android.hardware.health-V1-ndk.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    libhwbinder.vendor \
    libhidltransport.vendor

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-V4-ndk.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.socrates.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.socrates.rc \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

# JSON
PRODUCT_PACKAGES += \
    libjson

# Libchrome
PRODUCT_PACKAGES += \
    libchrome.vendor

# Light
PRODUCT_PACKAGES += \
    android.hardware.light-V2-ndk.vendor

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    libcodec2_hidl@1.2.vendor \
    libsfplugin_ccodec_utils \
    libstagefright_amrnb_common.vendor \
    libstagefright_enc_common.vendor \
    libstagefright_flacdec.vendor \
    libavservices_minijail.vendor \
    libcodec2_soft_common.vendor \
    libvorbisidec.vendor \
    libvpx.vendor

# Network
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor \
    libnetfilter_conntrack \
    libnfnetlink \
    libpcap.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    nqnfcinfo

# Overlay
PRODUCT_PACKAGES += \
    FrameworkResOverlaySocrates \
    SystemUIOverlaySocrates

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor \
    android.hardware.power-V3-ndk.vendor \
    android.hardware.power-V4-ndk.vendor \
    vendor.qti.hardware.perf@2.3.vendor

# ProtoBuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full.vendor \
    libprotobuf-cpp-lite.vendor \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat
# PSI
PRODUCT_PACKAGES += \
    libpsi

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.config-V1-ndk.vendor \
    android.hardware.radio-V1-ndk.vendor \
    android.hardware.radio.sim-V1-ndk.vendor \
    android.hardware.radio.messaging-V1-ndk.vendor \
    android.hardware.radio.modem-V1-ndk.vendor \
    android.hardware.radio.network-V1-ndk.vendor \
    android.hardware.radio.voice-V1-ndk.vendor \
    android.hardware.radio.data-V1-ndk.vendor \
    libril

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# SecureElement
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Security
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@3.0.vendor \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.security.keymint-V1-ndk.vendor \
    android.hardware.security.keymint-V2-ndk.vendor \
    android.hardware.security.rkp-V1-ndk.vendor \
    android.hardware.security.rkp-V3-ndk.vendor \
    android.hardware.security.sharedsecret-V1-ndk.vendor \
    android.system.keystore2-V1-ndk.vendor \
    android.hardware.hardware_keystore.xml \
    libkeymaster_messages.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    sensors.dynamic_sensor_hal \
    libsensorndkbridge \
    android.frameworks.sensorservice@1.0.vendor

# ServiceTracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2.vendor

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml

# Tethering
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0.vendor \
    android.hardware.tetheroffload.control@1.1.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti-v2

# TrustedUI
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Updatable APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service-qti \
    android.hardware.usb.gadget@1.2-service-qti \
    audio.usb.default \
    usb_compositions.conf

# Vendor configurations
$(call inherit-product, vendor/xiaomi/socrates/socrates-vendor.mk)

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v33/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vndk/libstagefright_foundation.so \
    prebuilts/vndk/v33/arm64/arch-arm-armv8-a/shared/vndk-core/libstagefright_bufferqueue_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib/vndk/libstagefright_bufferqueue_helper.so

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservice \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-V1-ndk_platform.vendor

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0.vendor \
    android.hardware.wifi.supplicant@1.0.vendor \
    android.hardware.wifi@1.6.vendor \
    android.hardware.wifi.hostapd-V1-ndk.vendor \
    android.hardware.wifi.supplicant-V1-ndk.vendor \
    android.system.wifi.keystore@1.0.vendor \
    vendor.qti.hardware.wifi.supplicant-V1-ndk.vendor
