#!/bin/bash
if [ ! -d ./_temp ]
then
mkdir ./_temp
fi
cd ./_temp
echo " - Extract system image..."
../tools/simg2img ../_output/system.fex ./system.img
if [ ! -d system ]
then
mkdir system
else
rm -R ./system/*
fi
mkdir ./system.temp
mount ./system.img ./system.temp
cp -pR ./system.temp/* ./system/
umount ./system.temp
rm -R ./system.temp
rm ./system.img
