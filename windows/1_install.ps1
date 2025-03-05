### Set-ExecutionPolicy Bypass -Scope Process -Force; .\1_install.ps1

Write-Output ""
Write-Output "Installing software with Windows Package Manager"
Write-Output ""
winget install --id bruno.bruno --interactive
winget install --id denoland.deno
winget install --id docker.dockerdesktop --interactive
winget install --id fastfetch-cli.fastfetch
winget install --id getzola.zola
winget install --id git.git --interactive
winget install --id github.githubdesktop --interactive
winget install --id gokcehan.lf
winget install --id helix.helix
winget install --id jesseduffield.lazygit
winget install --id microsoft.azuredatastudio --interactive
winget install --id microsoft.powershell --interactive
winget install --id microsoft.powertoys --interactive
winget install --id microsoft.reportbuilder --interactive
winget install --id microsoft.visualstudiocode --interactive
winget install --id mozilla.firefox --interactive
winget install --id notepad++.notepad++ --interactive
winget install --id nushell.nushell --interactive
winget install --id rsteube.carapace
winget install --id sharkdp.bat
winget install --id toggl.toggltrack --interactive
winget install --id wilfred.difftastic

Write-Output ""
Write-Output "Installing PowerShellGet for Windows PowerShell"
Write-Output ""
Install-Module -Name PowerShellGet -Scope CurrentUser -Force -AllowClobber

Write-Output ""
Write-Output "Downloading Dracula theme for Notepad++"
Write-Output ""
Invoke-WebRequest -Uri https://raw.githubusercontent.com/dracula/notepad-plus-plus/master/Dracula.xml -OutFile $env:APPDATA\Notepad++\themes

Write-Output ""
Write-Output "Downloading panache-git"
Write-Output ""
$git = "C:\Program Files\Git\cmd\git.exe"
& $git clone https://github.com/ehdevries/panache-git.git $home\.panache-git

Start-Process https://dotnet.microsoft.com/en-us/download
Start-Process https://github.com/tonsky/FiraCode
Start-Process https://insomnia.rest/
Start-Process https://www.linqpad.net/
Start-Process https://apps.microsoft.com/store/detail/microsoft-remote-desktop/9WZDNCRFJ3PS
Start-Process https://github.com/coreybutler/nvm-windows
Start-Process https://apps.microsoft.com/store/detail/onenote/9WZDNCRFHVJL
Start-Process https://github.com/ehdevries/panache-git
Start-Process https://www.papercut-smtp.com/
Start-Process https://www.rust-lang.org/tools/install
Start-Process https://slack.com/downloads/windows
Start-Process https://apps.microsoft.com/store/detail/microsoft-to-do-lists-tasks-reminders/9NBLGGH5R558
Start-Process https://visualstudio.microsoft.com/downloads/
Start-Process https://github.com/Microsoft/Terminal
Start-Process https://aka.ms/windowsterminal
Start-Process https://aka.ms/wslstorepage
