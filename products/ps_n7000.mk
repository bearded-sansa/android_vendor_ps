# Check for target product
ifeq (ps_n7000,$(TARGET_PRODUCT))

# Inherit device configuration
$(call inherit-product, device/samsung/n7000/full_n7000.mk)

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# include ParanoidAndroid common configuration
include vendor/ps/config/pa_common.mk

# Product properties
PRODUCT_DEVICE := n7000
PRODUCT_BRAND := Samsung
PRODUCT_NAME := ps_n7000
PRODUCT_MODEL := GT-N7000
PRODUCT_MANUFACTURER := Samsung
PRODUCT_PROPERTY_OVERRIDES += ro.buildzipid=ps.n7000.$(shell date +%m%d%y).$(shell date +%H%M%S)

# overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_NUMBER=ZCLP6 \
    PRODUCT_NAME=GT-N7000 \
    TARGET_DEVICE=GT-N7000 \
    TARGET_BUILD_TYPE=user \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="GT-N7000-user 4.0.3 IML74K ZCLP6 release-keys" \
    BUILD_FINGERPRINT="samsung/GT-N7000/GT-N7000:4.0.3/IML74K/ZCLP6:user/release-keys"

endif
