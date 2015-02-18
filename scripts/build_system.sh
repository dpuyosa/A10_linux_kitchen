#!/bin/bash
if [ ! -d ./_input ]
then
mkdir ./_input
fi
cd ./tools
if [ -e ../_temp/new-system.fex ]
then
rm ../_temp/new-system.fex
fi
./mkuserimg.sh ../_temp/system ../_temp/new-system.fex ext4 ../tmp 250M
mv ../_temp/new-system.fex ../_input/system.fex
