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
sudo snap install dotnet-sdk --classic
sudo snap install slack
sudo snap install supertuxkart

echo
echo "Adding the dotnet sdk snap and tools to PATH"
echo
echo "
# set PATH so it includes the dotnet sdk snap and tools
if [ -d /snap/dotnet-sdk/current ]
then
  PATH=\"\$PATH:/snap/dotnet-sdk/current\"
fi
if [ -d \$HOME/.dotnet/tools ]
then
  PATH=\"\$PATH:\$HOME/.dotnet/tools\"
fi" >> ~/.profile

echo
echo "Configuring bash to show some useful info on launch"
echo
echo "
# show useful info when the shell launches
echo \$(lsb_release -ds) \$(lsb_release -cs) # Ubuntu version
df -h /                                    # disk usage" >> ~/.bashrc

source ~/.bashrc
source ~/.profile
