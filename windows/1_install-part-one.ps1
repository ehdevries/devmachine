### Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install-part-one.ps1

Write-Output ""
Write-Output "Installing software with Windows Package Manager"
Write-Output ""
winget install --id docker.dockerdesktop --interactive
winget install --id git.git --interactive
winget install --id github.githubdesktop --interactive
winget install --id helix.helix
winget install --id jesseduffield.lazygit
winget install --id microsoft.azuredatastudio --interactive
winget install --id microsoft.powershell
winget install --id microsoft.visualstudiocode --interactive
winget install --id mozilla.firefox --interactive
winget install --id notepad++.notepad++ --interactive
winget install --id nushell.nushell
winget install --id rsteube.carapace
winget install --id sharkdp.bat

Write-Output ""
Write-Output "Installing PowerShellGet for Windows PowerShell"
Write-Output ""
Install-Module -Name PowerShellGet -Scope CurrentUser -Force -AllowClobber

Write-Output ""
Write-Output "Installing Scoop"
Write-Output ""
Invoke-WebRequest https://get.scoop.sh -useb | Invoke-Expression

Write-Output ""
Write-Output "Installing Deno"
Write-Output ""
Invoke-WebRequest https://deno.land/x/install/install.ps1 -useb | Invoke-Expression

Start-Process https://dotnet.microsoft.com/en-us/download
Start-Process https://draculatheme.com/notepad-plus-plus/
Start-Process https://github.com/tonsky/FiraCode
Start-Process https://insomnia.rest/
Start-Process https://www.linqpad.net/
Start-Process https://apps.microsoft.com/store/detail/microsoft-remote-desktop/9WZDNCRFJ3PS
Start-Process https://github.com/coreybutler/nvm-windows
Start-Process https://apps.microsoft.com/store/detail/onenote/9WZDNCRFHVJL
Start-Process https://github.com/ehdevries/panache-git
Start-Process https://www.papercut-smtp.com/
Start-Process https://github.com/microsoft/PowerToys
Start-Process https://www.rust-lang.org/tools/install
Start-Process https://slack.com/downloads/windows
Start-Process https://apps.microsoft.com/store/detail/microsoft-to-do-lists-tasks-reminders/9NBLGGH5R558
Start-Process https://toggl.com/track/toggl-desktop/
Start-Process https://visualstudio.microsoft.com/downloads/
Start-Process https://github.com/Microsoft/Terminal
Start-Process https://aka.ms/windowsterminal
Start-Process https://aka.ms/wslstorepage
