### 1) Open an administrative shell
### 2) Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install-as-admin.ps1

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
