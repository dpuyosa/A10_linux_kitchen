#!/bin/bash
if [ ! -d ./_input ]
then
mkdir ./_input
fi
if [ ! -e ./_input/bootfs.fex ]
then
  echo "copy original bootfs file"
  cp ./_output/bootfs.fex ./_input/bootfs.fex
fi

if [ ! -e ./_input/root.fex ]
then
  echo "copy original root file"
  cp ./_output/root.fex ./_input/root.fex
fi

if [ ! -e ./_input/system.fex ]
then
  echo "copy original system file"
  cp ./_output/system.fex ./_input/system.fex
fi

if [ ! -e ./_input/recovery.fex ]
then
  echo "copy original recovery file"
  cp ./_output/recovery.fex ./_input/recovery.fex
fi

#if [ ! -e ./_input/data.fex ]
#then
#  echo "copy original data file"
#  cp ./_output/data.fex ./_input/data.fex
#fi

echo "Creating checksum files"
./tools/dragon/FileAddSum ./_input/bootfs.fex ./_input/vboot.fex
./tools/dragon/FileAddSum ./_input/root.fex ./_input/vroot.fex
./tools/dragon/FileAddSum ./_input/system.fex ./_input/vsystem.fex
./tools/dragon/FileAddSum ./_input/recovery.fex ./_input/vrecovery.fex
#./tools/dragon/FileAddSum ./_input/data.fex ./_input/vdata.fex

echo "Creating image file"
if [ -e ./output.img ]
then
rm ./output.img
fi
./tools/dragon/dragon ./files/image.cfg
echo "Done..."
