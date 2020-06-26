### 1) Open an administrative shell
### 2) Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install-as-admin.ps1

Write-Output ""
Write-Output "Installing software with Chocolatey"
Write-Output ""
choco install -y dejavufonts
choco install -y firacode
choco install -y git
choco install -y git-credential-manager-for-windows
choco install -y notepadplusplus

Write-Output ""
Write-Output "Enabling Windows Subsystem for Linux"
Write-Output ""
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
