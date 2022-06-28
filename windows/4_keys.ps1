### Set-ExecutionPolicy Bypass -Scope Process -Force; .\4_keys.ps1

Write-Output ""
Write-Output "Generating RSA SSH keys"
Write-Output ""
ssh-keygen -t rsa -b 4096

Write-Output ""
Write-Output "Generating ED25519 SSH keys"
Write-Output ""
ssh-keygen -t ed25519

Write-Output ""
Write-Output "Here is your RSA SSH public key:"
Get-Content $home\.ssh\id_rsa.pub

Write-Output ""
Write-Output "Here is your ED25519 SSH public key:"
Get-Content $home\.ssh\id_ed25519.pub

Write-Output ""
Write-Output "Here are some handy links:"
Write-Output "https://gitlab.com/-/profile/keys"
Write-Output "https://github.com/settings/keys"

Start-Process "https://gitlab.com/-/profile/keys"
Start-Process "https://github.com/settings/keys"
