use refresh.nu *
use utils.nu [is-windows is-linux]

#
# Install package managers and version managers
#

let install_flatpak = {||
  if (is-linux) {
    print-pad 'Installing Flatpak'
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    print-pad 'Please reboot before using Flatpak'
  }
}

let install_volta = {||
  print-pad 'Installing Volta'
  if (is-windows) {
    winget install --id volta.volta
  } else {
    curl https://get.volta.sh | bash
  }
}

let install_volta_and_node = {||
  print-pad 'Installing Volta and Node'
  if (is-windows) {
    winget install --id volta.volta
  } else {
    curl https://get.volta.sh | bash
  }

  $env.VOLTA_HOME = ([$nu.home-dir '.volta'] | path join)
  $env.PATH = ($env.PATH | prepend ([$env.VOLTA_HOME 'bin'] | path join))

  volta install node
}

#
# Install software with package managers
#

let install_1password = {||
  print-pad 'Installing 1Password'
  if (is-windows) {
    winget install --id agilebits.1password --interactive
  } else {
    print 'The easiest way to install 1Password on Linux is to download the package file directly:'
    print https://1password.com/downloads/linux
    start https://1password.com/downloads/linux
  }
}

let install_bat = {||
  print-pad 'Installing bat'
  if (is-windows) {
    winget install --id sharkdp.bat
  } else {
    brew install bat
  }
}

let install_bruno = {||
  print-pad 'Installing Bruno'
  if (is-windows) {
    winget install --id bruno.bruno --interactive
  } else {
    flatpak install flathub com.usebruno.Bruno
    # sudo snap install bruno # if snap is preferred
  }
}

let install_carapace = {||
  print-pad 'Installing Carapace'
  if (is-windows) {
    winget install --id rsteube.carapace
  } else {
    brew install carapace
  }
}

let install_cascadia_code = {||
  print ''
  print 'Install Cascadia Code by downloading and extracting the latest release:'
  if (is-windows) {
    print "(if you're using Windows Terminal, install the Nerd Fonts version so Yazi can render icons)"
  }
  print https://github.com/microsoft/cascadia-code/releases
  start https://github.com/microsoft/cascadia-code/releases
}

let install_chrome = {||
  if (is-windows) {
    print-pad 'Installing Chrome'
    winget install --id google.chrome.exe --interactive
  } else {
    print-pad 'Skipping Chrome on Linux for now'
  }
}

let install_deno = {||
  print-pad 'Installing Deno'
  if (is-windows) {
    powershell -ExecutionPolicy Bypass -NoProfile -Command 'Invoke-RestMethod https://deno.land/install.ps1 | Invoke-Expression'
  } else {
    curl -fsSL https://deno.land/install.sh | bash
  }
}

let install_difftastic = {||
  print-pad 'Installing Difftastic'
  if (is-windows) {
    winget install --id wilfred.difftastic
  } else {
    brew install difftastic
  }
}

let install_docker_desktop = {||
  if (is-windows) {
    print-pad 'Installing Docker Desktop'
    winget install --id docker.dockerdesktop --interactive
  } else {
    print-pad 'Skipping Docker Desktop on Linux for now'
  }
}

let install_dotnet = {||
  print-pad 'Installing .NET'
  if (is-windows) {
    winget install --id microsoft.dotnet.sdk.9 --interactive
    winget install --id microsoft.dotnet.sdk.10 --interactive
  } else {
    sudo snap install dotnet --classic
    dotnet-installer install sdk 9
    dotnet-installer install sdk 10
  }
}

let install_ear_tag = {||
  if (is-linux) {
    print-pad 'Installing Ear Tag'
    flatpak install flathub app.drey.EarTag
  }
}

let install_fastfetch = {||
  print-pad 'Installing Fastfetch'
  if (is-windows) {
    winget install --id fastfetch-cli.fastfetch
  } else {
    brew install fastfetch
  }
}

let install_fira_code = {||
  print-pad 'Installing Fira Code'
  if (is-windows) {
    print 'Install Fira Code according to the documentation on its GitHub page:'
    print https://github.com/tonsky/FiraCode
    start https://github.com/tonsky/FiraCode
  } else {
    sudo apt install fonts-firacode
  }
}

