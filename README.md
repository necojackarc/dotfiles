## About

These are my `dotfiles`:

* `.vimrc`
* `.gvimrc`
* `.ideavimrc`
* `.bash_profile`
* `.inputrc`
* `.tumx.conf`
* `.pryrc`
* `.eslint`

## Installation

First you need to `clone` the repository:

```sh
$ git clone --recursive https://github.com/necojackarc/dotfiles ~/dotfiles
```

If you don't want to overwrite your `dotfiles`, you need to modify the `makeDotfileLinks.sh` which creates symbolic links like `.*` at your home directory.

When you are ready, execute the following commands:

```sh
$ chmod +x ~/dotfiles/makeDotfileLinks.sh
$ ~/dotfiles/makeDotfileLinks.sh
```

### Syntastic
My `.vimrc` includes some settings of `scrooloose/syntastic`.
They require some external libraries and you can install them like this:

```sh
$ gem install rubocop
$ npm install -g eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint
```
