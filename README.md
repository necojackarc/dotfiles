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

In case you don't want to overwrite some of your dotfiles in `$HOME`, edit `setup.sh`.

Execute the following commands to create symlinks to the dotfiles:

```sh
$ chmod +x ~/dotfiles/setup.sh
$ ~/dotfiles/setup.sh
```

To make the most of it, install the following packages:

### Git commit signing with GPG

As Git with my configuration always attempts to sign a commit, you have to have a GPG key in your machine.
Generate a new key if you don't have any but make sure your name and email are the same as your Git ones.

- [Managing commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification)

Set the generated GPG key ID by adding the following to `$HOME/.env`, which is not part of this repository but always loaded from 'profile':

```bash
export GIT_CONFIG_PARAMETERS="'user.signingkey=<YOUR GPG KEY ID>'"
```

If you see an error, you can debug with `GIT_TRACE=1`. If you find something wrong in your GPG key, you can edit it with `gpg --edit-key <KEY_ID>`.

#### Mac

On Max, you need to have `gpg-suite` installed. Plus, you also need to use `gpg2`:

```bash
export GIT_CONFIG_PARAMETERS="'user.signingkey=<YOUR GPG KEY ID>' 'gpg.program=gpg2'"
```

To enable this configuration, run `killall gpg-agent`.

### CLI tools

* [direnv](https://github.com/direnv/direnv)
* [fzf](https://github.com/junegunn/fzf)
* [ghq](https://github.com/motemen/ghq)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [tig](https://github.com/jonas/tig)
* [tmux](https://github.com/tmux/tmux)
* [gh](https://github.com/cli/cli)
* [asdf](https://github.com/asdf-vm/asdf)
* [vim-plug](https://github.com/junegunn/vim-plug)

### tmux
After the initial run, do `Ctrl+B -> Shift+I` to install all plugins.

### Vim
Run `PlugInstall` to install all plugins.

* [TypeScrpt](https://github.com/Microsoft/TypeScript)
  * TSServer is used by ALE

## Tips

### Set computer-specific environment variables

When you'd like to set environment variables that you don't like to commit to the repo but want to set as regular environment variables applied to the logged-in user, you can use a `~/.env` file.
`~/.env` is loaded in .profile, so place `.env` in your home directory.

### Set directory-specific environment variables

`direnv` allows you to set directory-specific variables by placing `.envrc` in the target directory. That file is loaded and unloaded when you get into and get out of that directory.

### Show `***DANGER***` in the prompt message

Set `export IS_DANGER=true` in an `.envrc` where you'd like to display `***DANGER***`.
