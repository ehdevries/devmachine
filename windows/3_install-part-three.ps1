### Set-ExecutionPolicy Bypass -Scope Process -Force; .\3_install-part-three.ps1

Write-Output ""
Write-Output "Installing posh-git for Windows PowerShell"
Write-Output ""
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
