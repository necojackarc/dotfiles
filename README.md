# dotfiles

My dotfiles

## Supported OSs

* Linux
* macOS

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

To make the most of it, install the following packages:

### Common

* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fzf](https://github.com/junegunn/fzf)

### Bash

* [direnv](https://github.com/direnv/direnv)
* [ghq](https://github.com/motemen/ghq)
* [tig](https://github.com/jonas/tig)

### tmux
After the initial run, do `Ctrl+B -> Shift+I` to install all plugins.

### Vim

* [TypeScrpt](https://github.com/Microsoft/TypeScript)
  * TSServer is used by ALE

### Git
* [delta](https://github.com/dandavison/delta)

## Tips
### Set computer-specific environment variables
When you'd like to set environent varilabs that you don't like to commit to the repo but want to set as regular environment variables applied to the logged-in user, you can use a `~/.env` file.
`~/.env` is loaded in .profile, so place `.env` in your home directory.

### Set directory-specific environment variables
`direnv` allows you to set directory-specifi variables by placing `.envrc` in the target directory. That file is loaded and unloaded when you get into and get out of that directory.

### Show `***DANGER***` in the prompt message
Set `export IS_DANGER=true` in an `.envrc` where you'd like to display `***DANGER***`.
