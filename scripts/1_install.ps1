### Install handy tools and apps for my dev machine
### Run this script from an administrative shell

Set-ExecutionPolicy RemoteSigned

# Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install some software
choco install -y 7zip
choco install -y git
#choco install -y github        # The GitHub Desktop Chocolatey package is significantly behind as of May 2017, so I'll install it manually
choco install -y gitkraken
choco install -y googlechrome
choco install -y hyper
choco install -y keepass
choco install -y linqpad
choco install -y nodejs-lts
choco install -y notepadplusplus
choco install -y poshgit
choco install -y rdcman
choco install -y slack
choco install -y sql-server-management-studio
#choco install -y toggl         # The Toggl Desktop Chocolatey package is significantly behind as of May 2017, so I'll install it manually
choco install -y visualstudiocode
RefreshEnv.cmd
