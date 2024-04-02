INCLUDE_DIR := ../include/src
LIB_INCLUDE_DIR := /usr/local/include/tuya-sdk
SRC_DIR := .
BUILD_DIR := ../build/src

SRCS := $(wildcard $(SRC_DIR)/*.c)
DEPS := $(wildcard $(INCLUDE_DIR)/*.h)
_OBJ := $(shell basename -a $(SRCS:.c=.o))
OBJ := $(patsubst %, $(BUILD_DIR)/%, $(_OBJ))

CFLAGS := -Wall -g -I$(INCLUDE_DIR) -I$(LIB_INCLUDE_DIR)


.PHONY: all
all: $(OBJ)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	@mkdir -p $(BUILD_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	$(RM) $(BUILD_DIR)/*.o