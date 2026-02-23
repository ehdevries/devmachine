use utils.nu is-windows

#
# Scripts
#

# Refresh scripts from backup
export def 'refresh scripts' [] {
  let source_files = ([(config-repo) 'scripts' '*.*'] | path join | into glob)
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
  let source_config = (ghostty-source-dir | path join 'config')
  let dest_config = (ghostty-config-dir | path join 'config')
  difft $source_config $dest_config
}

# Refresh Ghostty configuration from backup
export def 'refresh ghostty' [] {
  if (is-windows) {
    print 'Ghostty is not yet supported on Windows'
    return
  }
  let source_files = (ghostty-source-dir | path join 'config' | into glob)
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
    [$env.APPDATA 'lazygit'] | path join
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
    [$env.APPDATA 'yazi'] | path join
  } else {
    [$nu.home-dir '.config' 'yazi'] | path join
  }
}

#
# Zellij
#

# Compare backup with active Zellij configuration
export def 'compare zellij' [] {
  if (is-windows) {
    print 'Zellij is not yet supported on Windows'
    return
  }
  let source_config = (zellij-source-dir | path join 'config.kdl')
  let dest_config = (zellij-config-dir | path join 'config.kdl')
  difft $source_config $dest_config
}

# Refresh Zellij configuration from backup
export def 'refresh zellij' [] {
  if (is-windows) {
    print 'Zellij is not yet supported on Windows'
    return
  }
  let source_files = (zellij-source-dir | path join '*' | into glob)
  let dest_dir = (zellij-config-dir)
  copy-files $source_files $dest_dir
}

def zellij-source-dir [] {
  [(config-repo) 'config' 'Zellij'] | path join
}

def zellij-config-dir [] {
  if (is-windows) {
    '' # Zellij is not yet supported on Windows, this is only a placeholder
  } else {
    [$nu.home-dir '.config' 'zellij'] | path join
  }
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
