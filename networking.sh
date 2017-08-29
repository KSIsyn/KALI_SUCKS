#! /bin/bash


# This script will do a few network configurations.
# 1 disable networkmanager so that it is never on when you boot.
# 2 place scripts on the Desktop for 
#   Safe Network (Home)
#       you trust this network and its secuirty settings
#   Hostile Network (Hacker Con / FBI / NATION STATE)
#       you trust nothing we need to go FULL TIN FOILHAT but we really need to communicate via the internet/network)
#   Hidden Research (no traceback)
#       Maybe you need to do some stuff on the dark web and stay hidden
#   Privacy (no peeking)
        You dont want anyone knowing what you are doing but you dont requre a FULL TINFOIL HAT (public network)
        
        
        
#Disable Network Manager so it is not running when you boot up
sudo systemctl stop NetworkManager.service
sudo systemctl disable NetworkManager.service 



###########

# Create SafeNetwork Script

<<<<<<< HEAD
mkdir ~/Desktop/NetworkScripts
cp
=======
echo 
>>>>>>> branch 'master' of https://github.com/thewasabiguy/KALI_SUCKS.git




