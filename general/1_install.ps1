### Install handy tools and apps for my dev machine
### Run this script from an administrative shell

Set-ExecutionPolicy RemoteSigned

# Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install some software with Chocolatey
choco install -y 7zip
choco install -y dotnetcore-sdk
choco install -y firacode
choco install -y git
choco install -y keepass
choco install -y linqpad
choco install -y nodejs-lts
choco install -y notepadplusplus
choco install -y poshgit
choco install -y rdcman
choco install -y sql-server-management-studio
RefreshEnv.cmd

# Install some software with npm
npm install -g @angular/cli
npm install -g typescript
