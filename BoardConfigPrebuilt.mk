PREBUILT_PATH := device/xiaomi/socrates-prebuilt

AB_OTA_PARTITIONS += \
    odm \
    vendor \
    vendor_boot \
    vendor_dlkm

# Kernel (prebuilt)
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/images/dtbo.img

# Kernel modules (prebuilt)
RAMDISK_MODULES_PATH := $(PREBUILT_PATH)/modules/ramdisk
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(RAMDISK_MODULES_PATH)/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD  := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(RAMDISK_MODULES_PATH)/modules.blocklist

# Partitions (prebuilt)
BOARD_PREBUILT_ODMIMAGE := $(PREBUILT_PATH)/images/odm.img
BOARD_PREBUILT_VENDORIMAGE := $(PREBUILT_PATH)/images/vendor.img
BOARD_PREBUILT_VENDOR_DLKMIMAGE := $(PREBUILT_PATH)/images/vendor_dlkm.img

BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST += odm vendor vendor_dlkm
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
