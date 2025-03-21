#!/bin/bash

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
# Remove yay folder
cd .. && rm -rf yay

# Install packages
yay -S $(cat dependencies)

stow wallpapers --adopt && stow hyprland --adopt

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source ~/.zshrc

# Install Homebrew packages
brew install gcc oh-my-posh zsh-autosuggestions zsh-fast-syntax-highlighting

/bin/bash ./update_distro.sh
