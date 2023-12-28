#!/bin/bash

set -e

VENDOR_ODM_PATH=$(readlink -f $1)
VENDOR_PROP_FILE=proprietary-files-vendor.txt
VENDOR_SYMLINKS_MK=vendor-symlinks.mk

VENDOR_SKIP_FILES=(
    # Apps DEX
    "odm/app/goodix_sz/oat/arm64/goodix_sz.odex"
    "odm/app/goodix_sz/oat/arm64/goodix_sz.vdex"
    "vendor/app/CACertService/oat/arm64/CACertService.odex"
    "vendor/app/CACertService/oat/arm64/CACertService.vdex"
    "vendor/app/CneApp/oat/arm64/CneApp.odex"
    "vendor/app/CneApp/oat/arm64/CneApp.vdex"
    "vendor/app/EidService/oat/arm64/EidService.odex"
    "vendor/app/EidService/oat/arm64/EidService.vdex"
    "vendor/app/IWlanService/oat/arm64/IWlanService.odex"
    "vendor/app/IWlanService/oat/arm64/IWlanService.vdex"
    "vendor/app/QFingerprintService/oat/arm64/QFingerprintService.odex"
    "vendor/app/QFingerprintService/oat/arm64/QFingerprintService.vdex"
    "vendor/app/TimeService/oat/arm64/TimeService.odex"
    "vendor/app/TimeService/oat/arm64/TimeService.vdex"
    "vendor/app/TrustedUIService/oat/arm64/TrustedUIService.odex"
    "vendor/app/TrustedUIService/oat/arm64/TrustedUIService.vdex"
    "vendor/app/TrustZoneAccessService/oat/arm64/TrustZoneAccessService.odex"
    "vendor/app/TrustZoneAccessService/oat/arm64/TrustZoneAccessService.vdex"
    "vendor/framework/oat/arm64/androidx.camera.extensions.impl.odex"
    "vendor/framework/oat/arm64/androidx.camera.extensions.impl.vdex"
    "vendor/framework/oat/arm/androidx.camera.extensions.impl.odex"
    "vendor/framework/oat/arm/androidx.camera.extensions.impl.vdex"

    # Build properties
    "odm/etc/build.prop"
    "vendor/build.prop"
    "vendor/odm_dlkm/etc/build.prop"

    # Camera plugins
    "odm/lib64/camera/plugins/com.xiaomi.plugin.frontbokeh.so"
    "odm/lib64/camera/plugins/com.xiaomi.plugin.miaiie.so"
    "odm/lib64/camera/plugins/com.xiaomi.plugin.supermoon.so"

    # SELinux
    "odm/etc/selinux/odm_file_contexts"
    "odm/etc/selinux/odm_hwservice_contexts"
    "odm/etc/selinux/odm_mac_permissions.xml"
    "odm/etc/selinux/odm_property_contexts"
    "odm/etc/selinux/odm_seapp_contexts"
    "odm/etc/selinux/odm_sepolicy.cil"
    "odm/etc/selinux/precompiled_sepolicy"
    "odm/etc/selinux/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256"
    "odm/etc/selinux/precompiled_sepolicy.product_sepolicy_and_mapping.sha256"
    "odm/etc/selinux/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256"
    "vendor/etc/selinux/plat_pub_versioned.cil"
    "vendor/etc/selinux/plat_sepolicy_vers.txt"
    "vendor/etc/selinux/selinux_denial_metadata"
    "vendor/etc/selinux/vendor_file_contexts"
    "vendor/etc/selinux/vendor_hwservice_contexts"
    "vendor/etc/selinux/vendor_mac_permissions.xml"
    "vendor/etc/selinux/vendor_property_contexts"
    "vendor/etc/selinux/vendor_seapp_contexts"
    "vendor/etc/selinux/vendor_sepolicy.cil"
    "vendor/etc/selinux/vendor_service_contexts"
    "vendor/etc/selinux/vndservice_contexts"

    # VINTF manifests and fragments
    "odm/etc/vintf/manifest_fuxi.xml"
    "odm/etc/vintf/manifest_ishtar.xml"
    "odm/etc/vintf/manifest_nuwa.xml"
    "odm/etc/vintf/manifest_sheng.xml"
    "odm/etc/vintf/manifest_socrates.xml"
    "odm/etc/vintf/manifest_vermeer.xml"
    "odm/etc/vintf/manifest_wangshu.xml"
    "vendor/etc/vintf/compatibility_matrix.xml"
    "vendor/etc/vintf/manifest/c2_manifest_vendor.xml"
    "vendor/etc/vintf/manifest_kalama.xml"

    # Filesystem configs
    "vendor/etc/fs_config_dirs"
    "vendor/etc/fs_config_files"

    # FSTAB
    "vendor/etc/fstab.qcom"
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

# Generate the vendor skip files list map
declare -A VENDOR_SKIP_FILES_MAP
for file in ${VENDOR_SKIP_FILES[@]}; do
    # Store the `file`, and the `file` with vendor and odm prefixes
    # in order to support files declared as */filepath
    VENDOR_SKIP_FILES_MAP[${file}]=" "
done

rm -f $VENDOR_PROP_FILE
FULL_FILES_LIST=$(cd $VENDOR_ODM_PATH && find odm vendor -type f | sort)
for file in $FULL_FILES_LIST; do
    SKIP=false
    MODULE=false
    destination=${VENDOR_MODULE_DEST[$file]}

    [[ -n "${VENDOR_SKIP_FILES_MAP[$file]}" ]] && SKIP=true
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
