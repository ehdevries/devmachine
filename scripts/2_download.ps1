### Download any software that needs to be installed manually
### This script does not require an administrative shell

$downDir = New-Item -Path $([Environment]::GetFolderPath("Desktop")) -Name "to_install" -ItemType Directory -Force
$webClient = New-Object System.Net.WebClient

$webClient.DownloadFile("https://central.github.com/deployments/desktop/desktop/latest/win32", "$downDir\GitHubDesktopSetup.exe")
$webClient.DownloadFile("https://go.microsoft.com/fwlink/?linkid=862648", "$downDir\SqlOpsWindows.zip")
$webClient.DownloadFile("https://www.toggl.com/api/v8/installer?app=td&platform=windows&channel=stable", "$downDir\TogglDesktopInstaller.exe")
$webClient.DownloadFile("https://go.microsoft.com/fwlink/?Linkid=852157", "$downDir\VSCodeSetup.exe")
