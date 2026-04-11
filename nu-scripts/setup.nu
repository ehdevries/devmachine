use install.nu *
use refresh.nu *

#
# Windows
#

export def install-apps-on-windows [] {
  install-1password
  install-bat
  install-bruno
  install-carapace
  install-cascadia-code
  install-chrome
  install-deno
  install-difftastic
  install-docker-desktop
  install-dotnet
  install-fastfetch
  install-firacode
  install-firefox
  install-helix
  install-lazygit
  install-node
  install-notepad-plus-plus
  download-notepad-plus-plus-dracula-theme
  install-obsidian
  install-powershell
  install-powertoys
  install-proton-authenticator
  install-report-builder
  install-slack
  install-spotify
  install-teams
  install-toggl-track
  install-visual-studio
  install-vscode
  install-yazi
  install-zellij
  install-zen
  install-zola
  print ""
  print "Install a few apps from the Microsoft Store:"
  print ""
  print "HP Smart:"
  print "https://apps.microsoft.com/detail/9wzdncrfhwlh"
  start https://apps.microsoft.com/detail/9wzdncrfhwlh
  print ""
  print "Microsoft To Do:"
  print "https://apps.microsoft.com/detail/9nblggh5r558"
  start https://apps.microsoft.com/detail/9nblggh5r558
  print ""
  print "Microsoft Remote Desktop:"
  print "https://apps.microsoft.com/store/detail/microsoft-remote-desktop/9WZDNCRFJ3PS"
  start https://apps.microsoft.com/store/detail/microsoft-remote-desktop/9WZDNCRFJ3PS
  print ""
  print "Windows App:"
  print "https://apps.microsoft.com/detail/9n1f85v9t8bn"
  start https://apps.microsoft.com/detail/9n1f85v9t8bn
  print ""
  print "Windows Media Player:"
  print "https://apps.microsoft.com/detail/9wzdncrfj3pt"
  start https://apps.microsoft.com/detail/9wzdncrfj3pt
  print ""
  print "When you're all done, log in to Outlook and install Office apps:"
  print "https://outlook.cloud.microsoft/mail/"
  start https://outlook.cloud.microsoft/mail/
}

export def install-extensions-on-windows [] {
  install-dotnet-global-tools
  install-npm-global-tools
  install-vscode-extensions
  install-yazi-packages
  clone-panache-git-https
}

export def restore-config-on-windows [] {
  refresh scripts
  refresh git
  refresh helix
  refresh lazygit
  refresh nushell
  refresh powershell
  refresh smtp4dev
  refresh vscode
  refresh yazi
  refresh zellij
}

#
# Ubuntu Desktop
#

export def install-apps-on-ubuntu-desktop [] {
  install-1password
  install-bat
  install-bruno
  install-carapace
  install-cascadia-code
  install-deno
  install-difftastic
  install-dotnet
  install-ear-tag
  install-fastfetch
  install-firacode
  install-firefox
  install-ghostty
  install-gnome-document-scanner
  install-gnome-music
  install-gnome-video-player
  install-helix
  install-lazygit
  install-node
  install-obsidian
  install-proton-authenticator
  install-proton-vpn
  install-rust
  install-slack
  install-spotify
  install-vscode
  install-yazi
  install-zellij
  install-zen
  install-zola
}

export def install-extensions-on-ubuntu-desktop [] {
  install-dotnet-global-tools
  install-npm-global-tools
  install-rust-components
  install-vscode-extensions
  install-yazi-packages
  clone-panache-git-ssh
}

export def restore-config-on-ubuntu-desktop [] {
  refresh scripts
  refresh bash aliases
  refresh ghostty
  refresh git
  refresh helix
  refresh lazygit
  refresh nushell
  refresh smtp4dev
  refresh vscode
  refresh yazi
  refresh zellij
}

#
# Ubuntu Desktop, minimal setup
#

export def install-apps-on-ubuntu-desktop-minimal [] {
  install-1password
  install-bat
  install-carapace
  install-cascadia-code
  install-deno
  install-difftastic
  install-ear-tag
  install-fastfetch
  install-firefox
  install-ghostty
  install-gnome-document-scanner
  install-gnome-music
  install-gnome-video-player
  install-helix
  install-lazygit
  install-node
  install-obsidian
  install-proton-authenticator
  install-proton-vpn
  install-rust
  install-spotify
  install-yazi
  install-zellij
  install-zen
  install-zola
}

export def install-extensions-on-ubuntu-desktop-minimal [] {
  install-rust-components
  install-yazi-packages
  clone-panache-git-ssh
}

export def restore-config-on-ubuntu-desktop-minimal [] {
  refresh scripts
  refresh bash aliases
  refresh ghostty
  refresh git
  refresh helix
  refresh lazygit
  refresh nushell
  refresh yazi
  refresh zellij
}

#
# Ubuntu on WSL
#

export def install-apps-on-ubuntu-wsl [] {
  install-bat
  install-carapace
  install-deno
  install-difftastic
  install-dotnet
  install-fastfetch
  install-helix
  install-lazygit
  install-node
  install-rust
  install-yazi
  install-zellij
  install-zola
}

export def install-extensions-on-ubuntu-wsl [] {
  install-dotnet-global-tools
  install-npm-global-tools
  install-rust-components
  install-yazi-packages
  clone-panache-git-https
}

export def restore-config-on-ubuntu-wsl [] {
  refresh scripts
  refresh bash aliases
  refresh git
  refresh helix
  refresh lazygit
  refresh nushell
  refresh smtp4dev
  refresh yazi
  refresh zellij
}
