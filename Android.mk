LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),socrates)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
