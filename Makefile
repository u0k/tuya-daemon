INSTALL_DIR_BIN := /usr/local/bin
LIB_INCLUDE_DIR := /usr/local/include/tuya-sdk
SRC_INCLUDE_DIR := ./include/src
BUILD_DIR := ./build/bin
LIB_DIR := /usr/local/lib
SRC_DIR := ./src

EXEC := $(BUILD_DIR)/tuya_daemon
SRCS := $(wildcard $(SRC_DIR)/*.c)
CFLAGS := -Wall -g -I$(LIB_INCLUDE_DIR) -I$(SRC_INCLUDE_DIR)
LDFLAGS := -L$(LIB_DIR) -llink_core -lplatform_port -lmiddleware_implementation -lutils_modules

.PHONY: all
all: $(EXEC) src

$(EXEC): src
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $(SRCS) $(LDFLAGS)

.PHONY: src
src: 
	$(MAKE) -C src

.PHONY: clean
clean:
	$(MAKE) -C src clean
	$(RM) $(EXEC)

.PHONY: install-bin
install-bin: $(EXEC)
	@if [ "$(shell id -u)" -ne 0 ]; then\
		echo "Run 'make install-lib' as sudo";\
		exit 1;\
	fi
	install $(EXEC) $(INSTALL_DIR_BIN)

PHONY: uninstall-bin
uninstall-bin: $(INSTALL_DIR_BIN)/tuya_daemon
	@if [ "$(shell id -u)" -ne 0 ]; then\
		echo "Run 'make uninstall-bin' as sudo";\
		exit 1;\
	fi
	$(RM) $(INSTALL_DIR_BIN)/tuya_daemon
