# dotfiles

My dotfiles

## Supported OSs

* Linux
* macOS (not tested)

## Dependencies

### Linux

* gcc (vimproc)
* make (vimproc)
* xsel (tmux-yank)

### macOS

* reattach-to-user-namespace (tmux-yank)

## Installation
Clone this repository:

```sh
$ git clone --recursive git@github.com:necojackarc/dotfiles.git ~/dotfiles
```

In case you don't want to overwrite some of your dotfiles in $HOME, edit `setup.sh`.

Execute the following commands to create symlinks to the dotfiles:

```sh
$ chmod +x ~/dotfiles/setup.sh
$ ~/dotfiles/setup.sh
```

### Bash
To make the most of it, install the following packages:

* [direnv](https://github.com/direnv/direnv)
* [ghq](https://github.com/motemen/ghq)
* [peco](https://github.com/peco/peco)

### tmux
After the initial run, do `Ctrl+T -> Shift+I` to install all plugins.

### Vim

* [TypeScrpt](https://github.com/Microsoft/TypeScript)
  * TSServer is used by ALE
