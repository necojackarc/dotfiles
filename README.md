# About
There are my `dotfiles` as bellow:

- `.vimrc`
- `.gvimrc`
- `.ideavimrc`
- `.bash_profile`
- `.inputrc`
- `.tumx.conf`
- `.pryrc`

# Installation
First of all, please `clone` my `git` repository as the following:

```sh
$ git clone https://github.com/necojackarc/dotfiles ~/dotfiles
```

Before next steps, if you don't want to overwrite your some `dotfiles`, please modify the `makeDotfileLinks.sh`. It creates some simple symbolic links at your home directory.

When you are ready, execute the following commands:

```sh
$ chmod +x ~/dotfiles/makeDotfileLinks.sh
$ ~/dotfiles/makeDotfileLinks.sh
$ git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vim/bundle/neobundle.vim
```

If you have not yet installed the `Rubocop`, execute the following statement:

```sh
$ gem install rubocop
```
