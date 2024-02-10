DEVICE_PATH := device/xiaomi/socrates

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# API level
BOARD_API_LEVEL := 33
BOARD_SHIPPING_API_LEVEL := 33

SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

# Audio
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_AGM_HIDL := true
AUDIO_FEATURE_ENABLED_LSM_HIDL := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_KEEP_ALIVE := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
TARGET_USES_QCOM_MM_AUDIO := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 540

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# Hardware
BOARD_USES_QCOM_HARDWARE := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_socrates

# Kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096

BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 disable_dma32=on swinfo.fingerprint=$(LINEAGE_VERSION) mtdoops.fingerprint=$(LINEAGE_VERSION)

BOARD_BOOTCONFIG := androidboot.hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=a600000.dwc3 androidboot.console=ttyMSM0
BOARD_BOOTCONFIG += androidboot.selinux=permissive

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_RAMDISK_USE_LZ4 := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_INIT_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/xiaomi/socrates
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/kalama_GKI.config \
    vendor/socrates_GKI.config
KERNEL_LTO := none

BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/dtb/dtbo.img
BOARD_CUSTOM_DTBIMG_MK := $(DEVICE_PATH)/dtb/dtb.mk

# Kernel (modules)
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/xiaomi/socrates-modules
TARGET_KERNEL_EXT_MODULES := \
	qcom/opensource/mmrm-driver \
	qcom/opensource/mm-drivers/hw_fence \
	qcom/opensource/mm-drivers/msm_ext_display \
	qcom/opensource/mm-drivers/sync_fence \
	qcom/opensource/audio-kernel \
	qcom/opensource/camera-kernel \
	qcom/opensource/dataipa/drivers/platform/msm \
	qcom/opensource/datarmnet/core \
	qcom/opensource/datarmnet-ext/aps \
	qcom/opensource/datarmnet-ext/offload \
	qcom/opensource/datarmnet-ext/shs \
	qcom/opensource/datarmnet-ext/perf \
	qcom/opensource/datarmnet-ext/perf_tether \
	qcom/opensource/datarmnet-ext/sch \
	qcom/opensource/datarmnet-ext/wlan \
	qcom/opensource/securemsm-kernel \
	qcom/opensource/display-drivers/msm \
	qcom/opensource/eva-kernel \
	qcom/opensource/video-driver \
	qcom/opensource/graphics-kernel \
	qcom/opensource/wlan/platform \
	qcom/opensource/wlan/qcacld-3.0/.kiwi_v2 \
	qcom/opensource/bt-kernel \
	nxp/opensource/driver

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.dlkm))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist.dlkm
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.first_stage))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD  := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist.ramdisk
BOOT_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/modules.list))

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_SUPER_PARTITION_SIZE := 9663676416

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_METADATA_PARTITION := true

BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_dlkm system_ext vendor vendor_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9659482112 # (BOARD_SUPER_PARTITION_SIZE - 4 MiB)
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions

$(foreach p, $(call to-upper, $(BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST)), \
    $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4) \
    $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

include vendor/lineage/config/BoardConfigReservedSize.mk

# Platform
TARGET_BOARD_PLATFORM := kalama
TARGET_BOOTLOADER_BOARD_NAME := kalama

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SEPolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk

# System properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Vibrator
TARGET_QTI_VIBRATOR_EFFECT_LIB := libqtivibratoreffect.xiaomi
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM := true

# VINTF
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/framework_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest.xml

# Vendor security patch
VENDOR_SECURITY_PATCH := 2023-11-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
CONFIG_IEEE80211AX := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

include vendor/xiaomi/socrates/BoardConfigVendor.mk
