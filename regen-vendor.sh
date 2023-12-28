#!/bin/bash

set -e

VENDOR_ODM_PATH=$(readlink -f $1)
VENDOR_PROP_FILE=proprietary-files-vendor.txt
VENDOR_SYMLINKS_MK=vendor-symlinks.mk

VENDOR_SKIP_FILES=(
    # Apps DEX
    "*.odex"
    "*.vdex"

    # Build properties
    "*build.prop"

    # Camera plugins
    "*/com.xiaomi.plugin.supermoon.so"
    "*/com.xiaomi.plugin.frontbokeh.so"
    "*/com.xiaomi.plugin.miaiie.so"

    # SELinux
    "*/selinux/*"

    # VINTF manifests and fragments
    "*/etc/vintf/manifest.xml"
    "*/etc/vintf/manifest_*.xml"
    "vendor/etc/vintf/compatibility_matrix.xml"
    "vendor/etc/vintf/manifest/c2_manifest_vendor.xml"

    # Filesystem configs
    "vendor/etc/fs_config_*"

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
