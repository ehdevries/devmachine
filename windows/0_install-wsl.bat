@echo off
PowerShell -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""& {Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux, VirtualMachinePlatform -All ; Write-Output '''' ; Read-Host -Prompt ''Done - Please Press Enter''}""' -Verb RunAs}"
