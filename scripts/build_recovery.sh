#!/bin/bash
if [ ! -d ./_input ]
then
mkdir ./_input
fi
if [ -e ./_temp/recovery/cmd_line.cfg ]
then
cmd_line=`cat ./_temp/recovery/cmd_line.cfg`
./tools/mkbootfs ./_temp/recovery/ramdisk | gzip > ./_temp/recovery/ramdisk-new.gz
./tools/mkbootimg --base 0x40000000 --kernel ./_temp/recovery/recovery.fex-kernel --ramdisk ./_temp/recovery/ramdisk-new.gz --cmdline "$cmd_line" -o ./_temp/recovery/new-recovery.fex
rm ./_temp/recovery/ramdisk-new.gz
mv ./_temp/recovery/new-recovery.fex ./_input/recovery.fex
echo "Done..."
else
echo "Command file doesn't exist!"
fi
