@echo off
PowerShell -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""& {Invoke-Expression ((New-Object System.Net.WebClient).DownloadString(''https://chocolatey.org/install.ps1'')) ; Write-Output '''' ; Read-Host -Prompt ''Done - Please Press Enter''}""' -Verb RunAs}"
