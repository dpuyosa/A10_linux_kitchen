A10_linux_kitchen
=================
###Tools to unpack and repack Livesuit images and work with my A10 Tablet (NVSBL Dragon) 1GB RAM, 8GB NAND
---------------------------------------------------
**The scripts are based on the ublaze linux kitchen that are a tweak of Basilio Kochanski ones.**

They have been tweaked and upgraded to serve the purpose of hacking my device, they may work on other devices too, like IDS10.
Executables have been rebuild from the lastest sources found (denx, linux-sunxi).

- ublaze: http://ublaze.ru/allwinner-img/
- Basilio Kochanski: http://xakerblog.blogspot.ru/2013/03/livesuit-kitchen-for-linux.html

HOW-TO
======
- Put the LiveSuit img file in the directory and rename it to "original.img".
- Run "menu.sh" from a console (for some options root is needed).
- Pick an option and have fun.
  
  
  
***
######If running 64bits you may need this 
>sudo dpkg --add-architecture i386  
>sudo apt-get update  
>sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386  
