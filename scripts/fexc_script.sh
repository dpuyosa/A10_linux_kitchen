#!/bin/bash
if [ "$1" = 1 ]
then
  if [ -e ./_temp/bootfs/script.bin ]
  then
    ./tools/sunxi_tools/bin2fex ./_temp/bootfs/script.bin ./_temp/bootfs/script.ini
    rm ./_temp/bootfs/script*.bin
  else
    echo -en "\tFile script.bin not found!"
  fi
else
  if [ -e ./_temp/bootfs/script.ini ]
  then
    ./tools/sunxi_tools/fex2bin ./_temp/bootfs/script.ini ./_temp/bootfs/script.bin
    cp -p ./_temp/bootfs/script.bin ./_temp/bootfs/script0.bin
    rm ./_temp/bootfs/script.ini
  else
    echo -en "\tFile script.ini not found!"
  fi
fi
