#!/bin/bash
clear
if [ -d ./_extract ]
then
echo "Removing old files in _extract"
rm -R ./_extract
fi

if [ -d ./_output ]
then
echo "Removing old files in _output"
rm -R ./_output
fi
echo "Unpacking image from original.img and move to _extract"
./tools/imagesuite/awimage ./original.img
mv ./original.img.dump ./_extract
echo "Renaming dumped files to .fex"
for a in ./_extract/*[0-Z,_]???
do
       mv "$a" "$a.fex"
done
mkdir ./_output
mkdir ./_input
echo "Moving important files to _output"
mv ./_extract/*_SYSTEM_*.fex ./_output/system.fex
mv ./_extract/*_BOOT_*.fex ./_output/root.fex
mv ./_extract/*_RECOVERY_*.fex ./_output/recovery.fex
mv ./_extract/*_BOOTLOADER_*.fex ./_output/bootfs.fex
mv ./_extract/*_ENVIROMENT_*.fex ./_output/bootenv.fex
mv ./_extract/*_DATA_*.fex ./_output/data.fex
cd ./_extract

chown -R $(who -m | cut -f1 -d " ") ../_extract
chown -R $(who -m | cut -f1 -d " ") ../_output
chown -R $(who -m | cut -f1 -d " ") ../_input

echo "Done..."
