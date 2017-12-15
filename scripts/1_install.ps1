### Install handy tools and apps for my dev machine
### Run this script from an administrative shell

Set-ExecutionPolicy RemoteSigned

# Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install some software with Chocolatey
choco install -y 7zip
choco install -y dotnetcore-sdk
choco install -y git
#choco install -y github-desktop    # Github Desktop gets updates so often that it's hard for the Chocolatey package to keep up
choco install -y gitkraken
choco install -y googlechrome
choco install -y hyper
choco install -y keepass
choco install -y linqpad
choco install -y nodejs-lts
choco install -y notepadplusplus
choco install -y poshgit
choco install -y postman
choco install -y rdcman
#choco install -y slack             # Slack gets updates so often that it's annoying to have Chocolatey reinstall it each time
choco install -y sql-server-management-studio
#choco install -y toggl             # The Toggl Desktop Chocolatey package is significantly behind as of May 2017, so I'll install it manually
#choco install -y visualstudiocode  # VS Code gets updates so often that it's hard for the Chocolatey package to keep up
RefreshEnv.cmd

# Install some software with npm
npm install -g @angular/cli
npm install -g typescript
