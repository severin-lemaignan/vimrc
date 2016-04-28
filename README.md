My little vimrc
===============

To install
----------

```
$ git clone https://github.com/severin-lemaignan/vimrc.git $HOME/.vim
$ echo "source ~/.vim/vimrc" > $HOME/.vimrc
```

Then, to bootstrap vundle and install all the plugins:

```
$ cd $HOME/.vim
$ mkdir bundle && cd bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git
$ vim +PluginInstall +qall
```
