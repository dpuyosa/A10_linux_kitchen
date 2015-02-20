#!/bin/bash
if [ ! -d ./_temp ]
then
mkdir ./_temp
fi
cd ./_temp
if [ ! -d recovery ]
then
mkdir recovery
else
rm -R ./recovery/*
fi
cd recovery
../../tools/split_bootimg.pl ../../_output/recovery.fex
mkdir ramdisk
cd ./ramdisk
gunzip -c ../recovery.fex-ramdisk.gz | cpio -i
rm -R ../recovery.fex-ramdisk.gz
