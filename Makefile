PORT ?= /dev/ttyUSB0

all: erase flash

.PHONY: flash
flash:
	esptool.py --port $(PORT) -b 460800 --before default_reset --after hard_reset --chip esp32 write_flash --flash_mode qio --flash_size 16MB --flash_freq 80m 0x1000 esp32_platform_bl_idf3_2.bin 0x8000 sha2017_16MB.bin 0xd000 ota_data_initial.bin 0xf000 phy_init_data.bin 0x10000 sha2017.bin

.PHONY: erase
erase:
	esptool.py --port $(PORT) -b 460800 --before default_reset --after hard_reset --chip esp32 erase_flash