let install_firefox = {||
  print-pad 'Installing Firefox'
  if (is-windows) {
    winget install --id mozilla.firefox --interactive
  } else {
    print "To install the Firefox .deb package, consult Mozilla's documentation:"
    print https://support.mozilla.org/en-US/kb/install-firefox-linux
    start https://support.mozilla.org/en-US/kb/install-firefox-linux
  }
}

let install_ghostty = {||
  if (is-windows) {
    print-pad 'Ghostty is not yet supported on Windows'
  } else {
    print-pad 'Installing Ghostty'
    sudo snap install ghostty --classic
  }
}

let install_git = {||
  print-pad 'Installing Git'
  if (is-windows) {
    winget install --id git.git --interactive
  } else {
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
  }
}

let install_gnome_document_scanner = {||
  if (is-linux) {
    print-pad 'Installing Gnome Document Scanner'
    flatpak install flathub org.gnome.SimpleScan
  }
}

let install_gnome_music = {||
  if (is-linux) {
    print-pad 'Installing Gnome Music'
    flatpak install flathub org.gnome.Music
  }
}

let install_gnome_video_player = {||
  if (is-linux) {
    print-pad 'Installing Gnome Video Player'
    flatpak install flathub org.gnome.Showtime
  }
}

let install_helix = {||
  print-pad 'Installing Helix'
  if (is-windows) {
    winget install --id helix.helix
  } else {
    brew install helix
  }
}

let install_hp_smart = {||
  if (is-windows) {
    print ''
    print 'Install HP Smart from the Microsoft Store:'
    print https://apps.microsoft.com/detail/9wzdncrfhwlh
    start https://apps.microsoft.com/detail/9wzdncrfhwlh
  }
}

let install_kdlfmt = {||
  print-pad 'Installing kdlfmt'
  if (is-windows) {
    npm install -g kdlfmt
  } else {
    brew install hougesen/tap/kdlfmt
  }
}

let install_lavfilters = {||
  if (is-windows) {
    print-pad 'Installing LAV Filters'
    winget install --id nevcairiel.lavfilters --interactive
  }
}

let install_lazygit = {||
  print-pad 'Installing Lazygit'
  if (is-windows) {
    winget install --id jesseduffield.lazygit
  } else {
    brew install lazygit
  }
}

let install_lutris = {||
  if (is-linux) {
    print-pad 'Installing Lutris'
    flatpak install flathub net.lutris.Lutris
  }
}

let install_ms_office = {||
  if (is-windows) {
    print ''
    print 'Log in to Outlook to install Microsoft Office 365 apps:'
    print https://outlook.cloud.microsoft/mail/
    start https://outlook.cloud.microsoft/mail/
  }
}

let install_node = {||
  print-pad 'Installing Node'
  volta install node
}

let install_notepad_plus_plus = {||
  if (is-windows) {
    print-pad 'Installing Notepad++'
    winget install --id notepad++.notepad++ --interactive
  }
}

let install_obsidian = {||
  print-pad 'Installing Obsidian'
  if (is-windows) {
    winget install --id obsidian.obsidian --interactive
  } else {
    sudo snap install obsidian --classic
  }
}

let install_powershell = {||
  if (is-windows) {
    print-pad 'Installing PowerShell'
    winget install --id microsoft.powershell --interactive
  } else {
    print-pad 'Skipping PowerShell on Linux for now'
  }
}

let install_powertoys = {||
  if (is-windows) {
    print-pad 'Installing PowerToys'
    winget install --id microsoft.powertoys --interactive
  }
}

let install_prettier = {||
  print-pad 'Installing Prettier'
  npm install -g prettier
}

let install_proton_authenticator = {||
  print-pad 'Installing Proton Authenticator'
  if (is-windows) {
    winget install --id proton.protonauthenticator --interactive
  } else {
    print 'To install Proton Authenticator on Linux, download the package file directly:'
    print https://proton.me/authenticator
    start https://proton.me/authenticator
  }
}

