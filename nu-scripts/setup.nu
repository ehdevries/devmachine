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

let install_dotnet_9 = {||
  print-pad 'Installing .NET 9'
  if (is-windows) {
    winget install --id microsoft.dotnet.sdk.9 --interactive
  } else {
    install-dotnet-snap
    dotnet-installer install sdk 9
  }
}

let install_dotnet_10 = {||
  print-pad 'Installing .NET 10'
  if (is-windows) {
    winget install --id microsoft.dotnet.sdk.10 --interactive
  } else {
    install-dotnet-snap
    dotnet-installer install sdk 10
  }
}

def install-dotnet-snap [] {
  if (which dotnet-installer | is-empty) {
    sudo snap install dotnet --classic
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
# Compare and refresh configuration files
#

#
# Scripts
#

# Refresh scripts from backup
export def 'refresh scripts' [] {
  let source_files = ([$nu.home-dir 'source' 'machine' 'devmachine' 'nu-scripts' '*.*'] | path join | into glob)
  let dest_dir = ([$nu.home-dir '.scripts'] | path join)
  copy-files $source_files $dest_dir
}

#
# Nushell
#

# Compare backup with active Nushell configuration
export def 'compare nushell' [] {
  let source_config = (nushell-source-dir | path join 'config.nu')
  let dest_config = ($nu.config-path)
  let source_env = (nushell-source-dir | path join 'env.nu')
  let dest_env = ($nu.env-path)
  difft $source_config $dest_config
  difft $source_env $dest_env
}

# Refresh Nushell configuration from backup
export def 'refresh nushell' [] {
  let source_files = (nushell-source-dir | path join '*.nu' | into glob)
  let dest_dir = ($nu.config-path | path dirname)
  copy-files $source_files $dest_dir
}

def nushell-source-dir [] {
  [(config-repo) 'config' 'Nushell'] | path join
}

#
# Bash
#

# Compare backup with active Bash aliases
export def 'compare bash aliases' [] {
  if (is-windows) {
    print "I'm only using Bash on Linux right now"
    return
  }
  let source_config = (bash-aliases-source-dir | path join '.bash_aliases')
  let dest_config = ($nu.home-dir | path join '.bash_aliases')
  difft $source_config $dest_config
}

# Refresh Bash aliases from backup
export def 'refresh bash aliases' [] {
  if (is-windows) {
    print "I'm only using Bash on Linux right now"
    return
  }
  let source_files = (bash-aliases-source-dir | path join '.bash_aliases' | into glob)
  let dest_dir = ($nu.home-dir)
  copy-files $source_files $dest_dir
}

def bash-aliases-source-dir [] {
  [(config-repo) 'config'] | path join
}

#
# Ghostty
#

# Compare backup with active Ghostty configuration
export def 'compare ghostty' [] {
  if (is-windows) {
    print 'Ghostty is not yet supported on Windows'
    return
  }
  let source_config = (ghostty-source-dir | path join 'config.ghostty')
  let dest_config = (ghostty-config-dir | path join 'config.ghostty')
  difft $source_config $dest_config
}

# Refresh Ghostty configuration from backup
export def 'refresh ghostty' [] {
  if (is-windows) {
    print 'Ghostty is not yet supported on Windows'
    return
  }
  let source_files = (ghostty-source-dir | path join 'config.ghostty' | into glob)
  let dest_dir = (ghostty-config-dir)
  copy-files $source_files $dest_dir
}

def ghostty-source-dir [] {
  [(config-repo) 'config' 'Ghostty'] | path join
}

def ghostty-config-dir [] {
  if (is-windows) {
    '' # Ghostty is not yet supported on Windows, this is only a placeholder
  } else {
    [$nu.home-dir '.config' 'ghostty'] | path join
  }
}

#
# Git
#

# Compare backup with active Git configuration
export def 'compare git' [] {
  let source_config = (git-source-dir | path join '.gitconfig')
  let dest_config = ($nu.home-dir | path join '.gitconfig')
  difft $source_config $dest_config
}

# Refresh Git configuration from backup
export def 'refresh git' [] {
  let source_files = (git-source-dir | path join '.gitconfig' | into glob)
  let dest_dir = ($nu.home-dir)
  copy-files $source_files $dest_dir
}

def git-source-dir [] {
  [(config-repo) 'config'] | path join
}

#
# Helix
#

# Compare backup with active Helix configuration
export def 'compare helix' [] {
  let source_config = (helix-source-dir | path join 'config.toml')
  let dest_config = (helix-config-dir | path join 'config.toml')
  let source_lang = (helix-source-dir | path join 'languages.toml')
  let dest_lang = (helix-config-dir | path join 'languages.toml')
  difft $source_config $dest_config
  difft $source_lang $dest_lang
}

# Refresh Helix configuration from backup
export def 'refresh helix' [] {
  let source_files = (helix-source-dir | path join '*.toml' | into glob)
  let dest_dir = (helix-config-dir)
  copy-files $source_files $dest_dir
}

def helix-source-dir [] {
  [(config-repo) 'config' 'Helix'] | path join
}

def helix-config-dir [] {
  if (is-windows) {
    [$env.APPDATA 'helix'] | path join
  } else {
    [$nu.home-dir '.config' 'helix'] | path join
  }
}

#
# Lazygit
#

# Compare backup with active Lazygit configuration
export def 'compare lazygit' [] {
  let source_config = (lazygit-source-dir | path join 'config.yml')
  let dest_config = (lazygit-config-dir | path join 'config.yml')
  difft $source_config $dest_config
}

# Refresh Lazygit configuration from backup
export def 'refresh lazygit' [] {
  let source_files = (lazygit-source-dir | path join '*.yml' | into glob)
  let dest_dir = (lazygit-config-dir)
  copy-files $source_files $dest_dir
}

def lazygit-source-dir [] {
  [(config-repo) 'config' 'Lazygit'] | path join
}

def lazygit-config-dir [] {
  if (is-windows) {
    [$env.LOCALAPPDATA 'lazygit'] | path join
  } else {
    [$nu.home-dir '.config' 'lazygit'] | path join
  }
}

#
# PowerShell
#

# Compare backup with active PowerShell configuration
export def 'compare powershell' [] {
  if (not (is-windows)) {
    print "I'm not using PowerShell on Linux right now"
    return
  }
  let source_config = (powershell-source-dir | path join 'profile.ps1')
  let dest_config_ps = (powershell-config-dir | path join 'profile.ps1')
  let dest_config_winps = (windows-powershell-config-dir | path join 'profile.ps1')
  difft $source_config $dest_config_ps
  difft $source_config $dest_config_winps
}

# Refresh PowerShell configuration from backup
export def 'refresh powershell' [] {
  if (not (is-windows)) {
    print "I'm not using PowerShell on Linux right now"
    return
  }
  let source_files = (powershell-source-dir | path join 'profile.ps1' | into glob)
  let dest_dir_ps = (powershell-config-dir)
  let dest_dir_winps = (windows-powershell-config-dir)
  copy-files $source_files $dest_dir_ps
  copy-files $source_files $dest_dir_winps
}

def powershell-source-dir [] {
  [(config-repo) 'config' 'PowerShell'] | path join
}

def powershell-config-dir [] {
  if (is-windows) {
    [$nu.home-dir 'Documents' 'PowerShell'] | path join
  } else {
    '' # I'm not using PowerShell on Linux right now, this is only a placeholder
  }
}

def windows-powershell-config-dir [] {
  if (is-windows) {
    [$nu.home-dir 'Documents' 'WindowsPowerShell'] | path join
  } else {
    '' # Windows PowerShell is only available on Windows, this is only a placeholder
  }
}

#
# Rio
#

# Compare backup with active Rio configuration
export def 'compare rio' [] {
  let source_config = (rio-source-dir | path join 'config.toml')
  let dest_config = (rio-config-dir | path join 'config.toml')
  difft $source_config $dest_config
}

# Refresh Rio configuration from backup
export def 'refresh rio' [] {
  let source_files = (rio-source-dir | path join '*.toml' | into glob)
  let dest_dir = (rio-config-dir)
  copy-files $source_files $dest_dir
}

def rio-source-dir [] {
  [(config-repo) 'config' 'Rio'] | path join
}

def rio-config-dir [] {
  if (is-windows) {
    [$env.LOCALAPPDATA 'rio'] | path join
  } else {
    [$nu.home-dir '.config' 'rio'] | path join
  }
}

#
# smtp4dev
#

# Compare backup with active smtp4dev configuration
export def 'compare smtp4dev' [] {
  let source_config = (smtp4dev-source-dir | path join 'appsettings.json')
  let dest_config = (smtp4dev-config-dir | path join 'appsettings.json')
  difft $source_config $dest_config
}

# Refresh smtp4dev configuration from backup
export def 'refresh smtp4dev' [] {
  let source_files = (smtp4dev-source-dir | path join '*.json' | into glob)
  let dest_dir = (smtp4dev-config-dir)
  copy-files $source_files $dest_dir
}

def smtp4dev-source-dir [] {
  [(config-repo) 'config' 'smtp4dev'] | path join
}

def smtp4dev-config-dir [] {
  if (is-windows) {
    [$env.APPDATA 'smtp4dev'] | path join
  } else {
    [$nu.home-dir '.config' 'smtp4dev'] | path join
  }
}

#
# VS Code
#

# Compare backup with active VS Code configuration
export def 'compare vscode' [] {
  let source_config = (vscode-source-dir | path join 'settings.json')
  let dest_config = (vscode-config-dir | path join 'settings.json')
  let source_keys = (vscode-source-dir | path join 'keybindings.json')
  let dest_keys = (vscode-config-dir | path join 'keybindings.json')
  difft $source_config $dest_config
  difft $source_keys $dest_keys
}

# Refresh VS Code configuration from backup
export def 'refresh vscode' [] {
  let source_files = (vscode-source-dir | path join '*.json' | into glob)
  let dest_dir = (vscode-config-dir)
  copy-files $source_files $dest_dir
}

def vscode-source-dir [] {
  [(config-repo) 'config' 'VSCode'] | path join
}

def vscode-config-dir [] {
  if (is-windows) {
    [$env.APPDATA 'Code' 'User'] | path join
  } else {
    [$nu.home-dir '.config' 'Code' 'User'] | path join
  }
}

#
# WezTerm
#

# Compare backup with active WezTerm configuration
export def 'compare wezterm' [] {
  let source_config = (wezterm-source-dir | path join '.wezterm.lua')
  let dest_config = ($nu.home-dir | path join '.wezterm.lua')
  difft $source_config $dest_config
}

# Refresh WezTerm configuration from backup
export def 'refresh wezterm' [] {
  let source_files = (wezterm-source-dir | path join '.wezterm.lua' | into glob)
  let dest_dir = ($nu.home-dir)
  copy-files $source_files $dest_dir
}

def wezterm-source-dir [] {
  [(config-repo) 'config'] | path join
}

#
# Yazi
#

# Compare backup with active Yazi configuration
export def 'compare yazi' [] {
  let source_config = (yazi-source-dir | path join 'yazi.toml')
  let dest_config = (yazi-config-dir | path join 'yazi.toml')
  let source_theme = (yazi-source-dir | path join 'theme.toml')
  let dest_theme = (yazi-config-dir | path join 'theme.toml')
  difft $source_config $dest_config
  difft $source_theme $dest_theme
}

# Refresh Yazi configuration from backup
export def 'refresh yazi' [] {
  let source_files = (yazi-source-dir | path join '*.toml' | into glob)
  let dest_dir = (yazi-config-dir)
  copy-files $source_files $dest_dir
}

def yazi-source-dir [] {
  [(config-repo) 'config' 'Yazi'] | path join
}

def yazi-config-dir [] {
  if (is-windows) {
    [$env.APPDATA 'yazi' 'config'] | path join
  } else {
    [$nu.home-dir '.config' 'yazi'] | path join
  }
}

#
# Zellij
#

# Compare backup with active Zellij configuration
export def 'compare zellij' [] {
  let source_config = (zellij-source-dir | path join 'config.kdl')
  let dest_config = (zellij-config-dir | path join 'config.kdl')
  difft $source_config $dest_config
}

# Refresh Zellij configuration from backup
export def 'refresh zellij' [] {
  let source_files = (zellij-source-dir | path join '*' | into glob)
  let dest_dir = (zellij-config-dir)
  copy-files $source_files $dest_dir
}

def zellij-source-dir [] {
  [(config-repo) 'config' 'Zellij'] | path join
}

def zellij-config-dir [] {
  if (is-windows) {
    [$env.APPDATA 'Zellij' 'config'] | path join
  } else {
    [$nu.home-dir '.config' 'zellij'] | path join
  }
}

#
# Install the apps of your choice and restore their configuration
#

export def install-apps [] {
  let apps = [
    [name category command];
    ['Terminal essentials' Terminal $install_terminal_essentials]
    [Deno Terminal $install_deno]
    ['.NET 9' Terminal $install_dotnet_9]
    ['.NET 10' Terminal $install_dotnet_10]
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

def config-repo [] {
  [$nu.home-dir 'source' 'machine' 'devconfig'] | path join
}

def copy-files [
  source_files: glob
  dest_dir: path
] {
  if ($dest_dir | path exists) != true { mkdir $dest_dir }
  cp --recursive --verbose ($source_files) ($dest_dir)
}

def print-pad [text] {
  print ''
  print $text
  print ''
}
