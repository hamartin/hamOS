ASM=nasm
# I do not have these tools in my path.
MKFS_FAT=/usr/local/opt/dosfstools/sbin/mkfs.fat
QEMU=/usr/local/bin/qemu-system-i386

SRC_DIR=src
BUILD_DIR=build
IMG=main_floppy.img

.PHONY: all floppy_image bootloader clean always run

#
# Floppy Image
#
floppy_image: $(BUILD_DIR)/$(IMG)

$(BUILD_DIR)/$(IMG): bootloader
	dd if=/dev/zero of=$(BUILD_DIR)/$(IMG) bs=512 count=2880
	$(MKFS_FAT) -F 12 -n "NBOS" $(BUILD_DIR)/$(IMG)
	dd if=$(BUILD_DIR)/bootloader.bin of=$(BUILD_DIR)/$(IMG) conv=notrunc

#
# Bootloader
#
bootloader: $(BUILD_DIR)/bootloader.bin

$(BUILD_DIR)/bootloader.bin: always
	$(ASM) -f bin -o $(BUILD_DIR)/bootloader.bin -I $(SRC_DIR)/bootloader $(SRC_DIR)/bootloader/main.asm

#
# Always
#
always:
	mkdir -pv $(BUILD_DIR)

#
# Clean
#
clean:
	rm -vrf $(BUILD_DIR)/*
	rmdir -v $(BUILD_DIR)

#
# Run
#
run: floppy_image
	$(QEMU) -drive file=$(BUILD_DIR)/$(IMG),format=raw
