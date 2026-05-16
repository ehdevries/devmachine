use install.nu *
use refresh.nu *

export def install-apps [] {
  let apps = [
    [name category command];
    ["Terminal essentials (Node, Zellij, Helix, etc.)" Terminal install-terminal-essentials]
    [Deno Terminal install-deno]
    [".NET" Terminal install-dotnet]
    [PowerShell Terminal install-powershell]
    [Rust Terminal install-rust]
    [Zola Terminal install-zola]
    ["Cascadia Code" Font install-cascadia-code]
    ["Fira Code" Font install-fira-code]
    [1Password Desktop install-1password]
    [Bruno Desktop install-bruno]
    [Chrome Desktop install-chrome]
    ["Docker Desktop" Desktop install-docker-desktop]
    ["Ear Tag" "Desktop (Linux)" install-ear-tag]
    [Firefox Desktop install-firefox]
    [Ghostty Desktop install-ghostty]
    ["Gnome Document Scanner" "Desktop (Linux)" install-gnome-document-scanner]
    ["Gnome Music" "Desktop (Linux)" install-gnome-music]
    ["Gnome Video Player" "Desktop (Linux)" install-gnome-video-player]
    ["HP Smart" "Desktop (Windows)" install-hp-smart]
    ["Microsoft Office 365" "Desktop (Windows)" install-ms-office]
    ["Microsoft PowerToys" "Desktop (Windows)" install-powertoys]
    ["Microsoft Report Builder" "Desktop (Windows)" install-report-builder]
    ["Microsoft Teams" "Desktop (Windows)" install-teams]
    ["Microsoft To Do" "Desktop (Windows)" install-todo]
    [Notepad++ "Desktop (Windows)" install-notepad-plus-plus]
    [Obsidian Desktop install-obsidian]
    ["Proton Authenticator" Desktop install-proton-authenticator]
    ["Proton Drive" Desktop install-proton-drive]
    ["Proton VPN" Desktop install-proton-vpn]
    [Rio Desktop install-rio]
    [Slack Desktop install-slack]
    [Spotify Desktop install-spotify]
    ["Toggl Track" "Desktop (Windows)" install-toggl-track]
    ["Visual Studio" "Desktop (Windows)" install-visual-studio]
    ["VS Code" Desktop install-vscode]
    ["Windows App" "Desktop (Windows)" install-windows-app]
    ["Windows Media Player" "Desktop (Windows)" install-windows-media-player]
    [Zed Desktop install-zed]
    ["Zen Browser" Desktop install-zen]
    ["LAV Filters" "Fun (Windows)" install-lavfilters]
    [Lutris "Fun (Linux)" install-lutris]
  ]

  let commands = $apps | input list --multi "Which apps would you like to install?" | get command

  for $cmd in $commands { nu --commands $cmd }
}

export def install-extensions [] {
  let extensions = [
    [name command];
    [".NET global tools" install-dotnet-global-tools]
    ["Notepad++ themes" install-notepad-plus-plus-themes]
    ["NPM global tools" install-npm-global-tools]
    ["Panache Git (clone with HTTPS)" clone-panache-git-https]
    ["Panache Git (clone with SSH)" clone-panache-git-ssh]
    ["Rust components" install-rust-components]
    ["VS Code extensions" install-vscode-extensions]
    ["Yazi packages" install-yazi-packages]
  ]

  let commands = $extensions | input list --multi "Which extensions would you like to install?" | get command

  for $cmd in $commands { nu --commands $cmd }
}

export def restore-config [] {
  let apps = [
    [name command];
    ["Bash aliases" "refresh bash aliases"]
    ["Ghostty" "refresh ghostty"]
    ["Git" "refresh git"]
    ["Helix" "refresh helix"]
    ["Lazygit" "refresh lazygit"]
    ["Nushell config" "refresh nushell"]
    ["Nushell scripts" "refresh scripts"]
    ["PowerShell" "refresh powershell"]
    ["Rio" "refresh rio"]
    ["smtp4dev" "refresh smtp4dev"]
    ["VS Code" "refresh vscode"]
    ["WezTerm" "refresh wezterm"]
    ["Yazi" "refresh yazi"]
    ["Zellij" "refresh zellij"]
  ]

  let commands = $apps | input list --multi "Which apps' config would you like to restore?" | get command

  for $cmd in $commands { nu --commands $cmd }
}

def install-terminal-essentials [] {
  install-node
  install-bat
  install-carapace
  install-difftastic
  install-fastfetch
  install-helix
  install-kdlfmt
  install-lazygit
  install-prettier
  install-yazi
  install-zellij
}

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
  install-fira-code
  install-firefox
  install-helix
  install-kdlfmt
  install-lazygit
  install-node
  install-notepad-plus-plus
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
  install-notepad-plus-plus-themes
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
  install-fira-code
  install-firefox
  install-ghostty
  install-gnome-document-scanner
  install-gnome-music
  install-gnome-video-player
  install-helix
  install-kdlfmt
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
  install-kdlfmt
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
  install-kdlfmt
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
