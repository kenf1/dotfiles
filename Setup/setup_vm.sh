#!bin/zsh

echo "Setup baseline vm"

sudo apt update && sudo apt upgrade
sudo apt install spice-vdagent curl #guest tools

#rm vim, byobu & its dependencies
sudo apt-get uninstall --auto-remove vim byobu

#rm kdeconnect & kwalletmanager
sudo apt-get remove kdeconnect kwalletmanager
sudo apt-get autoclean autoremove

#brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

#install packages
sudo apt update && sudo apt install brave-browser g++

#install vscode
curl -o /home/downloads/vsc.deb
sudo apt install /home/downloads/vsc.deb

echo "Complete"