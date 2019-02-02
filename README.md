## macOS setup

    curl -O https://raw.githubusercontent.com/haf/osx/master/Rakefile && rake

![End result](./example.png)

### What it does

 - Installs xcode
 - Setup default osx settings
 - Installs brews
 - Installs casks
 - Installs zsh, iterm and sets them up
 - Installs oh-my-zsh with the bullet-train theme,
   sets 256 colours in the terminal and enables kubectl context visualisation
 - Asks and sets computer name properly
 - Asks and sets git name and email
 - Installs latest go, node, .net core, etc

You can read [`Rakefile`](./Rakefile); it's easy to follow.

Sponsored by
[qvitoo – A.I. bookkeeping](https://qvitoo.com/?utm_source=github&utm_campaign=repos).
