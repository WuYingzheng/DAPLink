DEVICE=STM32F103xB
DEFS+= -D$(DEVICE)

# MCU FLAGS
MCUFLAGS=-march=armv7-m -mtune=cortex-m3 -mthumb -mlittle-endian \
         -mfloat-abi=softfp -mthumb-interwork

CFLAGS+=-c $(MCUFLAGS)
CXXFLAGS+=-c $(MCUFLAGS)

# LINKER FLAGS
LDSCRIPT= project/stm32f103_bulk/gcc/daplink.ld
# --specs=nano.specs: use newlib-nano
LDFLAGS = --specs=nosys.specs --specs=nano.specs -Wl,-gc-sections \
          -T $(LDSCRIPT) $(MCUFLAGS)
