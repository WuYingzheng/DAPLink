include default.conf

ifndef BOARD
$(error BOARD is not set)
endif

OUT_DIR=$(PROJECT)/build

# Compiler setting
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AR=arm-none-eabi-ar
AS=arm-none-eabi-as
CP=arm-none-eabi-objcopy
OD=arm-none-eabi-objdump
SZ=arm-none-eabi-size


# DO NOT EDIT THE FOLLOWING CONTENT
# Try to include the following two files
-include $(PROJECT)/gcc/general.mk
-include $(PROJECT)/gcc/device.mk
-include $(PROJECT)/gcc/source.mk

# Create object list
OBJECTS=$(ASOURCES:%.s=%.o)
OBJECTS+=$(CSOURCES:%.c=%.o)
OBJECTS+=$(CXXSOURCES:%.cpp=%.o)
OBJECTS:=$(addprefix $(OUT_DIR)/, $(OBJECTS))

# Create dependent file
DEPENDENT:=$(patsubst %c,%d,$(CSOURCES))
DEPENDENT+=$(patsubst %cpp,%d,$(CXXSOURCES))
DEPENDENT:=$(addprefix $(OUT_DIR)/, $(DEPENDENT))

###
# Build Rules
.PHONY: release debug

# Need following option for LTO as LTO will treat retarget functions as
# unused without following option
# fno-buildin 不使用C库内建函数
release: DEFS+=-DCUSTOM_NEW -DNO_EXCEPTIONS
release: CFLAGS+=-Os -ffunction-sections -fdata-sections -fno-builtin # -flto
release: CXXFLAGS+=-Os -ffunction-sections -fdata-sections -fno-builtin -fno-rtti -std=c++11 -fno-exceptions # -flto
release: LDFLAGS+=-Os -Wl,-gc-sections  -flto
release: build

debug: CFLAGS+=-g --specs=nano.specs
debug: CXXFLAGS+=-g --specs=nano.specs -std=c++11
debug: LDFLAGS+=-g
debug: build

# By default, gcc uses 4 bytes to store a wide char, while armcc uses 2 bytes.
# In order to be compatible with armcc, add -fshort-wchar to gcc compiler flags.
# CFLAGS+= -fshort-wchar

build:
	echo "hello"
	@make --no-print-directory pre-build
	@make --no-print-directory firmware
	@make --no-print-directory post-build

# 预处理，生成 .bin .hex 文件
pre-build:
	@echo 'Generating git hash:'
	@python3 tools/pre_build_script.py
	@echo ' '

firmware: $(OBJECTS)
	@mkdir -p $(PROJECT)/build
	@echo "Linking object file...\n"
	@$(CC) $(LDFLAGS) -Wl,-Map=$(OUT_DIR)/daplink.map $^ -o $(OUT_DIR)/daplink.elf
	@echo "Finished building target: $(OUT_DIR)/daplink.elf!\n"

# 后处理，生成 .bin .hex 文件
post-build:
	@echo 'Generating binary and Printing size information:'
	$(CP) -O binary $(OUT_DIR)/daplink.elf $(OUT_DIR)/daplink.bin
	$(CP) -O ihex   $(OUT_DIR)/daplink.elf $(OUT_DIR)/daplink.hex
	$(SZ) $(OUT_DIR)/daplink.elf
	@echo ' '

# Include all .d files
-include $(DEPENDENT)

$(OUT_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -o $@
	@echo "Assambled "$<"!\n"

$(OUT_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(DEFS) $(INCLUDES) -MMD $< -o $@
	@echo "Compiled "$<"!\n"

 %.o: %.cpp
	$(CXX) $(CXXFLAGS) $(DEFS) $(INCLUDES) -MMD $< -o $@
	@echo "Compiled "$<"!\n"

clean:
	rm -rf $(OUT_DIR)/*
