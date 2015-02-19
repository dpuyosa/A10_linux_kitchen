#!/bin/bash
if [ ! -d ./_temp ]
then
mkdir ./_temp
fi
cd ./_temp
if [ ! -d root ]
then
mkdir root
else
rm -R ./root/*
fi
cd root
../../tools/split_bootimg.pl ../../_output/root.fex
mkdir ramdisk
cd ./ramdisk
gunzip -c ../root.fex-ramdisk.gz | cpio -i
rm -R ../root.fex-ramdisk.gz
chown -R $(who -m | cut -f1 -d " ") ../