let install_proton_drive = {||
  print-pad 'Installing Proton Drive'
  if (is-windows) {
    winget install --id proton.protondrive --interactive
  } else {
    print-pad 'Proton Drive is not yet available on Linux'
  }
}

let install_proton_vpn = {||
  print-pad 'Installing Proton VPN'
  if (is-windows) {
    winget install --id proton.protonvpn --interactive
  } else {
    print "To install Proton VPN on Linux, consult Proton's documentation:"
    print https://protonvpn.com/support/official-linux-vpn-ubuntu
    start https://protonvpn.com/support/official-linux-vpn-ubuntu
  }
}

let install_report_builder = {||
  if (is-windows) {
    print-pad 'Installing Microsoft Report Builder'
    winget install --id microsoft.reportbuilder --interactive
  }
}

let install_rio = {||
  print-pad 'Installing Rio'
  if (is-windows) {
    winget install --id raphamorim.rio --interactive
  } else {
    flatpak install flathub com.rioterm.Rio
  }
}

let install_rust = {||
  if (is-windows) {
    print-pad 'Skipping Rust on Windows for now'
  } else {
    print-pad 'Installing Rust'
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash
  }
}

let install_slack = {||
  print-pad 'Installing Slack'
  if (is-windows) {
    winget install --id slacktechnologies.slack --interactive
  } else {
    sudo snap install slack
  }
}

let install_spotify = {||
  print-pad 'Installing Spotify'
  if (is-windows) {
    print 'Install Spotify from the Windows Store:'
    print https://www.spotify.com/us/download/windows/
    start https://www.spotify.com/us/download/windows/
  } else {
    sudo snap install spotify
  }
}

let install_teams = {||
  if (is-windows) {
    print-pad 'Installing Teams'
    winget install --id microsoft.teams --interactive
  }
}

let install_todo = {||
  if (is-windows) {
    print ''
    print 'Install Microsoft To Do from the Microsoft Store:'
    print https://apps.microsoft.com/detail/9nblggh5r558
    start https://apps.microsoft.com/detail/9nblggh5r558
  }
}

let install_toggl_track = {||
  if (is-windows) {
    print-pad 'Installing Toggl Track'
    winget install --id toggl.toggltrack --interactive
  }
}

let install_visual_studio = {||
  if (is-windows) {
    print-pad 'Installing Visual Studio'
    winget install --id microsoft.visualstudio.2022.professional --interactive
  }
}

let install_vscode = {||
  print-pad 'Installing VS Code'
  if (is-windows) {
    winget install --id microsoft.visualstudiocode --interactive
  } else {
    sudo snap install code --classic
  }
}

let install_windows_app = {||
  if (is-windows) {
    print ''
    print 'Install Windows App from the Microsoft Store:'
    print https://apps.microsoft.com/detail/9n1f85v9t8bn
    start https://apps.microsoft.com/detail/9n1f85v9t8bn
  }
}

let install_windows_media_player = {||
  if (is-windows) {
    print ''
    print 'Install Windows Media Player from the Microsoft Store:'
    print https://apps.microsoft.com/detail/9wzdncrfj3pt
    start https://apps.microsoft.com/detail/9wzdncrfj3pt
  }
}

let install_yazi = {||
  print-pad 'Installing Yazi'
  if (is-windows) {
    winget install --id sxyazi.yazi
  } else {
    brew install yazi
  }
}

let install_zellij = {||
  print-pad 'Installing Zellij'
  if (is-windows) {
    winget install --id zellij.zellij
  } else {
    brew install zellij
  }
}

let install_zed = {||
  print-pad 'Installing Zed'
  if (is-windows) {
    winget install --id zedindustries.zed --interactive
  } else {
    curl -f https://zed.dev/install.sh | bash
  }
}

let install_zen = {||
  print-pad 'Installing Zen Browser'
  if (is-windows) {
    winget install --id zen-team.zen-browser --interactive
  } else {
    flatpak install flathub app.zen_browser.zen
  }
}

