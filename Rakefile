# coding: utf-8
#!/usr/bin/ruby

task :default => [:xcode, :zshell, :osx, :brews, :casks, :vim_config, :git_config]

def curl what
  sh "curl -O #{what}"
end

def brew what
  sh "brew install #{what}"
end

def cask what
  sh "brew cask install #{what}"
end

def in_dir dir
  pwd = Dir.pwd
  begin
    Dir.chdir dir
    yield if block_given?
  ensure
    Dir.chdir pwd
  end
end

def git_config setting, what
  sh "git config --global #{setting} #{what}"
end

def ask_for what
  print what
  STDIN.gets.strip
end

#### Download steps ####

desc "Installs xcode. Waits for input while installer is running"
task :xcode do
  puts "You'll need to install XCode from App Store."
  begin
    sh "xcode-select --install"
  rescue
    puts "Looks like xcode failed... was it already installed?"
  ensure
    puts "wait until xcode is installed..."
    STDIN.gets.strip
  end
end

desc "Installs Oh-my zshell"
task :zshell do
  sh "curl -L http://install.ohmyz.sh | sh"
end

desc "Sets some osx preferred settings"
task :osx do
  `git clone https://github.com/haf/osx.git`
  in_dir "osx" do
    sh "./.osx"
    sh %{/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"} unless \
      Dir.exists? '/usr/local/Cellar'
    sh "[[ -e $HOME/.bash_profile ]] || cp .bash_profile ~/"
    sh "touch ~/.homebrew_analytics_user_uuid && chmod 000 ~/.homebrew_analytics_user_uuid"
    sh "[[ -e $HOME/.zshrc_envs ]] || cp .zshrc_envs ~/"
    #sh "export PATH=$HOME/homebrew/bin:$PATH"
  end
  line = "source ~/.zshrc_envs"
  sh "if ! grep -Fxq '#{line}' ~/.zshrc; then echo '#{line}' >> ~/.zshrc; fi"
end

desc "Updates, upgrades and installs brews"
task :brews do
  sh "brew update"
  sh "brew tap homebrew/cask"
  sh "brew tap homebrew/cask-fonts"
  sh "brew upgrade"
  brew "readline --universal"
  %w|
    autoconf
    automake
    colordiff
    ctags
    editorconfig
    erlang
    git
    jq
    libtool
    mr
    ngrep
    nmap
    nvm
    pyenv
    pyenv-virtualenv
    rbenv
    tree
    ucspi-tcp
    vcsh
    yarn
    zlib
  |.each do |r|
    brew r
  end
  brew "nginx --with-spdy"
  brew "go --cross-compile-common"
end

desc "Installs common casks"
task :casks do
  %w|
    1password
    caffeine
    chromium
    docker
    firefox
    flux
    gpg-suite
    iterm2
    skype
    slack
    spectacle
    spotify
    visual-studio-code
    resilio-sync
  |.each do |c|
    cask c
  end
  puts "Remember to run 'flux' to get it set up."
end

desc "Sets computer name. Asks for input"
task :computer_name do
  # Set computer name (as done via System Preferences → Sharing)
  computer_name = ask_for "Computer name: "
  sh "sudo scutil --set ComputerName '#{computer_name}'"
  sh "sudo scutil --set HostName '#{computer_name}'"
  sh "sudo scutil --set LocalHostName '#{computer_name}'"
  sh "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string '#{computer_name.upcase}'"
  sh "sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist"
end

desc 'Configure vim'
task :vim_config do
  in_dir ENV['HOME'] do
    system 'git clone https://github.com/amix/vimrc.git ~/.vim_runtime'
    in_dir '.vim_runtime' do
      sh 'chmod +x install_awesome_vimrc.sh && ./install_awesome_vimrc.sh'
    end
  end
end

desc "Sets minimum git config. Asks for input"
task :git_config do
  git_config "core.editor", "/usr/bin/vim"
  git_config "push.default", "simple"

  user = ask_for "Git user name: "
  git_config "user.name", "'#{user}'"
  email = ask_for "Git user email: "
  git_config "user.email", "'#{email}'"
end
