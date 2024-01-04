#!/bin/bash

set -e

VENDOR_ODM_PATH=$(readlink -f $1)
VENDOR_PROP_FILE=proprietary-files-vendor.txt
VENDOR_SYMLINKS_MK=vendor-symlinks.mk

VENDOR_SKIP_FILES=(
    # Apps DEX
    "*.odex"
    "*.vdex"

    # Audio
    "*/etc/acdbdata/nn_ns_models/*"
    "*android.hardware.audio*.so"
    "*android.hardware.soundtrigger*.so"
    "*/soundfx/libaudiopreprocessing.so"
    "*/soundfx/libbundlewrapper.so"
    "*/soundfx/libdownmix.so"
    "*/soundfx/libdynproc.so"
    "*/soundfx/libeffectproxy.so"
    "*/soundfx/libhapticgenerator.so"
    "*/soundfx/libldnhncr.so"
    "*/soundfx/libreverbwrapper.so"
    "*/soundfx/libvisualizer.so"
    "*/libmemunreachable.so"
    "*/audio.primary.default.so"
    "*/audio.r_submix.default.so"
    "*/libnbaio_mono.so"
    "*/libalsautils.so"
    "*/libtinycompress.so"

    # Automotive
    "*/android.hardware.automotive.vehicle*.so"
    "*/android.automotive.watchdog-V2-ndk.so"

    # ADSP
    "*/lib/rfsa/adsp/libvpt_action_recognition.so"
    "vendor/lib/rfsa/adsp/*.bin"

    # ANT
    "*/com.dsi.ant@1.0.so"

    # Atrace
    "*/android.hardware.atrace*"

    # AuthSecret
    "*/android.hardware.authsecret@1.0.so"

    # Biometrics
    "*/android.hardware.biometrics.face*"
    "*/android.hardware.biometrics.common-V2-ndk.so"
    "*/android.hardware.biometrics.fingerprint@2.1.so"
    "*/etc/vintf/manifest/face-default.xml"
    "*/*miface*"

    # Bluetooth
    "*/android.hardware.bluetooth@1.[0-1].so"
    "*/android.hardware.bluetooth.audio@2.[0-1].so"
    "*/android.hardware.bluetooth.audio@2.0-impl.so"
    "*/vendor.qti.hardware.bluetooth.audio-V1-ndk.so"
    "*/vendor.qti.hardware.bluetooth_audio@2.[0-1].so"
    "*/vendor.qti.hardware.btconfigstore@1.0.so"
    "*/vendor.qti.hardware.btconfigstore@2.0.so"
    "*/audio.bluetooth.default.so"
    "*/libbluetooth_audio_session.so"
    "*/libbluetooth_audio_session_aidl.so"

    # Boot control
    "*android.hardware.boot*"
    "*/libboot_control_qti.so"

    # BoringSSL
    "*/boringssl*"

    # Build properties
    "*build.prop"

    # CapabilityConfigstore
    "*/vendor.qti.hardware.capabilityconfigstore@1.0.so"

    # Camera plugins
    "*/com.xiaomi.plugin.deflicker.so"
    "*/com.xiaomi.plugin.supermoon.so"
    "*/com.xiaomi.plugin.frontbokeh.so"
    "*/com.xiaomi.plugin.miaiie.so"

    # Camera
    "*/libcamera2ndk_vendor.so"
    "*/android.hardware.camera*.so"
    "*/android.frameworks.cameraservice*.so"
    "*/vendor.qti.hardware.camera.aon@1.[0-3].so"
    "*/vendor.qti.hardware.camera.postproc@1.0.so"

    # Camera files
    "*/etc/audio/test.wav"
    "*/etc/camera/facesr_hd_composite_ref_4.3.15_qcom8550_qnn_segqnn_qnn2.3_qualityv35r2.model"
    "*/etc/camera/mialgo_nn_xmi_slmt_4x_1080p.bin"
    "*/etc/camera/mialgo_nn_xmi_slmt_4x_720p.bin"
    "*/etc/camera/night_align_lsc_tbl_40962304.bin"
    "*/etc/camera/night_align_lsc_tbl_40963072.bin"
    "*/etc/camera/facefocus_models"
    "*/etc/camera/resources*"
    "*/etc/camera/snsc.bin"
    "*/etc/merged_language_model.lat"
    "*/etc/XiaoAiNiZaiNa.uim"
    "*/etc/XiaoAiTongXue.uim"
    "*/lib64/libarcsoft_bokeh_high_dynamic_range.so"
    "*/lib64/libarcsoft_dualcam_refocus_image.so"
    "*/lib64/libarcsoft_super_night_raw.so"
    "*/lib64/libmiai_portraitsupernight.so"
    "*/lib64/libportrait_repair_qnn.so"
    "*/lib64/libsupermoon.so"
    "*/lib64/libTrueSight.so"
    "*/lib/camera/com.qti.tuned.*.bin"
    "*/etc/camera/aivs*"
    "*/etc/camera/altekldc*"
    "*/etc/camera/*.anc"
    "*/etc/camera/af_*.dlc"
    "*/etc/camera/deblur_*.dlc"
    "*/etc/camera/xmi*.dlc"
    "*/etc/camera/*.png"
    "*/lib64/libmiai*"
    "*/lib64/libxmi*"

    # CAS
    "*/android.hardware.cas*"

    # Charger
    "vendor/etc/res/images/default/charger/*"

    # Display
    "*/android.hardware.graphics.composer*.so"
    "*/vendor.display.config*.so"
    "*/vendor.qti.hardware.display.allocator*.so"
    "*/vendor.qti.hardware.display.composer*.so"
    "*/vendor.qti.hardware.display.demura*.so"
    "*/vendor.qti.hardware.display.mapper*.so"
    "*/libdrm.so"

    # DRM
    "*/android.hardware.drm*clearkey*"
    "*/android.hardware.drm@1.[0-3].so"

    # Filesystem
    "*/etc/fs_config_*"
    "*/libext2_uuid.so"
    "*/libsparse.so"

    # Framework detect
    "*/libqti_vndfwk_detect.so"
    "*/libqti_vndfwk_detect_vendor.so"
    "*/libvndfwk_detect_jni.qti.so"
    "*/libvndfwk_detect_jni.qti_vendor.so"

    # FSTAB
    "vendor/etc/fstab.qcom"

    # Graphics
    "*/gralloc.default.so"

    # GUI
    "*/libgui_vendor.so"

    # Health
    "*/android.hardware.health-service.qti*"
    "*/android.hardware.health@1.0.so"
    "*/android.hardware.health@2.[0-1].so"

    # HIDL
    "*/android.hidl.allocator@1.0.so"
    "*/android.hidl.memory.block@1.0.so"
    "*/libhidltransport.so"
    "*/libhwbinder.so"

    # IR
    "*/android.hardware.ir-service.example*"

    # JSON
    "*/libjson.so"

    # Libchrome
    "*/libchrome.so"

    # Media
    "*android.hardware.media.omx*"
    "*/android.hardware.media.c2*.so"
    "*/libcodec2_hidl*"
    "*/libcodec2_vndk*"
    "*/libcodec2_soft_common.so"
    "*/lib64/libCOSNet_spatial_qnn_quantized.so"
    "*/libstagefright_bufferpool*.so"
    "*/libstagefright_soft*.so"
    "*/mediacas/*"
    "*/mediadrm/*"
    "*/libmediautils_vendor.so"
    "*/libeffects.so"
    "*/libeffectproxy.so"
    "*/libeffectsconfig.so"
    "*/libopus.so"
    "*/libvorbisidec.so"
    "*/libvpx.so"
    "*/libsfplugin_ccodec_utils.so"
    "*/libstagefright_amrnb_common.so"
    "*/libstagefright_enc_common.so"
    "*/libstagefright_flacdec.so"
    "*/libavservices_minijail.so"

    # Memtrack
    "*/vendor.qti.hardware.memtrack-service"
    "*/memtrack_qti*"

    # Misc
    "*/etc/group"
    "*/etc/passwd"

    # Network
    "*/android.system.net.netd@1.[0-1].so"
    "*/libnetfilter_conntrack.so"
    "*/libnfnetlink.so"
    "*/libpcap.so"

    # NFC
    "*/android.hardware.nfc*.so"
    "*/nqnfcinfo"

    # Power
    "*/android.hardware.power*.so"
    "*/vendor.qti.hardware.perf*.so"
    "*/power.default.so"

    # ProtoBuf
    "*/libprotobuf-cpp-full-3.9.1.so"
    "*/libprotobuf-cpp-lite-3.9.1.so"

    # PSI
    "*/libpsi.so"

    # Radio
    "*/android.hardware.radio*.so"
    "*/libril.so"
    "*/librilutils.so"
    "*/libreference-ril.so"

    # RenderScript
    "*/android.hardware.renderscript@1.0-impl.so"

    # SecureElement
    "*/android.hardware.secure_element@1.[0-2].so"

    # Security
    "*/android.hardware.gatekeeper@1.0.so"
    "*/android.hardware.keymaster@3.0.so"
    "*/android.hardware.keymaster@4.[0-1].so"
    "*/android.hardware.security.keymint-V1-ndk.so"
    "*/android.system.keystore2-V1-ndk.so"
    "*/android.hardware.hardware_keystore.xml"
    "*/libkeymaster_messages.so"

    # SELinux
    "*/selinux/*"

    # Sensors
    "*/android.hardware.sensors*.so"
    "*/android.hardware.sensors*multihal*"
    "*/android.frameworks.sensorservice*"
    "*/libhidparser.so"
    "*/libsensorndkbridge.so"
    "*/sensors.dynamic_sensor_hal.so"

    # ServiceTracker
    "*/vendor.qti.hardware.servicetracker@1.[0-2].so"

    # Tethering
    "*/android.hardware.tetheroffload.config@1.0.so"
    "*/android.hardware.tetheroffload.control@1.[0-1].so"

    # Thermal
    "*/android.hardware.thermal*"

    # Time
    "*/local_time.default.so"

    # TrustedUI
    "*/vendor.qti.hardware.systemhelper@1.0.so"

    # USB
    "*/android.hardware.usb*.so"
    "*/audio.usb.default.so"
    "*/android.hardware.usb.gadget*"
    "*/usb_compositions.conf"

    # Vendor binaries
    "vendor/bin/awk"
    "vendor/bin/boringssl_self_test32"
    "vendor/bin/boringssl_self_test64"
    "vendor/bin/checkpoint_gc"
    "vendor/bin/cplay"
    "vendor/bin/dumpsys"
    "vendor/bin/iw"
    "vendor/bin/logwrapper"
    "vendor/bin/sh"
    "vendor/bin/tcpdump"
    "vendor/bin/toolbox"
    "vendor/bin/toybox_vendor"
    "vendor/etc/mkshrc"
    "*/libbinderdebug.so"

    # Vendor service manager
    "*/bin/vndservice*"
    "*/etc/init/vndservice*"

    # Vibrator
    "*/vibrator.default.so"
    "*/android.hardware.vibrator-V1-ndk_platform.so"
    "*/libvibrator.so"

    # VINTF manifests and fragments
    "*/etc/vintf/manifest.xml"
    "*/etc/vintf/manifest_*.xml"
    "vendor/etc/vintf/compatibility_matrix.xml"
    "vendor/etc/vintf/manifest/c2_manifest_vendor.xml"

    # WiFi
    "*/android.hardware.wifi@1.[0-6].so"
    "*/android.hardware.wifi.hostapd@1.0.so"
    "*/android.hardware.wifi.supplicant@1.0.so"
    "*/vendor.qti.hardware.wifi.supplicant-V1-ndk.so"
    "*/android.system.wifi.keystore@1.0.so"
)

