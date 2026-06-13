use install.nu *
use refresh.nu *

export def install-apps [] {
  let apps = [
    [name category command];
    ["Terminal essentials" Terminal install-terminal-essentials]
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

  let commands = $extensions | input list --multi --display name "Which extensions would you like to install?" | get command

  for $cmd in $commands { nu --commands $cmd }
}

export def restore-config [] {
  let config = [
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

  let commands = $config | input list --multi --display name "Which apps' configuration would you like to restore?" | get command

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
