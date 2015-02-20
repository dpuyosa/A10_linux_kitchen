#!/bin/bash
if [ ! -d ./_input ]
then
mkdir ./_input
fi
if [ -e ./_temp/root/cmd_line.cfg ]
then
cmd_line=`cat ./_temp/root/cmd_line.cfg`
./tools/mkbootfs ./_temp/root/ramdisk | gzip > ./_temp/root/ramdisk-new.gz
./tools/mkbootimg --base 0x40000000 --kernel ./_temp/root/root.fex-kernel --ramdisk ./_temp/root/ramdisk-new.gz --cmdline "$cmd_line" -o ./_temp/root/new-root.fex
rm ./_temp/root/ramdisk-new.gz
mv ./_temp/root/new-root.fex ./_input/root.fex
echo "Done..."
else
echo "Command file doesn't exist!"
fi
