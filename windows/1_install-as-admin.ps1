### 1) Open an administrative shell
### 2) Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install-as-admin.ps1

Write-Output ""
Write-Output "Enabling Windows Subsystem for Linux 2"
Write-Output ""
wsl --set-default-version 2