declare -A VENDOR_MODULE_DEST

VENDOR_MODULE_DEST=(
)

VENDOR_MODULE_FILES=(
    "*.apk"
    "*/overlay/*"
)

VENDOR_SKIP_LINKS=(
    "*/bin/*"
    "*/odm"
    "*/lib/modules"
)

function check_array_regex() {
  local string_to_check=$1
  local array=("${@:2}")

  for pattern in "${array[@]}"; do
    if [[ $string_to_check == $pattern ]] || [[ $string_to_check =~ $pattern ]]; then
      return 0
    fi
  done

  return 1
}

function usage() {
    echo "Usage: $(basename $0) <path-to-vendor-and-odm>"
    exit 1
}

function write_prop_file() {
    if [[ -z $2 ]]; then
        echo $1 >> $VENDOR_PROP_FILE
    else
        echo $1:$2 >> $VENDOR_PROP_FILE
    fi
}

if [[ -z $VENDOR_ODM_PATH ]] || [[ ! -d $VENDOR_ODM_PATH ]]; then
    usage
fi

for dir in odm vendor; do
    if [[ ! -d $VENDOR_ODM_PATH/$dir ]]; then
        echo "Missing $VENDOR_ODM_PATH/$dir"
        usage
    fi
done


rm -f $VENDOR_PROP_FILE
FULL_FILES_LIST=$(cd $VENDOR_ODM_PATH && find odm vendor -type f | sort)
for file in $FULL_FILES_LIST; do
    SKIP=false
    MODULE=false
    destination=${VENDOR_MODULE_DEST[$file]}

    check_array_regex "$file" "${VENDOR_SKIP_FILES[@]}" && SKIP=true
    check_array_regex "$file" "${VENDOR_MODULE_FILES[@]}" && MODULE=true

    if [[ $SKIP == true ]] && [[ "$destination" == "" ]]; then
        echo "--- Skipping: $file"
    elif [[ $MODULE == true ]]; then
        echo "--- Adding as module: $file"
        write_prop_file "-$file" "$destination"
    else
        echo "--- Adding as copy: $file"
        write_prop_file "$file" "$destination"
    fi
done

rm -f $VENDOR_SYMLINKS_MK
FULL_LINK_LIST=$(cd $VENDOR_ODM_PATH/vendor && find * -type l | sort)
for link in $FULL_LINK_LIST; do
    SKIP=false
    link_target=$(readlink $VENDOR_ODM_PATH/vendor/$link)

    check_array_regex "vendor/$link" "${VENDOR_SKIP_LINKS[@]}" && SKIP=true

    if [[ $SKIP == true ]]; then
        echo "--- Skipping: $link"
    else
        echo "--- Adding as symlink: vendor/$link -> $link_target"
        echo "\$(TARGET_OUT_VENDOR)/$link: \$(LOCAL_INSTALLED_MODULE)" >> $VENDOR_SYMLINKS_MK
        echo "\$(call symlink-file,,$link_target,\$(TARGET_OUT_VENDOR)/$link)" >> $VENDOR_SYMLINKS_MK
        echo "ALL_DEFAULT_INSTALLED_MODULES += \$(TARGET_OUT_VENDOR)/$link" >> $VENDOR_SYMLINKS_MK
    fi
done
