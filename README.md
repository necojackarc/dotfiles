# About
There are my ``dotfiles``. It is as bellow.

- ``.vimrc``
- ``.gvimrc``
- ``.bash_profile``
- ``.inputrc`` 

# Features
My dotfiles are mediocre except ``.vimrc``.

My ``.vimrc``'s concept is using as few plugins as possible. 

If you are interested in my concept, please check my ``.vimrc``.

# Installation
First of all, please ``clone`` my ``git`` repository as follows.

```sh
$ git clone https://github.com/necojackarc/dotfiles ~/dotfiles
```

Before next steps, if you don't want to overwrite your some ``dotfiles``, please modify the ``makeDotfilesLink.sh``. It create some simple symbolic links at your home directory.

When you are ready, execute the following commands.

```sh
$ chmod +x ~/dotfiles/makeDotfilesLink.sh
$ ~/dotfiles/makeDotfilesLink.sh
$ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
```

If you have not yet installed the ``Rubocop``, execute the following statement.

```sh
$ gem install rubocop
```
