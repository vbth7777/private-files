#!/bin/bash
cd ~/.config/
# Configs
rm -rf bspwm nvim fish picom polybar alacritty mpv
sudo pacman -S neovim fish alacritty polybar mpv picom
git clone https://github.com/vbth7777/my-fish-config fish
git clone https://github.com/vbth7777/my-alacritty-config alacritty
git clone https://github.com/vbth7777/astronvim-configure nvim
git clone https://github.com/vbth7777/mpv-configure mpv
# git clone https://github.com/vbth7777/my-bspwm-config bspwm
# git clone https://github.com/vbth7777/my-picom-config
# git clone https://github.com/vbth7777/my-polybar-config
# mv my-bspwm-config bspwm
# mv astronvim-configure nvim
# mv my-fish-config fish
# mv my-picom-config picom
# mv my-polybar-config polybar
# mv my-alacritty-config alacritty
# mv mpv-configure mpv

# Dependencies
git clone https://github.com/vbth7777/private-files
cd ~
git clone https://github.com/gh0stzk/dotfiles
cd dotfiles
sudo chmod +x RiceInstaller
./RiceInstaller
cd ~/.config/
rm -rf bspwm
git clone https://github.com/vbth7777/bspwm-configure bspwm

