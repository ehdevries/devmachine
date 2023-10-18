### Set-ExecutionPolicy Bypass -Scope Process -Force; .\2_install-part-two.ps1

Write-Output ""
Write-Output "Installing posh-git"
Write-Output ""
Install-Module -Name posh-git -Scope CurrentUser

Write-Output ""
Write-Output "Installing software with Scoop"
Write-Output ""
scoop update
scoop install zola
