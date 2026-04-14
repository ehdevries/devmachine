use utils.nu [is-windows is-linux]

#
# Install package managers and version managers
#

export def install-flatpak [] {
  if (is-linux) {
    print-pad "Installing Flatpak"
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    print-pad "Please reboot before using Flatpak"
  }
}

export def install-volta [] {
  print-pad "Installing Volta"
  if (is-windows) {
    winget install --id volta.volta
  } else {
    curl https://get.volta.sh | bash
  }
}

export def install-volta-and-node [] {
  print-pad "Installing Volta and Node"
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

export def install-1password [] {
  print-pad "Installing 1Password"
  if (is-windows) {
    winget install --id agilebits.1password --interactive
  } else {
    print "The easiest way to install 1Password on Linux is to download the package file directly."
    print "See https://1password.com/downloads/linux"
    start https://1password.com/downloads/linux
  }
}

export def install-bat [] {
  print-pad "Installing bat"
  if (is-windows) {
    winget install --id sharkdp.bat
  } else {
    brew install bat
  }
}

export def install-bruno [] {
  print-pad "Installing Bruno"
  if (is-windows) {
    winget install --id bruno.bruno --interactive
  } else {
    flatpak install flathub com.usebruno.Bruno
    # sudo snap install bruno # if snap is preferred
  }
}

export def install-carapace [] {
  print-pad "Installing Carapace"
  if (is-windows) {
    winget install --id rsteube.carapace
  } else {
    brew install carapace
  }
}

export def install-cascadia-code [] {
  print "Install Cascadia Code by downloading and extracting the latest release:"
  if (is-windows) {
    print "(if you're using Windows Terminal, install the Nerd Fonts version so Yazi can render icons)"
  }
  print "https://github.com/microsoft/cascadia-code/releases"
  start "https://github.com/microsoft/cascadia-code/releases"
}

export def install-chrome [] {
  if (is-windows) {
    print-pad "Installing Chrome"
    winget install --id google.chrome.exe --interactive
  }
}

export def install-deno [] {
  print-pad "Installing Deno"
  if (is-windows) {
    winget install --id denoland.deno
  } else {
    curl -fsSL https://deno.land/install.sh | bash
  }
}

export def install-difftastic [] {
  print-pad "Installing Difftastic"
  if (is-windows) {
    winget install --id wilfred.difftastic
  } else {
    brew install difftastic
  }
}

export def install-docker-desktop [] {
  if (is-windows) {
    print-pad "Installing Docker Desktop"
    winget install --id docker.dockerdesktop --interactive
  } else {
    print-pad "Skipping Docker Desktop on Linux for now"
  }
}

export def install-dotnet [] {
  print-pad "Installing .NET"
  if (is-windows) {
    winget install --id microsoft.dotnet.sdk.9 --interactive
    winget install --id microsoft.dotnet.sdk.10 --interactive
  } else {
    sudo snap install dotnet --classic
    dotnet-installer install sdk 9
    dotnet-installer install sdk 10
  }
}

export def install-ear-tag [] {
  if (is-linux) {
    print-pad "Installing Ear Tag"
    flatpak install flathub app.drey.EarTag
  }
}

export def install-fastfetch [] {
  print-pad "Installing Fastfetch"
  if (is-windows) {
    winget install --id fastfetch-cli.fastfetch
  } else {
    brew install fastfetch
  }
}

export def install-firacode [] {
  print-pad "Installing Fira Code"
  if (is-windows) {
    print "Install Fira Code according to the documentation on its GitHub page:"
    print "https://github.com/tonsky/FiraCode"
    start https://github.com/tonsky/FiraCode
  } else {
    sudo apt install fonts-firacode
  }
}

export def install-firefox [] {
  print-pad "Installing Firefox"
  if (is-windows) {
    winget install --id mozilla.firefox --interactive
  } else {
    print "To install the Firefox .deb package, consult Mozilla's documentation:"
    print "https://support.mozilla.org/en-US/kb/install-firefox-linux"
    start https://support.mozilla.org/en-US/kb/install-firefox-linux
  }
}

export def install-ghostty [] {
  if (is-windows) {
    print-pad "Ghostty is not yet supported on Windows"
  } else {
    print-pad "Installing Ghostty"
    sudo snap install ghostty --classic
  }
}

export def install-git [] {
  print-pad "Installing Git"
  if (is-windows) {
    winget install --id git.git --interactive
  } else {
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
  }
}

export def install-gnome-document-scanner [] {
  if (is-linux) {
    print-pad "Installing Gnome Document Scanner"
    flatpak install flathub org.gnome.SimpleScan
  }
}

export def install-gnome-music [] {
  if (is-linux) {
    print-pad "Installing Gnome Music"
    flatpak install flathub org.gnome.Music
  }
}

export def install-gnome-video-player [] {
  if (is-linux) {
    print-pad "Installing Gnome Video Player"
    flatpak install flathub org.gnome.Showtime
  }
}

export def install-helix [] {
  print-pad "Installing Helix"
  if (is-windows) {
    winget install --id helix.helix
  } else {
    brew install helix
  }
}

export def install-lavfilters [] {
  if (is-windows) {
    print-pad "Installing LAV Filters"
    winget install --id nevcairiel.lavfilters --interactive
  }
}

export def install-lazygit [] {
  print-pad "Installing Lazygit"
  if (is-windows) {
    winget install --id jesseduffield.lazygit
  } else {
    brew install lazygit
  }
}

export def install-lutris [] {
  if (is-linux) {
    print-pad "Installing Lutris"
    flatpak install flathub net.lutris.Lutris
  }
}

export def install-node [] {
  print-pad "Installing Node"
  volta install node
}

export def install-notepad-plus-plus [] {
  if (is-windows) {
    print-pad "Installing Notepad++"
    winget install --id notepad++.notepad++ --interactive
  }
}

export def download-notepad-plus-plus-dracula-theme [] {
  if (is-windows) {
    print-pad "Downloading Dracula theme for Notepad++"
    let url = 'https://raw.githubusercontent.com/dracula/notepad-plus-plus/main/generated/Dracula.xml'
    let theme_dir = ([$env.APPDATA 'Notepad++' 'themes'] | path join)
    if ($theme_dir | path exists) != true { mkdir $theme_dir }
    let theme_file = ([$theme_dir 'Dracula.xml'] | path join)
    http get --raw $url | save --force $theme_file
  }
}

export def install-obsidian [] {
  print-pad "Installing Obsidian"
  if (is-windows) {
    winget install --id obsidian.obsidian --interactive
  } else {
    sudo snap install obsidian --classic
  }
}

export def install-powershell [] {
  if (is-windows) {
    print-pad "Installing PowerShell"
    winget install --id microsoft.powershell --interactive
  } else {
    print-pad "Skipping PowerShell on Linux for now"
  }
}

export def install-powertoys [] {
  if (is-windows) {
    print-pad "Installing PowerToys"
    winget install --id microsoft.powertoys --interactive
  }
}

export def install-proton-authenticator [] {
  print-pad "Installing Proton Authenticator"
  if (is-windows) {
    winget install --id proton.protonauthenticator --interactive
  } else {
    print "To install Proton Authenticator on Linux, download the package file directly:"
    print "https://proton.me/authenticator"
    start https://proton.me/authenticator
  }
}

export def install-proton-drive [] {
  print-pad "Installing Proton Drive"
  if (is-windows) {
    winget install --id proton.protondrive --interactive
  } else {
    print-pad "Proton Drive is not yet available on Linux"
  }
}

export def install-proton-vpn [] {
  print-pad "Installing Proton VPN"
  if (is-windows) {
    winget install --id proton.protonvpn --interactive
  } else {
    print "To install Proton VPN on Linux, consult Proton's documentation:"
    print "https://protonvpn.com/support/official-linux-vpn-ubuntu"
    start https://protonvpn.com/support/official-linux-vpn-ubuntu
  }
}

export def install-report-builder [] {
  if (is-windows) {
    print-pad "Installing Microsoft Report Builder"
    winget install --id microsoft.reportbuilder --interactive
  }
}

export def install-rio [] {
  print-pad "Installing Rio"
  if (is-windows) {
    winget install --id raphamorim.rio --interactive
  } else {
    flatpak install flathub com.rioterm.Rio
  }
}

export def install-rust [] {
  if (is-windows) {
    print-pad "Skipping Rust on Windows for now"
  } else {
    print-pad "Installing Rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash
  }
}

export def install-slack [] {
  print-pad "Installing Slack"
  if (is-windows) {
    winget install --id slacktechnologies.slack --interactive
  } else {
    sudo snap install slack
  }
}

export def install-spotify [] {
  print-pad "Installing Spotify"
  if (is-windows) {
    print "Install Spotify from the Windows Store:"
    print "https://www.spotify.com/us/download/windows/"
    start https://www.spotify.com/us/download/windows/
  } else {
    sudo snap install spotify
  }
}

export def install-teams [] {
  if (is-windows) {
    print-pad "Installing Teams"
    winget install --id microsoft.teams --interactive
  }
}

export def install-toggl-track [] {
  if (is-windows) {
    print-pad "Installing Toggl Track"
    winget install --id toggl.toggltrack --interactive
  }
}

export def install-visual-studio [] {
  if (is-windows) {
    print-pad "Installing Visual Studio"
    winget install --id microsoft.visualstudio.2022.professional --interactive
  }
}

export def install-vscode [] {
  print-pad "Installing VS Code"
  if (is-windows) {
    winget install --id microsoft.visualstudiocode --interactive
  } else {
    sudo snap install code --classic
  }
}

export def install-yazi [] {
  print-pad "Installing Yazi"
  if (is-windows) {
    winget install --id sxyazi.yazi
  } else {
    brew install yazi
  }
}

export def install-zellij [] {
  print-pad "Installing Zellij"
  if (is-windows) {
    winget install --id zellij.zellij
  } else {
    brew install zellij
  }
}

export def install-zen [] {
  print-pad "Installing Zen Browser"
  if (is-windows) {
    winget install --id zen-team.zen-browser --interactive
  } else {
    flatpak install flathub app.zen_browser.zen
  }
}

export def install-zola [] {
  print-pad "Installing Zola"
  if (is-windows) {
    winget install --id getzola.zola
  } else {
    brew install zola
  }
}

#
# Install tools and extensions for existing software
#

export def install-dotnet-global-tools [] {
  print-pad "Installing .NET global tools"
  dotnet tool install -g csharpier
  dotnet tool install -g csharp-ls
  dotnet tool install -g csharprepl
  dotnet tool install -g dotnet-ef
  dotnet tool install -g dotnet-tools-outdated
  dotnet tool install -g rnwood.smtp4dev
  dotnet tool install -g roslyn-language-server --prerelease
}

export def install-npm-global-tools [] {
  print-pad "Installing NPM global tools"
  npm install -g @angular/cli
  npm install -g @angular/language-server
  npm install -g typescript
  npm install -g typescript-language-server
  npm install -g vscode-langservers-extracted
}

export def clone-panache-git-https [] {
  print-pad "Cloning panache-git over HTTPS"
  git clone https://github.com/ehdevries/panache-git.git ~/.panache-git
}

export def clone-panache-git-ssh [] {
  print-pad "Cloning panache-git over SSH"
  git clone git@github.com:ehdevries/panache-git.git ~/.panache-git
}

export def install-rust-components [] {
  print-pad "Installing Rust components"
  rustup component add rust-analyzer
}

export def install-vscode-extensions [] {
  print-pad "Installing VS Code extensions"
  code --install-extension adrianwilczynski.user-secrets
  code --install-extension angular.ng-template
  code --install-extension be5invis.toml
  code --install-extension bierner.markdown-mermaid
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

export def install-yazi-packages [] {
  print-pad "Installing Yazi packages"
  ya pkg add yazi-rs/flavors:dracula
}

#
# Helper commands
#

def print-pad [text] {
  print ""
  print $text
  print ""
}
