# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti.recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fstab (ramdisk)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_EXTRA_VNDK_VERSIONS := $(PRODUCT_SHIPPING_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Updatable APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier
