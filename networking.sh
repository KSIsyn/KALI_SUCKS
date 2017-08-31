#! /bin/bash


# This script will do a few network configurations.
# 1 disable networkmanager so that it is never on when you boot.
# 2 place scripts on the Desktop for 
#   Trusted Network (Home)
#       you trust this network and its secuirty settings
#   Hostile Network (Hacker Con / FBI / NATION STATE)
#       you trust nothing we need to go FULL TIN FOILHAT but we really need to communicate via the internet/network)
#   Hidden Research (no traceback)
#       Maybe you need to do some stuff on the dark web and stay hidden
#   Privacy (no peeking)
#        You dont want anyone knowing what you are doing but you dont requre a FULL TINFOIL HAT (public network)
        
# Trusted Network Desctiption
#	A trusted network is one that you know.  This will turn on networking only for pre-approved networks and validate you are on them
#	Network Manager turned on
#	ETH0 and WLAN0 set to normal configuation
#        
        
#Disable Network Manager so it is not running when you boot up
sudo systemctl stop NetworkManager.service
sudo systemctl disable NetworkManager.service 



###########

# Create SafeNetwork Script





