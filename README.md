# SHA2017 recovery package

Have a SHA2017 badge on really old firmware? These files will help you on your way.

## Web updater

An alternative to the files in this repository is the web updater tool found at [update.badge.team](https://update.badge.team/). Open that site in Chromium, Google Chrome or Microsoft Edge to flash the badge directly from your webbrowser.

## Finding a copy of esptool.py

The `esptool.py` program is available in the package repository of most Linux distributions. Alternatively you can download esptool.py here: https://github.com/espressif/esptool

Make sure esptool.py is in your path or run the commands from the folder where esptool.py is unpacked.

Make sure Python is installed as well.

### Notes

If esptool.py is not in your path you might need to run the commands below prepended with `python` like `python esptool.py ...`. If you're using a binary build of esptool you might need to remove `.py` from the command.

## How to erase the flash of your badge

Running the following command will erase all data from the flash chip inside your SHA2017 badge, allowing you to start from a fresh blank state.

```
esptool.py --port /dev/ttyUSB0 -b 460800 --before default_reset --after hard_reset --chip esp32 erase_flash
```

## Flashing the latest firmware

Running the following command will install the bootloader, partition table and firmware for the SHA2017 badge to the flash.

```
esptool.py --port /dev/ttyUSB0 -b 460800 --before default_reset --after hard_reset --chip esp32 write_flash --flash_mode qio --flash_size 16MB --flash_freq 80m 0x1000 esp32_platform_bl_idf3_2.bin 0x8000 sha2017_16MB.bin 0xd000 ota_data_initial.bin 0xf000 phy_init_data.bin 0x10000 sha2017.bin
```

## Using make

You can also run these commands using make:


```
make erase PORT=/dev/ttyUSB0
make flash PORT=/dev/ttyUSB0
```

If the port you want to use is `/dev/ttyUSB0` then the `PORT` argument is optional. If you want to both `erase` and `flash` the command is optional too.
