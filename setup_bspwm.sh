#!/bin/bash
cd ~/.config/
rm -rf bspwm nvim fish picom polybar alacritty mpv
git clone https://github.com/vbth7777/my-bspwm-config
git clone https://github.com/vbth7777/my-fish-config
git clone https://github.com/vbth7777/my-picom-config
git clone https://github.com/vbth7777/my-polybar-config
git clone https://github.com/vbth7777/my-alacritty-config
git clone https://github.com/vbth7777/neovim-configure
git clone https://github.com/vbth7777/mpv-configure
mv my-bspwm-config bspwm
mv neovim-configure nvim
mv my-fish-config fish
mv my-picom-config picom
mv my-polybar-config polybar
mv my-alacritty-config alacritty
mv mpv-configure mpv
