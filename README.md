## OSX setup

`curl -O https://raw.githubusercontent.com/lapponiandevil/osx/master/Rakefile && rake prepare`  
`zsh`  
`. ./osx/post-install.zsh`


If it crashes, go into the git-cloned `osx` folder and run `rake` again.

### What it does

 - Installs xcode
 - Setup default osx settings
 - Installs brews
 - Installs casks
 - Installs zshell
 - Asks and sets computer name
 - Asks and sets git name and email
 - Installs nvm and npm

Sponsored by
[qvitoo – A.I. bookkeeping](https://qvitoo.com/?utm_source=github&utm_campaign=repos).
