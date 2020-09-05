# 外设驱动接口
HAL_INC= -I source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/inc

HAL_SOURCES=source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_cortex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_dma2d.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_dma.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_dsi.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_gpio.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_i2c.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_i2s.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_i2s_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_ltdc.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_ltdc_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_pwr_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_qspi.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_spi.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rcc.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rcc_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rtc.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rtc_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_sd.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_sdram.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_tim.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_tim_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_ll_fmc.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_ll_sdmmc.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_uart.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_sai.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_sai_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_flash.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_flash_ex.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_pcd.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_ll_usb.c\
	source/hic_hal/stm32/stm32f469ni/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_pcd_ex.c

INCLUDES+=$(HAL_INC)
CSOURCES+=$(HAL_SOURCES)