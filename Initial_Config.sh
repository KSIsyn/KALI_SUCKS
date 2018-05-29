#!/usr/bin/env bash

######################################################################
#Author:
#This is an effort by many minds and many people in our Hacker Space
#Unallocated Space INFOSEC NIGHT Working Group
#http://www.unallocatedspace.org/uas/
#
#Purpose:  
#In order to get people to step out of their comfort zone and learn a few things about their personal setup
#and personal builds for INFOSEC.  We will configure many things and learn about the internal workings
#of our linux system.
#This script is to perform all the initial configs after a fresh install of Ubuntu 16.04
#This initial will include changes to the following areas:
#Network Configuration
#PAM
#POWER CONFIG
#BASHRC
#SSH
#/etc/profile
#.files (hidden profile configs)
#Accounts
#Groups
#Accessibililty tools
#Crontab
#Tool Removal

##########################################
# Am I being run standalone or was the entire repo cloned?
##########################################

RequiredFiles="dependencies.sh functions.sh networking.sh desktops.sh"

for file in $RequiredFiles; do
    if [ ! -e "$file" ]; then
        printf "\e[0;31m $file is missing.  Make sure you cloned the entire repo ... \e[0m\n" >&2
        exit 1
    fi
done

##########################################
# Sourcing common functions and aliases
##########################################

source functions.sh

###########################################################
# Make sure all dependencies are installed.                
# These should be basic dependencis required by everything.
###########################################################

source dependencies.sh

####################################
# Install a user selected desktop. #               
####################################

source desktops.sh

##########################################

##########################################
#Network Config
#This section wil configure the Network Manager and other areas so that when the system is booted all netwoking is turned off.
#This wil also place shortcuts on the Desktop for differnt network scenerios that can be encountered.

##########################################
#Users and Security Groups


##########################################
#BASHRC

##########################################
#BASH_ALIASES

##########################################

bash -i bootstrap_aliases.sh

##########################################


##########################################



##########################################



##########################################



##########################################

