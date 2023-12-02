#!/bin/bash

set -e

EXTRACT_OTA=../../../prebuilts/extract-tools/linux-x86/bin/ota_extractor
UNPACKBOOTIMG=../../../system/tools/mkbootimg/unpack_bootimg.py
ROM_ZIP=$1

error_handler() {
    if [[ -d $extract_out ]]; then
        echo "Error detected, cleaning temporal working directory $extract_out"
        rm -rf $extract_out
    fi
}

trap error_handler ERR

function usage() {
	echo "Usage: ./extract-files.sh <rom-zip>"
	exit 1
}

function get_path() {
	echo "$extract_out/$1"
}

function unpackbootimg() {
	$UNPACKBOOTIMG $@
}

function extract_ota() {
    $EXTRACT_OTA $@
}

if [[ ! -f $UNPACKBOOTIMG ]]; then
	echo "Missing $UNPACKBOOTIMG, are you on the correct directory?"
	exit 1
fi

if [[ ! -f $EXTRACT_OTA ]]; then
	echo "Missing $EXTRACT_OTA, are you on the correct directory and have built the ota_extractor target?"
	exit 1
fi

if [[ -z $ROM_ZIP ]] || [[ ! -f $ROM_ZIP ]]; then
	usage
fi

# Create needed directories
for dir in ./modules/ramdisk ./images; do
    if [[ ! -d $dir ]]; then
    	mkdir -p $dir
    fi
done

# Extract the OTA package
extract_out=$(mktemp -d)
echo "Using $extract_out as working directory"

echo "Extracting the payload from $ROM_ZIP"
unzip $ROM_ZIP payload.bin -d $extract_out

echo "Extracting OTA images"
extract_ota -payload $extract_out/payload.bin -output_dir $extract_out

# BOOT
echo "Extracting the kernel image from boot.img"
out=$extract_out/boot-out
mkdir $out

echo "Extracting at $out"
unpackbootimg --boot_img $(get_path boot.img) --out $out --format mkbootimg

echo "Done. Copying the kernel"
cp $out/kernel ./images/kernel
echo "Done"

# VENDOR_BOOT
echo "Extracting the ramdisk kernel modules and DTB"
out=$extract_out/vendor_boot-out
mkdir $out

echo "Extracting at $out"
unpackbootimg --boot_img $(get_path vendor_boot.img) --out $out --format mkbootimg

echo "Done. Extracting the ramdisk"
mkdir $out/ramdisk
unlz4 $out/vendor_ramdisk00 $out/vendor_ramdisk
cpio -i -F $out/vendor_ramdisk -D $out/ramdisk

echo "Copying all ramdisk modules"
for module in $(find $out/ramdisk -name "*.ko" -o -name "modules.load*" -o -name "modules.blocklist"); do
	echo "Copying $(basename $module)"
	cp $module ./modules/ramdisk/
done

echo "Copying DTB"
cp $out/dtb ./images/dtb.img
echo "Done"

# Prebuilt images
for image in dtbo odm vendor vendor_dlkm; do
    echo "Copying $image"
    cp $(get_path $image.img) images/$image.img
done

rm -rf $extract_out
echo "Extracted files successfully"
