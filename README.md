# my dotfiles repo

Most of the nvim config comes from lunarvim (https://github.com/LunarVim/Neovim-from-scratch)

## mappings:

* tmux.conf => ~/.tmux.conf
* init.lua => ~/.config/nvim/init.lua
* lua => ~/.config/nvim/lua
* bashrc => ~/.bashrc
* bash_aliases => ~/.bash_aliases

### tmux

* <prefix> c - create new window
* <prefix> n - next window
* <prefix> p - previous window
* <prefix> " - new split horizontal
* <prefix> % - new split horizontal


# GWSL
Silent Startup
Want to start GWSL silently at startup? Or just want to bypass the dashboard? Here is how to do it.
To Run Silently At Startup
The easiest way is to add it to the Start Menu’s startup folder.

First navigate to %AppData%/Microsoft/Windows/Start Menu/Programs/Startup in File Explorer (Paste the path in Explorer’s path entry box).
Then RightClick –> New –> Shortcut.
If you installed GWSL from the Store, type GWSL.exe --r --startup, click next, and finish.
If you have installed it with the traditional GitHub installer, type %AppData%/GWSL/GWSL.exe --r --startup in the text box, click next, then finish.
Note the --startup flag requires GWSL version 1.3.7 and up.
