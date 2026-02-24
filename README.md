Here are some scripts to make my life a little easier when setting up and configuring my development machine.

## Ubuntu

- Install the software that you'll need in order to run the remaining scripts. From bash:

  ```bash
  chmod +x install-ubuntu-essentials.sh && ./install-ubuntu-essentials.sh
  ```

- Reboot your machine

- From your terminal, launch Nushell. All subsequent commands are to be invoked from Nushell.

- Install the appropriate applications for your environment:

  ```nu
  use nu-scripts/setup.nu *

  install-apps-on-ubuntu-desktop         # for a full Ubuntu Desktop setup
  install-apps-on-ubuntu-desktop-minimal # for a minimal Ubuntu Desktop setup
  install-apps-on-ubuntu-wsl             # for Ubuntu on WSL
  ```

- Restart your terminal

- Install the appropriate extensions for your environment:

  ```nu
  use nu-scripts/setup.nu *

  install-extensions-on-ubuntu-desktop         # for a full Ubuntu Desktop setup
  install-extensions-on-ubuntu-desktop-minimal # for a minimal Ubuntu Desktop setup
  install-extensions-on-ubuntu-wsl             # for Ubuntu on WSL
  ```

- Clone this repo into ~/source/machine/devmachine

- Clone your configuration repo into ~/source/machine/devconfig

- Restore the appropriate configuration for your environment:

  ```nu
  use nu-scripts/setup.nu *

  restore-config-on-ubuntu-desktop         # for a full Ubuntu Desktop setup
  restore-config-on-ubuntu-desktop-minimal # for a minimal Ubuntu Desktop setup
  restore-config-on-ubuntu-wsl             # for Ubuntu on WSL
  ```

## Windows

- If it's not installed already, install Windows Terminal: <https://aka.ms/terminal>

- Install the software that you'll need in order to run the remaining scripts. From PowerShell:

  ```powershell
  Set-ExecutionPolicy Bypass -Scope Process -Force ; .\install-windows-essentials.ps1
  ```

- Open your terminal as an administrator and install WSL:

  ```powershell
  wsl --install
  ```

- Restart your terminal, then launch Nushell. All subsequent commands are to be invoked from Nushell.

- Install applications:

  ```nu
  use nu-scripts/setup.nu *
  install-apps-on-windows
  ```

- Manually install any applications from Microsoft that opened up in a browser tab or printed a reminder in the terminal.

- Restart your terminal

- Install extensions:

  ```nu
  use nu-scripts/setup.nu *
  install-extensions-on-windows
  ```

- Clone this repo into ~/source/machine/devmachine

- Clone your configuration repo into ~/source/machine/devconfig

- Restore configuration:

  ```nu
  use nu-scripts/setup.nu *
  restore-config-on-windows
  ```
