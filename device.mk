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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/kminilte/kminilte-vendor.mk)

DEVICE_FOLDER := device/samsung/kminilte

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Device uses high-density artwork where available
#PRODUCT_AAPT_CONFIG := normal hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi


# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal3470 \
    init.universal3470.rc \
    init.universal3470.usb.rc \
    ueventd.universal3470.rc
PRODUCT_PACKAGES += \
    init.wifi.rc

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.universal3470 \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/audio/tiny_hw.xml:system/etc/tiny_hw.xml

# Data workaround
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/enable_data:system/bin/enable_data

# HW composer (needed by libMali.so)
PRODUCT_PACKAGES += \
    libion

# Keylayouts
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Lights
#PRODUCT_PACKAGES += \
#    lights.exynos3

# Media config
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/media/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Radio
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/rootdir/sbin/cbd:root/sbin/cbd

PRODUCT_PACKAGES += \
    libsecril-client   
    
# Samsung
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Wifi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_supplicant.conf
#    dhcpcd.conf \
#    hostapd \
#    hostapd_default.conf \
#    libwpa_client \
#    p2p_supplicant

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(DEVICE_FOLDER)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false \
    ro.opengles.version=131072 \
    ro.zygote.disable_gl_preload=true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Dalvik VM specific for devices with 2048 MB of RAM (G800F has 1.5G, but 2G config seems to fit)
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
#dalvik.vm.heapgrowthlimit=128m
