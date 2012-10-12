# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Extra Ringtones
include frameworks/base/data/sounds/AudioPackageNewWave.mk

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Replace CM files
PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/ps/prebuilt/common/apk/GooManager.apk:system/app/GooManager.apk \
    vendor/ps/prebuilt/common/apk/SuperSU.apk:system/app/SuperSU.apk \
    vendor/ps/prebuilt/common/xbin/su:system/xbin/su

ifneq ($(PARANOID_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/ps/prebuilt/common/bootanimation/$(PARANOID_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
else
    PRODUCT_COPY_FILES += \
        vendor/ps/prebuilt/common/bootanimation/HDPI.zip:system/media/bootanimation.zip
endif
    
# ParanoidAndroid Packages
PRODUCT_PACKAGES += \
    ParanoidPreferences \
    ParanoidWallpapers

# device common prebuilts
ifneq ($(DEVICE_COMMON),)
    -include vendor/ps/prebuilt/$(DEVICE_COMMON)/prebuilt.mk
endif

# device specific prebuilts
-include vendor/ps/prebuilt/$(TARGET_PRODUCT)/prebuilt.mk

BOARD := $(subst ps_,,$(TARGET_PRODUCT))

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/ps/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/ps/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/ps/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/ps/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf


PA_VERSION_MAJOR = 2
PA_VERSION_MINOR = 2
PA_VERSION_MAINTENANCE = 0

TARGET_CUSTOM_RELEASETOOL := vendor/ps/tools/squisher

VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := $(TARGET_PRODUCT)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pa.version=$(VERSION) \
  ro.modversion=$(PA_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.goo.developerid=paranoidandroid \
  ro.goo.rom=paranoidandroid \
  ro.goo.version=$(shell date +%s)

# ls common
include vendor/ps/config/ls_common.mk
