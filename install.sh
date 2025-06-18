#!/bin/sh

# Script to install my dotfiles
# Note: This will override your existing bashrc and zshrc

# Output program description to user
echo "This script will install my dotfiles so you"
echo "can use my terminal settings and aliases." ; echo
echo "Note: This will override your current settings"
echo "for bash and zsh." ; echo

# Prompt the user if they want to continue
read -p "Do you want to continue? Y/N: " USER_CHOICE
case "$USER_CHOICE" in
    [Yy])
    echo "Copying files."
    ;;

    [Nn])
    echo "Exiting."
    exit 0
    ;;

    *)
    echo "You must select Y or N."
    exit 1
esac

# Copy bash configuration
cp bash/bashrc       ~/.bashrc
cp bash/bash_aliases ~/.bash_aliases
cp bash/bash_profile ~/.bash_profile

# Copy zsh configuration
cp zsh/zshrc       ~/.zshrc
cp zsh/zsh_aliases ~/.zsh_aliases

# Copy the rest of the config files
cp -r config/* ~/.config/*

# Check the user's current shell
case "$SHELL" in
    */bin/bash*)
    exec bash
    ;;

    */bin/zsh*)
    exec zsh
    ;;
esac

echo "The dotfiles are now applied."
