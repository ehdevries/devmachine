### Before you run this script, make it executable: chmod +x 2_install-part-two-desktop.sh

echo
echo "Adding package repository for RetroArch stable channel"
echo
sudo add-apt-repository ppa:libretro/stable
sudo apt update

echo
echo "Installing apt packages"
echo
sudo apt install extremetuxracer
sudo apt install fonts-firacode
sudo apt install retroarch

echo
echo "Installing snap packages"
echo
sudo snap install code --classic
sudo snap install ghostty --classic
sudo snap install obsidian --classic
sudo snap install slack
sudo snap install supertuxkart

echo
echo "Configuring bash to show some useful info on launch"
echo
echo "
# show useful info when the shell launches
echo \$(lsb_release -ds) \$(lsb_release -cs) # Ubuntu version
df -h /                                    # disk usage" >> ~/.bashrc

source ~/.bashrc
source ~/.profile
