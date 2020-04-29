# before you run this script, make it executable: chmod +x wsl-ubuntu.sh

# if you're at work and 'sudo apt update' fails, you might need to configure a proxy for http(s) traffic
# un-comment the following lines and replace the URL to point to your proxy
# cd /etc/apt/apt.conf.d
# sudo touch 80proxy
# sudo echo 'Acquire::http::proxy "http://proxy.example.com:8080/";' >> 80proxy
# sudo echo 'Acquire::https::proxy "https://proxy.example.com:8080/";' >> 80proxy

cd

# add package source for Git stable channel
sudo add-apt-repository ppa:git-core/ppa

# update all packages
sudo apt update && sudo apt upgrade

# install Node.js LTS using Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts

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

# create a symbolic link to your source code in Windows
sourcePathDefault="/mnt/c/Users/$(whoami)/source/"
echo "Where do you keep your source code in Windows?"
echo "[press Enter to accept default: $sourcePathDefault]"
read sourcePathInput
if [ -z "$sourcePathInput" ]
then
  sourcePath=$sourcePathDefault
else
  sourcePath=$sourcePathInput
fi
while [ ! -d "$sourcePath" ]
do
  echo "Whoops, that is not a valid directory"
  echo "Pro tip: your Windows C: drive is mounted at /mnt/c/"
  echo "So...where do you keep your source code in Windows?"
  read sourcePath
done
ln -s "$sourcePath" source
echo "Cool. The 'source' directory in WSL now links to your source code directory in Windows"

source ~/.bashrc

# show reminders of stuff that must be done manually
echo
echo "All done!"
echo
echo "REMINDERS:"
echo " - Change the WSL console host's default font to something with better Unicode support (i.e. DejaVu Sans Mono)"
echo " - Run 'sudo apt autoremove' if you want to clean up unused packages"
