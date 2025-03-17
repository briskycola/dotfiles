#!/bin/sh

# Script to install my dotfiles
# Note: This will override your existing bashrc and zshrc

# Output program description to user
echo "This script will install my dotfiles so you"
echo "can use my terminal settings and aliases."
echo ""
echo "Note: This will override your current settings"
echo "for bash or zsh."
echo ""

# Confirm if the user wants to override their dotfiles
while true; do
    read -p "Do you want to continue? y/n: " USER_CHOICE
    if   [ $USER_CHOICE == 'y' ]; then
        echo ""
        break
    elif [ $USER_CHOICE == 'n' ]; then
        exit 0
    else
        echo "You must select y/n"
        echo ""
        continue
    fi
done

# Prompt the user if they want to use bash or zsh
while true; do
    echo "Which shell would you like to use?"
    echo "1. bash"
    echo "2. zsh"
    read -p "Select your shell: " USER_CHOICE

    if [ $USER_CHOICE == '1' ]; then
        echo "You have selected bash as your shell."
        cp -f bash/bashrc ~/.bashrc
        cp -f bash/bash_aliases ~/.bash_aliases
        cp -f bash/bash_profile ~/.bash_profile
        break
    elif [ $USER_CHOICE == '2' ]; then
        echo "You have selected zsh as your shell"
        echo "Changing shell to zsh"
        sudo chsh -s $(which zsh) $USER
        cp -f zsh/zshrc ~/.zshrc
        cp -f zsh/zsh_aliases ~/.zsh_aliases
        break
    else
        echo "You must select 1 or 2"
        echo ""
    fi
done

# Copy the rest of the config files into ~/.config/
cp -rf config/* ~/.config/*

echo ""
echo "The dotfiles are now applied."
echo "You must restart for the changes to go in effect."
