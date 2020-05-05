#!/bin/bash
echo '[*] Installing Apk Singner'
apt install apksigner

echo '[*] Installing ApkTool'
git clone https://github.com/Lexiie/Termux-Apktool
cd Termux-Apktool && dpkg -i apktool_2.3.4_all.deb
cd .. && rm -rf Termux-Apktool
echo -e "Installation Complete";
