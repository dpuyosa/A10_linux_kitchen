#!/bin/bash
if [ ! -d ./_temp ]
then
mkdir ./_temp
fi
cd ./_temp
echo " - Extract system image..."
if [ ! -d system ]
then
mkdir system
else
rm -R ./system/*
fi
mkdir ./system.temp
mount -o loop ../_output/system.fex ./system.temp
cp -pR ./system.temp/* ./system/
umount ./system.temp
rm -R ./system.temp
chown -R $(who -m | cut -f1 -d " ") ../
