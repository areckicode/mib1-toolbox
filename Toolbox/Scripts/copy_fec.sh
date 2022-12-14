#!/bin/ksh

echo "This script will install a new FecContainer.fec"

mount -uw /net/mmx/fs/sda0/

# Mount writeable system RCC
mount -uw /net/rcc/mnt/efs-persist

# Destination path
MIBPATH=/net/rcc/mnt/efs-persist/FEC/FecContainer.fec
# Define the source path
NEWFILES=/net/mmx/fs/sda0/Advanced/FEC/FecContainer.fec


# Copying the files
echo "Copying FEC file:"
echo "Source:" $NEWFILES
echo "Destination:" $MIBPATH

# Check if a folder or only a file needs to be copied
if [ -f ${NEWFILES} ]; then
	echo "Copying file, please wait..."
	cp -r ${NEWFILES} ${MIBPATH}
else
	echo "ERROR: No files found"
	exit 0
fi

echo "Copy done"
echo
sleep .5

# Mount back to read-only system RCC
mount -ur /net/rcc/mnt/efs-persist


echo "Done. Now restart the unit."
exit 0
