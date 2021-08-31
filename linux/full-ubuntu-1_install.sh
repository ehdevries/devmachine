# before you run this script, make it executable: chmod +x full-ubuntu-1_install.sh

# Step 1: install and upgrade software

cd

# add package source for Git stable channel
sudo add-apt-repository ppa:git-core/ppa

# update all packages
sudo apt update && sudo apt upgrade

# install apt packages
sudo apt install bat
sudo apt install extremetuxracer
sudo apt install fonts-firacode
sudo apt install git
sudo apt install vim

# fix naming collision with a different bat package
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install snap packages
sudo snap install code --classic
sudo snap install dotnet-sdk --classic
sudo snap install node --channel=14/stable --classic
sudo snap install slack --classic
sudo snap install supertuxkart

# install rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
echo "
# configure and run bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line_Minimalist
source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc

# customize your shell experience
echo "
# show useful info when the shell launches
echo \$(lsb_release -ds) \$(lsb_release -cs) # Ubuntu version
df -h /                                    # disk usage" >> ~/.bashrc
echo "alias cls=clear
alias check='sudo apt update && apt list --upgradable'
alias uv='echo \$(lsb_release -ds) \$(lsb_release -cs)'" >> ~/.bash_aliases
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

# show reminders of stuff that must be done manually
echo
echo "All done!"
echo
echo "REMINDERS:"
echo " - Run the next script to generate SSH keys"
echo " - Run 'sudo apt autoremove' if you want to clean up unused packages"
