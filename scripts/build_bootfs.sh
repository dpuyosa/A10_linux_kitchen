#!/bin/bash
if [ ! -d ./_input ]
then
mkdir ./_input
fi
if [ -e ./_temp/bootfs/script.bin ] & [ -e ./_temp/bootfs/script0.bin ]
then
  ./tools/fsbuild/fsbuild ./files/bootfs.ini ./files/split_xxxx.fex
  echo -en "\tDone..."
else
  echo -en "\tscript.bin and(or) script0.bin file(s) not found!"
fi