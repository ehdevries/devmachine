### Install handy tools and apps for my dev machine
###   1) Set the execution policy to allow scripts, i.e. Set-ExecutionPolicy RemoteSigned
###   2) Run this script from an administrative shell

# Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install some software with Chocolatey
choco install -y 7zip
choco install -y dotnetcore-sdk
choco install -y firacode
choco install -y git
choco install -y git-credential-manager-for-windows
choco install -y keepass
choco install -y linqpad
choco install -y nodejs-lts  # Remove if you plan to use Node Version Manager (see 2_download.ps1)
choco install -y notepadplusplus
choco install -y poshgit
choco install -y powershell-core --install-arguments='"ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1"'
choco install -y rdcman
choco install -y sql-server-management-studio
RefreshEnv.cmd

# Install some software with npm
npm install -g @angular/cli
npm install -g typescript
