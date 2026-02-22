_I'm updating the way I run my scripts. This document is a work in progress._

Here are some scripts to make my life a little easier when setting up and configuring my development machine.

## Ubuntu

- Install the software that you'll need in order to run the remaining scripts. From bash:

  ```bash
  chmod +x install-ubuntu-essentials.sh && ./install-ubuntu-essentials.sh
  ```

## Windows

- If it's not installed already, install Windows Terminal: <https://aka.ms/terminal>

- Install the software that you'll need in order to run the remaining scripts. From PowerShell:

  ```powershell
  Set-ExecutionPolicy Bypass -Scope Process -Force ; .\install-windows-essentials.ps1
  ```
