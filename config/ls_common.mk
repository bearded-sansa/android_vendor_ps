# overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.media.enc.jpeg.quality=100 \
    ro.kernel.android.checkjni=0 \
    drm.service.enabled=true

# packages
PRODUCT_PACKAGES += \
    Camera \
    MusicFX \
    Torch \
    LiveWallpapers \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    Galaxy4 \
    PhaseBeam \
    NoiseField \
    Mms

# tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs

# themes
include vendor/ps/config/theme_chooser.mk

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ps/overlay/common_ls

# languages
PRODUCT_PACKAGE_OVERLAYS += vendor/ps/overlay/dictionaries

# bin
PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/common_ls/bin/sysinit:system/bin/sysinit

# cron
PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.conf:system/etc/cron/cron.conf \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.hourly/00drop_caches:system/etc/cron/cron.hourly/00drop_caches \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.daily/00drop_caches:system/etc/cron/cron.daily/00drop_caches \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.weekly/00drop_caches:system/etc/cron/cron.weekly/00drop_caches \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.hourly/01clear_cache:system/etc/cron/cron.hourly/01clear_cache \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.daily/01clear_cache:system/etc/cron/cron.daily/01clear_cache \
    vendor/ps/prebuilt/common_ls/etc/cron/cron.weekly/01clear_cache:system/etc/cron/cron.weekly/01clear_cache

# bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Blobs necessary for drm
PRODUCT_COPY_FILES +=  \
    vendor/ps/prebuilt/common_drm/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/ps/prebuilt/common_drm/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    vendor/ps/prebuilt/common_drm/phone/lib/libfrsdk.so:system/lib/libfrsdk.so \
    vendor/ps/prebuilt/common_drm/phone/lib/libWVphoneAPI.so:system/lib/libWVphoneAPI.so \
    vendor/ps/prebuilt/common_drm/phone/vendor/lib/libwvdrm_L1.so:system/vendor/lib/libwvdrm_L1.so \
    vendor/ps/prebuilt/common_drm/phone/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    vendor/ps/prebuilt/common_drm/phone/vendor/lib/libWVStreamControlAPI_L1.so:system/vendor/lib/libWVStreamControlAPI_L1.so \
    vendor/ps/prebuilt/common_drm/phone/vendor/lib/drm/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so

# initd
PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/common_ls/etc/liberty.bsh:system/etc/liberty.bsh \
    vendor/ps/prebuilt/common_ls/etc/init.d/00check:system/etc/init.d/00check \
    vendor/ps/prebuilt/common_ls/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/ps/prebuilt/common_ls/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/ps/prebuilt/common_ls/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/ps/prebuilt/common_ls/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/ps/prebuilt/common_ls/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/ps/prebuilt/common_ls/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/ps/prebuilt/common_ls/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/ps/prebuilt/common_ls/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/ps/prebuilt/common_ls/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/ps/prebuilt/common_ls/etc/init_trigger.disabled:system/etc/init_trigger.disabled

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/ps/prebuilt/common_ls/xbin/su:system/xbin/su \
    vendor/ps/prebuilt/common_ls/xbin/sysro:system/xbin/sysro \
    vendor/ps/prebuilt/common_ls/xbin/sysrw:system/xbin/sysrw \
    vendor/ps/prebuilt/common_ls/app/SuperSU.apk:system/app/SuperSU.apk \
    vendor/ps/prebuilt/common_ls/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/ps/prebuilt/common_ls/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# version
PRODUCT_VERSION_MAJOR = v2
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = "RC4"
LiquidVersion = "Liquid-JB"-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(LiquidVersion)

