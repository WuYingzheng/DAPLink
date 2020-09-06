DEFS+= -D DAPLINK_BL # Build bootloader
# DEFS+= -D DAPLINK_IF   # Build daplink app

####################################################################
## The vector table for DAPLink images contains several build info fields.
## These fields are placed in the unused, reserved vector table entries
## starting at offset 0x20.

## Key used to indicate if the image is bootloader or interface
DEFS+= -D DAPLINK_BUILD_KEY=0x9B939D93  # DAPLINK_BUILD_KEY_BL
#DEFS+= -D DAPLINK_BUILD_KEY=0x9B939E8F # DAPLINK_BUILD_KEY_IF

## Key used to determine hardware compatibility. This ensures that
## for example a bootloader update mean for a k20dx could never be
## loaded on a kl26z or any other chip
DEFS+= -D DAPLINK_HIC_ID=0x97969908  # DAPLINK_HIC_ID_STM32F103XB

## Meant for checking for incompatible legacy versions.
## Currently it is not used for this purpose and is just displayed
## in details.txt.
DEFS+= -D DAPLINK_VERSION=254

###################################################################

# INTERFACE_STM32F103XB
DEFS+= -D USE_HAL_DRIVER            # 使用 stm32 官方驱动程序
DEFS+= -D MSC_ENDPOINT \
	   -D DRAG_N_DROP_SUPPORT

# OS_TICK=10000,
# DAPLINK_NO_ASSERT_FILENAMES
DEFS+= -D OS_CLOCK=72000000
