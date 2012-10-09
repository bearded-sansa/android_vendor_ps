# Check for target product
ifeq (ps_n7000,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# include ParanoidAndroid common configuration
include vendor/ps/config/ps_common.mk

# Inherit device configuration
$(call inherit-product, device/samsung/n7000/full_n7000.mk)

PRODUCT_NAME := ps_n7000

endif
