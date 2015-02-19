#!/bin/bash
if [ ! -d ./_temp ]
then
mkdir ./_temp
fi
cd ./_temp
if [ ! -d bootfs ]
then
mkdir bootfs
else
rm -R ./bootfs/*
fi
mkdir ./bootfs.temp
mount ../_output/bootfs.fex ./bootfs.temp
cp -pR ./bootfs.temp/* ./bootfs/
umount ./bootfs.temp
rm -R ./bootfs.temp
chown -R $(who -m | cut -f1 -d " ") ../
