#!/bin/bash

# Pick a desktop environment
while true; do
    printf "$yellow Which desktop environment would you like to install? $nc\n"
    printf "\t1\tMinimal with i3\n"
    printf "\t2\tMinimal with Openbox\n"
    printf "\t9\tDo not install a desktop\n"
    unset userInput
    read -p "Enter your selection> " userInput
    case $userInput in
        1)
            printf "$green i3 minimal was selected. $nc\n"
            DESKTOP=i3
            sleep 3
            sudo apt-get install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3 ubuntu-drivers-common mesa-utils mesa-utils-extra compton xorg xserver-xorg nautilus terminator xterm
            break
            ;;
        2)
            printf "$green OpenBox was selected $nc \n"
            DESKTOP=openbox
            sleep 3
            sudo apt-get install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu ubuntu-drivers-common mesa-utils mesa-utils-extra compton xorg xserver-xorg nautilus terminator xterm
            break
            ;;
        9)
            printf "$yellow No desktop was selected...$nc\n"
            DESKTOP=none
            break
            ;;
        *)
            printf "$red $userInput was not a valid choice. $nc\n"
    esac
done

# Start GUI on boot?
read -p "Start $DESKTOP on boot? [Y/n]" userInput
if [[ $userInput =~ "N|n|NO|no|No" ]]; then
    printf "$yellow Setting to boot in console ... $nc \n"
    sudo systemctl set-default multi-user.target
else
    printf "$green Setting $DESKTOP to start on boot. $nc \n"
    sudo systemctl set-default graphical.target
fi
