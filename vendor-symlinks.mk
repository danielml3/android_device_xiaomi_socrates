$(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64/libvndfwk_detect_jni.qti_vendor.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/lib64/libvndfwk_detect_jni.qti_vendor.so,$(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64/libvndfwk_detect_jni.qti_vendor.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64/libvndfwk_detect_jni.qti_vendor.so
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/kiwi/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/kiwi/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/kiwi_v2/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/kiwi_v2/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/qca6490/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/qca6490/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/firmware/wlanmdsp.mbn,$(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate
$(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libEGL_adreno.so,$(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so
$(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libGLESv2_adreno.so,$(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so
$(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libq3dtools_adreno.so,$(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so
$(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/odm/lib64/camera/aon_front.pb,$(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb
$(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libEGL_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so
$(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libGLESv2_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so
$(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libq3dtools_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/hlos
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/modem,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/ramdumps
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/apq/gnss,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/readwrite
$(TARGET_OUT_VENDOR)/rfs/apq/gnss/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/apq/gnss/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/apq/gnss/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/lpass,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/adsp,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/adsp/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/adsp/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/cdsp,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/cdsp,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/cdsp/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/modem,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/mpss,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/mpss/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/mpss/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/slpi,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/slpi,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/slpi/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/slpi/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/tn,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/tn,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/tn/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/tn/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/tn/shared
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/hlos
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/wpss,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/ramdumps
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/mdm/wpss,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/readwrite
$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/mdm/wpss/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/mdm/wpss/shared
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/hlos
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/lpass,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/ramdumps
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/msm/adsp,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/readwrite
$(TARGET_OUT_VENDOR)/rfs/msm/adsp/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/adsp/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/adsp/shared
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/hlos
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/cdsp,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/ramdumps
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/msm/cdsp,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/readwrite
$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/cdsp/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/shared
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/hlos
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/modem,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/ramdumps
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/mbnconfig: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/mbnconfig,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/mbnconfig)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/mbnconfig
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/msm/mpss,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/readwrite
$(TARGET_OUT_VENDOR)/rfs/msm/mpss/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/mpss/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/mpss/shared
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/hlos
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/slpi,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/ramdumps
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/msm/slpi,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/readwrite
$(TARGET_OUT_VENDOR)/rfs/msm/slpi/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/slpi/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/slpi/shared
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/hlos: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/hlos_rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/hlos)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/hlos
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/ramdumps: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/tombstones/rfs/wpss,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/ramdumps)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/ramdumps
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware_mnt,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/vendor/firmware: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/firmware,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/vendor/firmware)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/readonly/vendor/firmware
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readwrite: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/msm/wpss,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/readwrite)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/readwrite
$(TARGET_OUT_VENDOR)/rfs/msm/wpss/shared: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/rfs/shared,$(TARGET_OUT_VENDOR)/rfs/msm/wpss/shared)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/rfs/msm/wpss/shared
