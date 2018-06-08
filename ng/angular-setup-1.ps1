### Install and configure some handy tools for building Angular applications - part 1
### Run this script from an administrative shell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Write-Output ""
Write-Output "Installing Chocolatey package manager"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RefreshEnv.cmd

Write-Output ""
Write-Output "Installing NodeJS JavaScript runtime"
choco install -y nodejs-lts
RefreshEnv.cmd

Write-Output ""
Write-Output "Installing Visual Studio Code editor"
choco install -y visualstudiocode
RefreshEnv.cmd

Write-Output ""
Write-Output "Installing the Angular command line interface"
npm install -g @angular/cli
