#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


BOARD_VENDOR := samsung

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal3470
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := kminiltexx,kminiltedv,kminilteub,kminilte

# Image sizes
#BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 12833521664

# Image sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 16780000
BOARD_CACHEIMAGE_PARTITION_SIZE := 314600000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16780000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13960000000


# Filesystems
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/samsung/kminilte/include

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := kminilte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/kminilte

#TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

# Platform
TARGET_BOARD_PLATFORM := exynos3
TARGET_SOC := exynos3470

# Other
BOARD_USES_BLOB_LESS := true

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# Use stock HAL
TARGET_EXYNOS3_AUDIO_FROM_SOURCE := false

# Lollipop Audio HAL is incompatible with Android M (see http://review.cyanogenmod.org/#/c/121831/)
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/kminilte/configs/vnd_smdk3470.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kminilte/bluetooth

# Camera
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/kminilte/cmhw

# Disable dex-preoptimization
WITH_DEXPREOPT := false

# Disable dex-preoptimization of prebuilts to save space.
DONT_DEXPREOPT_PREBUILTS := true

# SoundTrigger
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/kminilte/configs/egl.cfg
BOARD_EGL_NEEDS_HANDLE_VALUE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
# Chipset: Samsung s3fwrn5
# Note: as libnfc-nci only supports pn547 and bcm2079x, select pn547 here but use the stock s3fwrn5 hal
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_HAL_SUFFIX := universal3470

# PowerHAL
TARGET_POWERHAL_VARIANT := exynos3

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_MODEM_TYPE := ss222

# Radio
BOARD_RIL_CLASS := ../../../device/samsung/kminilte/ril

# Sensors
TARGET_PROVIDES_LIBSENSORS := true
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# SELinux
BOARD_SEPOLICY_DIRS := device/samsung/kminilte/sepolicy
	
# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_kminilte
TARGET_LIBINIT_DEFINES_FILE := device/samsung/kminilte/init/init_kminilte.cpp

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/kminilte
TARGET_RECOVERY_FSTAB := device/samsung/kminilte/rootdir/etc/fstab.universal3470
BOARD_HAS_LARGE_FILESYSTEM := true

# TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_SCREEN_BLANK := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_CRYPTO := true

# WFD
BOARD_USES_WFD_SERVICE := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"

BOARD_USES_BLOB_LESS := true
