#!/bin/bash

##########################################
# Temp function to create persistiant alias 
##########################################

function permalias () 
{ 
	alias "$*";
	echo alias "$*" >> ~/.bash_aliases
 fi
}

##########################################
#quick change to parent directory
##########################################
permalias ..="cd .."
