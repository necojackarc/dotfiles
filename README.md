# About
There are my ``dotfiles``. It is as bellow.

- ``.vimrc``
- ``.gvimrc``
- ``.bash_profile``
- ``.inputrc`` 

# Features
It is a very mediocre except ``.vimrc``.

My concept of setting ``.vimrc`` is to use as few plugins as possible. For example, I tried to set ``auto-complete`` without any plugins. It's likely that I have realized most of my purpose along with my concept.

If you are interested in my concept, please check my ``.vimrc``.

# Installation
First of all, please ``clone`` my ``git`` repository as follows.

```sh
$ git clone https://github.com/necojackarc/dotfiles ~/dotfiles
```

Before next steps, if you don't want to overwrite your some ``dotfiles``, please modify the ``dotfilesLink.sh``. It create some simple symbolic links at your home directory.

When you are ready, execute the following commands.

```sh
$ chmod +x ~/dotfiles/dotfilesLink.sh
$ ~/dotfiles/dotfilesLink.sh
$ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
```

If you have not yet installed the ``Rubocop``, execute the following statement.

```sh
$ gem install rubocop
```
