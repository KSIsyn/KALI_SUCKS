#!/bin/bash

###################################
# Check to make sure we can even get started
###################################

# Check that our user can run sudo or is root
if ! id | grep -E -q "sudo|^uid...root"; then
    # User is not in the sudo group, double check via sudo -l.
    if ! sudo -l > /dev/null; then
        printf "$red Needs to be run by a user with SUDO. $nc\n" >&2
        exit 1
    fi
fi

# Make sure we are running Ubuntu 16.04 (first supported distro)
if lsb_release -a 2>/dev/null | grep -E -q "^Release.*16.04$"; then
    printf "$green Detected Ubuntu 16.04 $nc\n"
    sleep 1
    export DISTRIBUTION=ubuntu
else
    printf "$red Did not detect a supported release. $nc\n"
    exit 1
fi

# Make sure we are on an appropriate architecture.
if ! uname -p | grep -q x86_64; then
    printf "$red This script currently only supports x86_64 installations. $nc\n"
    exit 1
fi

# Do a dist upgrade to make sure everything is up to date.  Exit if it barfs for whatever reason.
printf "$yellow Using apt to update everything before proceeding ... $nc\n" 
if ! (sudo apt-get update && sudo apt-get dist-upgrade -y); then
    printf "$red Something went wrong with the update ... $nc\n" >&2 && exit 1
fi

# Make sure we have at least wget and git.  Add to this list as needed.
requiredPackages="virt-what wget git zip unzip"
if ! which $requiredPackages; then
    printf "$yellow We need to install some core dependencies ... $nc\n"
    sudo apt-get install -y $requiredPackages
fi

# Detect if we are in a VM ...
# This will install some X dependencies early ... not sure if this should be chagned -- meatbunny
export VIRTTYPE="$(sudo virt-what | head -1)"
# This will install some X dependencies early ... not sure if this should be chagned -- meatbunny
if [[ $VIRTTYPE = "" ]]; then
    printf "$green Detected bare metal ... $nc \n"
    export VIRTTYPE=bare
elif [[ $VIRTTYPE = "virtualbox" ]]; then
    printf "$green Installing for VirtualBox ... $nc\n"
    sleep 1
    sudo apt-get install -y virtualbox-guest-x11 virtualbox-guest-dkms
elif [[ $VIRTTYPE = "vmware" ]]; then
    printf "$green Installing for VMWare ... $nc\n"
    sleep 1
    sudo apt-get install -y open-vm-tools*
else
    printf "$yellow Looks like you're using $VIRTTYPE ... not making any adjustments. $nc\n"
fi

printf "$green All dependencies are met. $nc\n"
