### Set-ExecutionPolicy Bypass -Scope Process -Force; .\2_install-part-two.ps1

Write-Output ""
Write-Output "Installing software with Windows Package Manager"
Write-Output ""
winget install --id git.git
winget install --id notepad++.notepad++
winget install --id nushell.nushell

Write-Output ""
Write-Output "Installing PowerShellGet for Windows PowerShell"
Write-Output ""
Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber

Write-Output ""
Write-Output "Installing Scoop"
Write-Output ""
Invoke-WebRequest https://get.scoop.sh -useb | Invoke-Expression

Write-Output ""
Write-Output "Installing Deno"
Write-Output ""
Invoke-WebRequest https://deno.land/x/install/install.ps1 -useb | Invoke-Expression

Start-Process https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio
Start-Process https://www.docker.com/products/docker-desktop
Start-Process https://draculatheme.com/notepad-plus-plus/
Start-Process https://github.com/tonsky/FiraCode
Start-Process https://www.mozilla.org/en-US/firefox/new/
Start-Process https://desktop.github.com/
Start-Process https://insomnia.rest/
Start-Process https://www.linqpad.net/
Start-Process https://www.microsoft.com/en-us/p/microsoft-remote-desktop/9wzdncrfj3ps
Start-Process https://github.com/coreybutler/nvm-windows
Start-Process https://www.microsoft.com/en-us/p/onenote-for-windows-10/9wzdncrfhvjl
Start-Process https://github.com/ehdevries/panache-git
Start-Process https://www.papercut-smtp.com/
Start-Process https://github.com/microsoft/PowerToys
Start-Process https://www.rust-lang.org/tools/install
Start-Process https://slack.com/downloads/windows
Start-Process https://www.microsoft.com/en-us/sql-server/sql-server-downloads
Start-Process https://www.microsoft.com/en-us/p/microsoft-to-do-lists-tasks-reminders/9nblggh5r558
Start-Process https://toggl.com/toggl-desktop/
Start-Process https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6
Start-Process https://visualstudio.microsoft.com/downloads/
Start-Process https://code.visualstudio.com/
Start-Process https://aka.ms/wslstore
Start-Process https://github.com/Microsoft/Terminal
Start-Process https://aka.ms/windowsterminal
