### Set-ExecutionPolicy Bypass -Scope Process -Force; .\4_keys.ps1

Write-Output ""
Write-Output "Generating SSH key"
Write-Output ""
ssh-keygen -t ed25519

Write-Output ""
Write-Output "Here is your shiny new SSH public key:"
Get-Content $home\.ssh\id_ed25519.pub

Write-Output ""
Write-Output "Now, copy that entire line and register it with your favorite code hosting services"
Write-Output ""
Write-Output "Some handy links:"
Write-Output "https://gitlab.com/help/ssh/README"
Write-Output "https://gitlab.com/profile/keys"
Write-Output "https://help.github.com/articles/connecting-to-github-with-ssh/"
Write-Output "https://github.com/settings/keys"

Start-Process "https://gitlab.com/help/ssh/README"
Start-Process "https://gitlab.com/profile/keys"
Start-Process "https://help.github.com/articles/connecting-to-github-with-ssh/"
Start-Process "https://github.com/settings/keys"