let install_zola = {||
  print-pad 'Installing Zola'
  if (is-windows) {
    winget install --id getzola.zola
  } else {
    brew install zola
  }
}

let install_terminal_essentials = {||
  do $install_node
  do $install_bat
  do $install_carapace
  do $install_difftastic
  do $install_fastfetch
  do $install_helix
  do $install_kdlfmt
  do $install_lazygit
  do $install_prettier
  do $install_yazi
  do $install_zellij
}

#
# Install tools and extensions for existing software
#

let install_dotnet_global_tools = {||
  print-pad 'Installing .NET global tools'
  dotnet tool install -g csharpier
  dotnet tool install -g csharp-ls
  dotnet tool install -g csharprepl
  dotnet tool install -g dotnet-ef
  dotnet tool install -g dotnet-tools-outdated
  dotnet tool install -g rnwood.smtp4dev
  dotnet tool install -g roslyn-language-server --prerelease
}

let install_notepad_plus_plus_themes = {||
  if (is-windows) {
    print-pad 'Installing Dracula theme for Notepad++'
    let url = 'https://raw.githubusercontent.com/dracula/notepad-plus-plus/main/generated/Dracula.xml'
    let theme_dir = ([$env.APPDATA 'Notepad++' 'themes'] | path join)
    if ($theme_dir | path exists) != true { mkdir $theme_dir }
    let theme_file = ([$theme_dir 'Dracula.xml'] | path join)
    http get --raw $url | save --force $theme_file
  }
}

let install_npm_global_tools = {||
  print-pad 'Installing NPM global tools'
  npm install -g @angular/cli
  npm install -g @angular/language-server
  npm install -g typescript
  npm install -g typescript-language-server
  npm install -g vscode-langservers-extracted
}

let clone_panache_git_https = {||
  print-pad 'Cloning panache-git over HTTPS'
  git clone https://github.com/ehdevries/panache-git.git ~/.panache-git
}

let clone_panache_git_ssh = {||
  print-pad 'Cloning panache-git over SSH'
  git clone git@github.com:ehdevries/panache-git.git ~/.panache-git
}

let install_rust_components = {||
  print-pad 'Installing Rust components'
  rustup component add rust-analyzer
}

let install_vscode_extensions = {||
  print-pad 'Installing VS Code extensions'
  code --install-extension adrianwilczynski.user-secrets
  code --install-extension angular.ng-template
  code --install-extension be5invis.toml
  code --install-extension bruno-api-client.bruno
  code --install-extension csharpier.csharpier-vscode
  code --install-extension davidanson.vscode-markdownlint
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension docker.docker
  code --install-extension editorconfig.editorconfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension firefox-devtools.vscode-firefox-debug
  code --install-extension ionide.ionide-fsharp
  code --install-extension johnpapa.vscode-peacock
  code --install-extension joshuamorony.angular-inline-jumper
  code --install-extension marp-team.marp-vscode
  code --install-extension meganrogge.template-string-converter
  code --install-extension ms-azure-devops.azure-pipelines
  code --install-extension ms-azuretools.vscode-containers
  code --install-extension ms-dotnettools.csharp
  code --install-extension ms-mssql.mssql
  code --install-extension ms-vscode.powershell
  code --install-extension ms-vscode-remote.remote-wsl
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension pflannery.vscode-versionlens
  code --install-extension pkief.material-icon-theme
  code --install-extension rust-lang.rust-analyzer
  code --install-extension thenuprojectcontributors.vscode-nushell-lang
}

let install_yazi_packages = {||
  print-pad 'Installing Yazi packages'
  ya pkg add yazi-rs/flavors:dracula
}

#
# Install the apps of your choice and restore their configuration
#

