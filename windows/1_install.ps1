### Install handy tools and apps for my dev machine
###   1) Set the execution policy to allow scripts, i.e. Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
###   2) Run this script from an administrative shell

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y 7zip
choco install -y dejavufonts
choco install -y firacode
choco install -y git
choco install -y git-credential-manager-for-windows
choco install -y notepadplusplus

Write-Output ""
Write-Output "Installing posh-git for Windows PowerShell"
Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
