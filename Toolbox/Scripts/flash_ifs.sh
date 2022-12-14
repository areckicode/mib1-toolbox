#!/bin/sh

# Define the source path
NEWFILES=/net/mmx/fs/sda0/Advanced/IFS/ifs-root.ifs

export PATH=.:/proc/boot:/bin:/usr/bin:/usr/sbin:/sbin:/mnt/app/media/gracenote/bin:/mnt/app/armle/bin:/mnt/app/armle/sbin:/mnt/app/armle/usr/bin:/mnt/app/armle/usr/sbin
export LD_LIBRARY_PATH=/lib:/mnt/app/root/lib-target:/eso/lib:/mnt/app/usr/lib:/mnt/app/armle/lib:/mnt/app/armle/lib/dll:/mnt/app/armle/usr/lib

# we do not want VW-HMI specific libecpp
unset LD_PRELOAD

echo "This will falsh ifs-root.ifs"


# Mount SD card
mount -uw /net/mmx/fs/sda0/

if [ -f "$NEWFILES" ]; then    
    echo "The unit will now start flashing."
    echo "Do NOT power down the unit while flashing."
    echo "Do NOT remove the SD-card from the slot."

    echo "You have 10 seconds before it will start."
    echo "Turn off the unit if you didn't intend to flash ifsroot."
    echo "There is no turning back after flashing has started."
    echo 
    echo "10 seconds left"
    sleep 1
    echo "9"
    sleep 1
    echo "8"
    sleep 1
    echo "7"
    sleep 1
    echo "6"
    sleep 1
    echo "5"
    sleep 1
    echo "4"
    sleep 1
    echo "3"
    sleep 1
    echo "2"
    sleep 1
    echo "1"
    sleep 1
    echo "Flashing will now start." 
    on -f rcc flashunlock
    on -f rcc flashmib -a 0x00BA0000 -d -f $NEWFILES
    on -f rcc flashlock
    sleep 1
else
    echo "ifs-root.ifs not found at $VOLUME/Custom/IFS/"
    exit 0
fi

echo "Done"
exit 0
