### Download any software that needs to be installed manually
### This script does not require an administrative shell

$downDir = New-Item -Path $([Environment]::GetFolderPath("Desktop")) -Name "to_install" -ItemType Directory -Force
$webClient = New-Object System.Net.WebClient

$webClient.DownloadFile("https://github.com/bruderstein/nppPluginManager/releases/download/v1.4.9/PluginManager_v1.4.9_x64.zip", "$downDir\nppPluginManager.zip")
$webClient.DownloadFile("https://github-windows.s3.amazonaws.com/GitHubSetup.exe", "$downDir\GitHubSetup.exe")
$webClient.DownloadFile("https://www.toggl.com/api/v8/installer?app=td&platform=windows&channel=stable", "$downDir\TogglDesktopInstaller.exe")
