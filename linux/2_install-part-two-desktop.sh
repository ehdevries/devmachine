### before you run this script, make it executable: chmod +x 2_install-part-two-desktop.sh

# add package source for RetroArch stable channel
sudo add-apt-repository ppa:libretro/stable
sudo apt update

# install apt packages
sudo apt install extremetuxracer
sudo apt install fonts-firacode
sudo apt install retroarch

# install snap packages
sudo snap install code --classic
sudo snap install dotnet-sdk --classic
sudo snap install slack
sudo snap install supertuxkart

# customize your shell experience
echo "
# show useful info when the shell launches
echo \$(lsb_release -ds) \$(lsb_release -cs) # Ubuntu version
df -h /                                    # disk usage" >> ~/.bashrc
echo "
# set PATH so it includes dotnet core sdk snap and tools
if [ -d /snap/dotnet-sdk/current ]
then
  PATH=\"\$PATH:/snap/dotnet-sdk/current\"
fi
if [ -d \$HOME/.dotnet/tools ]
then
  PATH=\"\$PATH:\$HOME/.dotnet/tools\"
fi" >> ~/.profile

source ~/.profile
