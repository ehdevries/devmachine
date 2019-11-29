# before you run this script, make it executable: chmod +x full-ubuntu-1_install.sh

# Step 1: install and upgrade software

cd

# add package source for Git stable channel
sudo add-apt-repository ppa:git-core/ppa

# update all packages
sudo apt update && sudo apt upgrade

# install apt packages
sudo apt install extremetuxracer
sudo apt install fonts-firacode
sudo apt install git
sudo apt install vim

# install snap packages
sudo snap install code --classic
sudo snap install dotnet-sdk --classic
sudo snap install node --channel=12/stable --classic
sudo snap install slack --classic

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
echo $(lsb_release -ds) $(lsb_release -cs) # Ubuntu version
df -h /                                    # disk usage" >> ~/.bashrc
echo "alias cls=clear
alias check='sudo apt update && apt list --upgradable'
alias dotnet=dotnet-sdk.dotnet
alias uv='echo $(lsb_release -ds) $(lsb_release -cs)'" >> ~/.bash_aliases

source ~/.bashrc

# show reminders of stuff that must be done manually
echo
echo "All done!"
echo
echo "REMINDERS:"
echo " - Run the next script to generate SSH keys"
echo " - Run 'sudo apt autoremove' if you want to clean up unused packages"
