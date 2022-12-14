#!/bin/ksh

# Info

mount -uw /net/mmx/fs/sda0/


if [ -d /net/mmx/fs/sda0/Backup/ ]; then    
    echo "The unit will now do backup."
    echo "Do NOT power down the unit."
    echo "Do NOT remove the SD-card from the slot."

    echo "You have 10 seconds before it will start."
    echo 
    echo "10 seconds left"
    sleep 7
    echo "3"
    sleep 1
    echo "2"
    sleep 1
    echo "1"
    sleep 1
    echo "Backup will now start." 
	mkdir -p /net/mmx/fs/sda0/Backup/IFS
    echo "Backup dir created" 
	on -f rcc /usr/apps/modifyE2P r 0 10000 > /net/mmx/fs/sda0/Backup/IFS/eeprom.txt 
    echo "EEPROM copied" 
	cp -r /net/rcc/mnt/efs-persist/FEC/FecContainer.fec /net/mmx/fs/sda0/Backup/IFS/FecContainer.fec
    echo "FecContainer copied" 
	cp -r /net/rcc/mnt/efs-persist/SWDL/Variant.txt /net/mmx/fs/sda0/Backup/IFS/Variant.txt
    echo "Variant copied" 
	cat /net/rcc/dev/fs0 > /net/mmx/fs/sda0/Backup/IFS/rcc_fs0
    echo "rcc_fs0 copied" 
	cat /net/mmx/dev/fs0 > /net/mmx/fs/sda0/Backup/IFS/mmx_fs0
    echo "mmx_fs0 copied" 
    sleep 1
else
    echo "Backup folder not found at /net/mmx/fs/sda0/"
    exit 0
fi

echo "Done"

exit 0
