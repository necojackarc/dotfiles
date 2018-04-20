This repository has my dotfiles.

## Requirements
### Linux
* gcc (vimproc)
* make (vimproc)
* xsel (tmux-yank)

### macOS
* reattach-to-user-namespace (tmux-yank)

### Windows
* None

## Installation
First, clone the repository:

```sh
$ git clone --recursive git@github.com:necojackarc/dotfiles.git ~/dotfiles
```

If you don't want to overwrite dotfiles on your home directory, modify `setup.sh`.

When you are ready, execute the following commands:

```sh
$ chmod +x ~/dotfiles/setup.sh
$ ~/dotfiles/setup.sh
```

If you are on Windwos, run `setup.cmd` instead with administrator privilege:

```cmd
> setup.cmd
```

Note: On Windows, not all dotfiles will be deployed. See `setup.cmd` for details.

### tmux
After initial run of tmux, do `Ctrl+T -> Shift+I` to install all plugins.


### Syntastic
My `.vimrc` includes settings of `scrooloose/syntastic`.
They require some external libraries and you can install them like this:

```sh
$ gem install rubocop
$ npm install -g eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint
```
