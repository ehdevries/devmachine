Here are some scripts to make my life a little easier when setting up and configuring my development machine.
They are designed to run on Ubuntu and Windows, including Windows Subsystem for Linux (WSL).

- (Windows) If it's not installed already, install Windows Terminal: <https://aka.ms/terminal>

- (Windows) Open your terminal as an administrator and install WSL:

  ```powershell
  wsl --install
  ```

- (Windows) Reboot your machine

- Download this repository

- Open your terminal as a regular non-admin user and navigate to the repository root

- Install the software that you'll need in order to run the remaining scripts:

  ```bash
  # Ubuntu with bash
  chmod +x install-ubuntu-essentials.sh && ./install-ubuntu-essentials.sh
  ```

  ```powershell
  # Windows with PowerShell
  Set-ExecutionPolicy Bypass -Scope Process -Force ; .\install-windows-essentials.ps1
  ```

- Reboot your machine

- Open your terminal and launch Nushell. All subsequent commands are to be invoked from Nushell.

- (WSL) Configure Git to use the same credential manager as Windows:

  ```nu
  git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
  ```

- Select and install applications:

  ```nu
  use nu-scripts/setup.nu * ; install-apps
  ```

- Manually install any applications that opened up in a browser tab or printed a reminder in the terminal

- Restart your terminal

- Select and install extensions:

  ```nu
  use nu-scripts/setup.nu * ; install-extensions
  ```

- Sign in to your password manager or create SSH keys

- Clone this repository into `~/source/machine/devmachine`

- Clone your configuration repository into `~/source/machine/devconfig`

- Select and restore configuration:

  ```nu
  use nu-scripts/setup.nu * ; restore-config
  ```

- Open your global `~/.gitconfig`, un-comment or modify any settings specific to your environment, and save
