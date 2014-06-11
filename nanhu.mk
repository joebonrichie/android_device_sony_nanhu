#
# Copyright (C) 2011 The CyanogenMod Project
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

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/nanhu/nanhu-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/nanhu/overlay

# Inherit the tamsui-common definitions
$(call inherit-product, device/sony/tamsui-common/tamsui.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

#PRODUCT_PACKAGES += \
#    FM \
#    init.qcom.fm.sh

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc \
    $(LOCAL_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.sony:root/fstab.sony \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.ril.path.sh:root/init.qcom.ril.path.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.class_main.sh:root/init.qcom.class_main.sh
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/init.qcom.thermald_conf.sh:system/etc/init.qcom.thermald_conf.sh \
    $(LOCAL_PATH)/rootdir/system/etc/thermal-8x25-sku7.conf:system/etc/thermal-8x25-sku7.conf \
    $(LOCAL_PATH)/rootdir/system/etc/thermal-8x25-evb.conf:system/etc/thermal-8x25-evb.conf \
    $(LOCAL_PATH)/rootdir/system/etc/init.qcom.composition_type.sh:system/etc/init.qcom.composition_type.sh \
    $(LOCAL_PATH)/rootdir/system/etc/init.target.8x25.sh:system/etc/init.target.8x25.sh \
    $(LOCAL_PATH)/rootdir/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/system/etc/qosmgr_rules.xml:system/etc/qosmgr_rules.xml \
    $(LOCAL_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/rootdir/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device \
    $(LOCAL_PATH)/recovery/rebootrecovery.sh:recovery/root/sbin/rebootrecovery.sh \
    $(LOCAL_PATH)/recovery/init.recovery.device.rc:root/init.recovery.device.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/tad:root/sbin/tad

# Offline charging
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/charger:root/charger \
    $(LOCAL_PATH)/prebuilt/battery_fail.png:root/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_01.png:root/res/images/charger/charging_animation_01.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_02.png:root/res/images/charger/charging_animation_02.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_03.png:root/res/images/charger/charging_animation_03.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_04.png:root/res/images/charger/charging_animation_04.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_05.png:root/res/images/charger/charging_animation_05.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_06.png:root/res/images/charger/charging_animation_06.png \
    $(LOCAL_PATH)/prebuilt/charging_animation_07.png:root/res/images/charger/charging_animation_07.png

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/cy8ctma340_touch.kl:system/usr/keylayout/cy8ctma340_touch.kl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.v3=qcomdsds,skipnullaid \
    persist.radio.apm_sim_not_pwdn=0 \
    debug.composition.7x27A.type=mdp \
    debug.composition.7x25A.type=mdp \
    persist.sys.usb.config=mtp,adb

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
