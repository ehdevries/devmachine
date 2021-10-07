### 1) Open an administrative shell
### 2) Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install-as-admin.ps1

Write-Output ""
Write-Output "Installing Windows Subsystem for Linux 2"
Write-Output ""
wsl --install
wsl --set-default-version 2
