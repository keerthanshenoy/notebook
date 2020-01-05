#!/bin/bash

# update system
sudo apt-get update


# configure git 

git config --global color.ui true    # color output
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --list

