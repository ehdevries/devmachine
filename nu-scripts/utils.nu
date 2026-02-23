# List directory contents in a style similar to Windows File Explorer
export def lse [
  pattern: path = '.' # a file path or glob pattern
] {
  if (ls $pattern | length) > 0 {
    ls $pattern --all --short-names
    | sort-by type name --ignore-case
    | where type != symlink
    | update size { |item| if $item.type == dir { '' } else { $item.size } }
    | update modified { |item| $item.modified | format date '%Y-%m-%d %H:%M' }
    | insert name-str { |item| $item.name | path basename | str downcase }
    | where name-str !~ ntuser and name-str !~ desktop.ini
    | select name type size modified
  }
}

# Show documentation for the Nushell configuration file
export def 'config docs' [] {
  config nu --doc | nu-highlight | less -R
}

# Return the logical opposite of each Boolean expression in the pipeline
export def nope [] {
  each { |it| $it == false }
}

# Check for software updates
export def check [] {
  if (which dotnet-tools-outdated | is-not-empty) {
    dotnet-tools-outdated
    print ""
  }
  if (is-linux) {
    brew outdated
    print ""
    sudo apt update
    apt list --upgradable
  }
  if (is-windows) {
    winget list --upgrade-available --include-unknown
  }
}

# Check for a new Ubuntu release
export def ucheck [] {
  if (is-linux) {
    do-release-upgrade -c
  }
}

# Show the current Ubuntu version
export def uv [] {
  if (is-linux) {
    $'(lsb_release -ds) (lsb_release -cs)'
  }
}

# Check if the current operating system is Linux
export def is-linux [] {
  $nu.os-info.name == 'linux'
}

# Check if the current operating system is Windows
export def is-windows [] {
  $nu.os-info.name == 'windows'
}

# Install and trust the ASP.NET development certificate - desktop Linux
export def trust-dotnet-dev-certs-linux [] {
  # Consider these options for desktop Linux:
  # https://github.com/tmds/linux-dev-certs
  # https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl#linux-specific-considerations
  if (is-linux) {
    print 'not yet implemented'
  } else {
    print 'This command only works on Linux'
  }
}

# Install and trust the ASP.NET development certificate - Windows
export def trust-dotnet-dev-certs-windows [
  password: string # a password to protect the certificate, identical for Windows and WSL
] {
  if (is-windows) {
    let cert_dir = 'C:/dotnet-dev-certs'
    let cert_file = $cert_dir | path join 'https.pfx'
    if ($cert_dir | path exists) != true { mkdir $cert_dir }

    dotnet dev-certs https --clean
    dotnet dev-certs https --export-path $cert_file --password $password --trust
    dotnet dev-certs https --check --trust
  } else {
    print 'This command only works on Windows'
  }
}

# Install and trust the ASP.NET development certificate - WSL
export def trust-dotnet-dev-certs-wsl [
  password: string # a password to protect the certificate, identical for Windows and WSL
] {
  if (is-linux) {
    let cert_dir = '/mnt/c/dotnet-dev-certs'
    let cert_file = $cert_dir | path join 'https.pfx'

    if ($cert_file | path exists) != true {
      print 'The certificate file was not found - install and trust it on Windows first'
      return
    }

    dotnet dev-certs https --clean --import $cert_file --password $password
    dotnet dev-certs https --trust
    dotnet dev-certs https --check --trust
  } else {
    print 'This command only works on WSL'
  }
}
