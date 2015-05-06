# About
There are my `dotfiles`. It is as bellow.

- `.vimrc`
- `.gvimrc`
- `.ideavimrc`
- `.tumx.conf`
- `.bash_profile`
- `.inputrc`

# Installation
First of all, please `clone` my `git` repository as follows.

```sh
$ git clone https://github.com/necojackarc/dotfiles ~/dotfiles
```

Before next steps, if you don't want to overwrite your some `dotfiles`, please modify the `makeDotfileLinks.sh`. It create some simple symbolic links at your home directory.

When you are ready, execute the following commands.

```sh
$ chmod +x ~/dotfiles/makeDotfileLinks.sh
$ ~/dotfiles/makeDotfileLinks.sh
$ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
```

If you have not yet installed the `Rubocop`, execute the following statement.

```sh
$ gem install rubocop
```
