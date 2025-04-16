#!/bin/sh

# Script to install my dotfiles
# Note: This will override your existing bashrc and zshrc

# Output program description to user
echo "This script will install my dotfiles so you"
echo "can use my terminal settings and aliases." ; echo
echo "Note: This will override your current settings"
echo "for bash and zsh." ; echo

# Prompt user before proceeding
read -p "Do you want to continue? Y/N: " USER_CHOICE

if  [ $USER_CHOICE = 'y' ] || [ $USER_CHOICE = 'Y' ]; then
    # Copy bash files
    cat bash/bashrc         > ~/.bashrc
    cat bash/bash_aliases   > ~/.bash_aliases
    cat bash/bash_profile   > ~/.bash_profile

    # Copy zsh files
    cat zsh/zshrc           > ~/.zshrc
    cat zsh/zsh_aliases     > ~/.zsh_aliases

    # Copy the rest of the config files into ~/.config/
    cp -rf config/* ~/.config/*

    echo ; echo "The dotfiles are now applied."
    echo "Please close and reopen your terminal for the changes to be applied."
elif [ $USER_CHOICE = 'n' ] || [ $USER_CHOICE = 'N' ]; then
    echo "Exiting."
    exit 0
else
    echo "You must select Y/N"
    exit 1
fi
