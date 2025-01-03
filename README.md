# my dotfiles repo

## mappings:

* nvim/ => ~/.config/nvim/
* bashrc => ~/.bashrc
* bash_aliases => ~/.bash_aliases
* zellij/ => ~/.config/zellij/


### other things:
## locale issue with manpath:
when using arch in wsl remember the following:
`sudo vim /etc/locale.gen`
uncomment en-GB utf and en-US utf
`sudo locale-gen`

## display command not found:
`git clone git@github.com:BaronBeans/display.git`
`cd display`
`make install`
