#!/bin/bash

##########################################
# note to check for existing aliases script must be run with bash -i 
##########################################

##########################################
# source and expand current aliases
##########################################

shopt -s expand_aliases
source ~/.bashrc
source ~/.bash_aliases

##########################################
# Temp function to create persistiant alias 
##########################################

function permalias () 
{ 
	
 name="$(echo "$*" | cut -d "=" -f 1)"	
 if alias | grep -q $(echo "$*" | cut -d "=" -f 1) > /dev/null 
	then
		echo "Alias for $name already exists. Skipping to next alias"
	else
		echo "Adding new alias $* "
		alias "$*";
		echo alias "$*" >> ~/.bash_aliases
 fi
}

##########################################
#quick change to parent directory
##########################################
permalias ..="cd .."
