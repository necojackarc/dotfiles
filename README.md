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
If `~/.vim` or `~/.tmux` already exists as a real directory, `setup.sh` leaves it and exits.

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

Set the generated GPG key ID in `~/.gitconfig.local` (see [Set computer-specific Git config](#set-computer-specific-git-config)):

```ini
[user]
	signingkey = <YOUR GPG KEY ID>
```

If you see an error, you can debug with `GIT_TRACE=1`. If you find something wrong in your GPG key, you can edit it with `gpg --edit-key <KEY_ID>`.

#### Mac

On Mac, you need to have `gpg-suite` installed. Plus, you also need to use `gpg2`:

```ini
[user]
	signingkey = <YOUR GPG KEY ID>
[gpg]
	program = gpg2
```

To enable this configuration, run `killall gpg-agent`.

### CLI tools

* [direnv](https://github.com/direnv/direnv)
* [fzf](https://github.com/junegunn/fzf)
* [gh](https://github.com/cli/cli)
* [ghq](https://github.com/motemen/ghq)
* [git-delta](https://github.com/dandavison/delta)
* [mise](https://github.com/jdx/mise)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [tig](https://github.com/jonas/tig)
* [tmux](https://github.com/tmux/tmux)
* [vim-plug](https://github.com/junegunn/vim-plug)

### tmux
After the initial run, do `Ctrl+B -> Shift+I` to install all plugins.

### Vim
Run `PlugInstall` to install all plugins.

### mise
You can install commonly used tools easily such as:

- `mise install node`
- `mise install postgres`
- `mise install awscli`
- `mise install granted`
  - See [AWS Switch Roles](https://github.com/necojackarc/til/blob/master/aws/switch-roles.md)

You can check the installed versions with `mise ls`.

## AI agent instructions

Canonical file: `~/dotfiles/ai/AGENTS.md`.

`setup.sh` copies it to `~/.claude/CLAUDE.md`. Re-run `setup.sh` after you edit `AGENTS.md`.

Cursor User Rules are manual. Paste this into Cursor → Settings / Customize → Rules → User Rules:

```
Read and follow ~/dotfiles/ai/AGENTS.md on every task.
```

Do not paste the file. `@AGENTS.md` would hit the current project, not this one.

## Tips

### Set computer-specific environment variables

When you'd like to set environment variables that you don't like to commit to the repo but want to set as regular environment variables applied to the logged-in user, you can use a `~/.env` file.
`~/.env` is loaded in .profile, so place `.env` in your home directory.

### Set computer-specific Git config

`gitconfig` includes `~/.gitconfig.local` at the end, so put Git settings you don't want to commit there, such as your GPG key or a work account.
Git skips the file if it doesn't exist.
Values in it override `gitconfig` because it is included last.

For example, to use a different identity and SSH host for the repositories of an organization:

```ini
[includeIf "gitdir:~/work/ghq/github.com/<ORG_NAME>/"]
	path = ~/.gitconfig-<ORG_NAME>

[url "git@github-<ORG_NAME>:<ORG_NAME>/"]
	insteadOf = git@github.com:<ORG_NAME>/
	insteadOf = https://github.com/<ORG_NAME>/
```

Commits are always signed, so set the work `user.signingkey` in `~/.gitconfig-<ORG_NAME>` as well as `user.name` and `user.email`.
Keep `includeIf` below your other settings in `~/.gitconfig.local`, such as your personal `user.signingkey`. Git uses the last value it reads, so a setting placed after `includeIf` overrides the work one.
See [Multiple GitHub Accounts](https://github.com/necojackarc/til/blob/master/git/multiple-github-accounts.md) for the SSH config.

### Set directory-specific environment variables

`direnv` allows you to set directory-specific variables by placing `.envrc` in the target directory. That file is loaded and unloaded when you get into and get out of that directory.

### Show `***DANGER***` in the prompt message

Set `export IS_DANGER=true` in an `.envrc` where you'd like to display `***DANGER***`.

### Docker Compose
In some environments, they still refer to the old command `docker-compose`. To cope with that, I'd recommend adding the following executable instead of adding an alias:

```bash
#!/bin/bash
docker compose "$@"
```

Then run `chmod +x /usr/local/bin/docker-compose`.
