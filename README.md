# CSearch

This plugin integrates vim with the [codesearch](https://github.com/google/codesearch) tools.
If you already use [Grepper plugin](https://github.com/mhinz/vim-grepper), consider configuring it instead of using this plugin.

# Installation

## Native package manager (Vim)
```
$ mkdir -p ~/.vim/pack/bundle/start
$ git clone https://github.com/roman-kashitsyn/vim-csearch ~/.vim/pack/bundle/start/vim-csearch
```

## Native package manager (NeoVim)
```
$ mkdir -p ~/.local/share/nvim/site/pack/bundle/start
$ git clone https://github.com/roman-kashitsyn/vim-csearch ~/.local/share/nvim/site/pack/bundle/start/vim-csearch
```

## Pathogen
```
$ git clone https://github.com/roman-kashitsyn/vim-csearch ~/.vim/bundle/vim-csearch
```

## Vundle
```
Plugin 'roman-kashitsyn/vim-csearch'
```

## NeoBundle
```
NeoBundle 'roman-kashitsyn/vim-csearch'
```

# Usage

Generate a search index by calling `cindex` directly or issuing a Vim command provided by this plugin:

```
:Cindex [{paths}]
```

After indexing is complete, you can populate your quickfix list with search results produced by `csearch` by executing

```
:Csearch {regexp} [{fileregexp}]
```

If your regexp contains a space, you need to escape it, e.g., `:Csearch message\ MyProto`.

If you want to use location list instead of the quickfix, execute

```
:Lcsearch {regexp} [{fileregexp}]
```

# Codesearch tricks

* [direnv](https://direnv.net/) can help you manage and scope your search index.
  Add `export CSEARCHINDEX=$PWD/.csearchindex` to the `.envrc` file at the root of your project.
  This way `cindex` will use your local `$CSEARCHINDEX` file to store the index (instead of the default `$HOME/.csearchindex`), and results of `csearch` will be scoped to your project.

* `Cindex` support partial index updates.
  Execute `:Cindex %` to update the search index for the current file.

# Known issues

* [rust.vim](https://github.com/rust-lang/rust.vim) also defines command `Csearch`, which will be overriden by this plugin.

# License

Copyright © Roman Kashitsyn. Distributed under the same terms as Vim itself. See `:help license`.
