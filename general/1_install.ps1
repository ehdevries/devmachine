### Install handy tools and apps for my dev machine
###   1) Set the execution policy to allow scripts, i.e. Set-ExecutionPolicy RemoteSigned
###   2) Run this script from an administrative shell

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y 7zip
choco install -y dejavufonts
choco install -y docker-desktop
choco install -y dotnetcore-sdk
choco install -y firacode
choco install -y git
choco install -y git-credential-manager-for-windows
choco install -y keepass
choco install -y linqpad
# choco install -y nodejs-lts  # Un-comment this line if you're going to skip Node Version Manager (see 2_download.ps1)
choco install -y notepadplusplus
# choco install -y powershell-core --install-arguments='"ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1"'
choco install -y rdcman
choco install -y sql-server-management-studio

Write-Output ""
Write-Output "Installing posh-git for Windows PowerShell and adding it to all console hosts"
Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Add-PoshGitToProfile -AllHosts

# Write-Output ""
# Write-Output "Installing posh-git for PowerShell Core and adding it to all console hosts"
# pwsh -Command "& {Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber}"
# pwsh -Command "& {PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force}"
# pwsh -Command "& {Add-PoshGitToProfile -AllHosts}"
