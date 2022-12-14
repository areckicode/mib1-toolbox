#!/bin/ksh
# Info

echo "This script will copy custom ESD(Green Menu) files from GreenMenu folder on your SD to the unit."

# system mount
mount -uw /net/mmx/mnt/system/
mount -uw /net/mmx/mnt/app/

# Copying files
cp /net/mmx/fs/sda0/GreenMenu/*.esd /net/mmx/mnt/app/eso/hmi/engdefs/
if [ -f /net/mmx/fs/sda0/GreenMenu/scripts/*.sh ]; then
	cp /net/mmx/fs/sda0/GreenMenu/scripts/*.sh /net/mmx/mnt/app/eso/hmi/engdefs/scripts/
else
	cp -rv /net/mmx/fs/sda0/GreenMenu/scripts/* /net/mmx/mnt/app/eso/hmi/engdefs/scripts
fi

chmod a+rwx /net/mmx/mnt/app/eso/hmi/engdefs/scripts/*

# Include back to read-only system mount script
mount -ur /net/mmx/mnt/system/
mount -ur /net/mmx/mnt/app/

echo "Done. Please restart green menu."

exit 0
