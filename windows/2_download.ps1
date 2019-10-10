### Skip Chocolatey for anything that has a good auto-updater or needs to be installed manually
### Installers will show up in a "to_install" folder on the desktop
### This script does not require an administrative shell

$downDir = New-Item -Path $([Environment]::GetFolderPath("Desktop")) -Name "to_install" -ItemType Directory -Force
$webClient = New-Object System.Net.WebClient

$webClient.DownloadFile("https://go.microsoft.com/fwlink/?linkid=2049972",                               "$downDir\AzureDataStudioSetup.exe")
$webClient.DownloadFile("https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US",          "$downDir\FirefoxSetup.exe")
$webClient.DownloadFile("https://central.github.com/deployments/desktop/desktop/latest/win32",           "$downDir\GitHubDesktopSetup.exe")
$webClient.DownloadFile("https://releases.hyper.is/download/win",                                        "$downDir\HyperSetup.exe")
$webClient.DownloadFile("https://insomnia.rest/download/#windows",                                       "$downDir\InsomniaSetup.exe")
$webClient.DownloadFile("https://slack.com/ssb/download-win64",                                          "$downDir\SlackSetup.exe")
$webClient.DownloadFile("https://www.toggl.com/api/v8/installer?app=td&platform=windows&channel=stable", "$downDir\TogglDesktopSetup.exe")
$webClient.DownloadFile("https://aka.ms/win32-x64-user-stable",                                          "$downDir\VSCodeSetup.exe")

Start-Process https://www.google.com/chrome/
Start-Process https://github.com/coreybutler/nvm-windows
Start-Process https://draculatheme.com/notepad-plus-plus/
Start-Process https://visualstudio.microsoft.com/downloads/