export def install-apps [] {
  let apps = [
    [name category command];
    ['Terminal essentials' Terminal $install_terminal_essentials]
    [Deno Terminal $install_deno]
    ['.NET' Terminal $install_dotnet]
    [PowerShell Terminal $install_powershell]
    [Rust Terminal $install_rust]
    [Zola Terminal $install_zola]
    ['Cascadia Code' Font $install_cascadia_code]
    ['Fira Code' Font $install_fira_code]
    [1Password Desktop $install_1password]
    [Bruno Desktop $install_bruno]
    [Chrome Desktop $install_chrome]
    ['Docker Desktop' Desktop $install_docker_desktop]
    ['Ear Tag' 'Desktop (Linux)' $install_ear_tag]
    [Firefox Desktop $install_firefox]
    [Ghostty Desktop $install_ghostty]
    ['Gnome Document Scanner' 'Desktop (Linux)' $install_gnome_document_scanner]
    ['Gnome Music' 'Desktop (Linux)' $install_gnome_music]
    ['Gnome Video Player' 'Desktop (Linux)' $install_gnome_video_player]
    ['HP Smart' 'Desktop (Windows)' $install_hp_smart]
    ['Microsoft Office 365' 'Desktop (Windows)' $install_ms_office]
    ['Microsoft PowerToys' 'Desktop (Windows)' $install_powertoys]
    ['Microsoft Report Builder' 'Desktop (Windows)' $install_report_builder]
    ['Microsoft Teams' 'Desktop (Windows)' $install_teams]
    ['Microsoft To Do' 'Desktop (Windows)' $install_todo]
    [Notepad++ 'Desktop (Windows)' $install_notepad_plus_plus]
    [Obsidian Desktop $install_obsidian]
    ['Proton Authenticator' Desktop $install_proton_authenticator]
    ['Proton Drive' Desktop $install_proton_drive]
    ['Proton VPN' Desktop $install_proton_vpn]
    [Rio Desktop $install_rio]
    [Slack Desktop $install_slack]
    [Spotify Desktop $install_spotify]
    ['Toggl Track' 'Desktop (Windows)' $install_toggl_track]
    ['Visual Studio' 'Desktop (Windows)' $install_visual_studio]
    ['VS Code' Desktop $install_vscode]
    ['Windows App' 'Desktop (Windows)' $install_windows_app]
    ['Windows Media Player' 'Desktop (Windows)' $install_windows_media_player]
    [Zed Desktop $install_zed]
    ['Zen Browser' Desktop $install_zen]
    ['LAV Filters' 'Fun (Windows)' $install_lavfilters]
    [Lutris 'Fun (Linux)' $install_lutris]
  ]

  let commands = $apps | input list --multi 'Which apps would you like to install?' | get command

  for $cmd in $commands { do $cmd }
}

export def install-extensions [] {
  let extensions = [
    [name command];
    ['.NET global tools' $install_dotnet_global_tools]
    ['Notepad++ themes' $install_notepad_plus_plus_themes]
    ['NPM global tools' $install_npm_global_tools]
    ['Panache Git (clone with HTTPS)' $clone_panache_git_https]
    ['Panache Git (clone with SSH)' $clone_panache_git_ssh]
    ['Rust components' $install_rust_components]
    ['VS Code extensions' $install_vscode_extensions]
    ['Yazi packages' $install_yazi_packages]
  ]

  let commands = $extensions | input list --multi --display name 'Which extensions would you like to install?' | get command

  for $cmd in $commands { do $cmd }
}

export def restore-config [] {
  let config = [
    [name command];
    ['Bash aliases' 'refresh bash aliases']
    ['Ghostty' 'refresh ghostty']
    ['Git' 'refresh git']
    ['Helix' 'refresh helix']
    ['Lazygit' 'refresh lazygit']
    ['Nushell config' 'refresh nushell']
    ['Nushell scripts' 'refresh scripts']
    ['PowerShell' 'refresh powershell']
    ['Rio' 'refresh rio']
    ['smtp4dev' 'refresh smtp4dev']
    ['VS Code' 'refresh vscode']
    ['WezTerm' 'refresh wezterm']
    ['Yazi' 'refresh yazi']
    ['Zellij' 'refresh zellij']
  ]

  let commands = $config | input list --multi --display name "Which apps' configuration would you like to restore?" | get command

  for $cmd in $commands { nu --commands $cmd }
}

#
# Helper commands
#

def print-pad [text] {
  print ''
  print $text
  print ''
}
