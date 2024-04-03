ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/floppy_img.img: $(BUILD_DIR)/main.bin
	qemu-img create $(BUILD_DIR)/floppy_img.img 1M
	cp $(BUILD_DIR)/main.bin  $(BUILD_DIR)/floppy_img.img 

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm 
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin

