# Config guide

All plugins are located in [lua/plugins/](lua/plugins/). With the exception of lazy which is in [init.lua](init.lua).

## Instillation

## ⚡️External dependencies

- `git`, C compiler (`gcc`)
- `Node` & `yarn`
- `fzf`
- `luarocks`
- A nerd font

## Supported languages

- lua
- java
- c++
- c

## Plugins

- [alpha-nvim](###alpha-nvim)
- [gruvbox.nvim](###gruvbox.nvim)

### alpha-nvim

The greeting screen you load into when opening nvim without a file.

**Location:** `alpha-nvim.lua`

> [alpha-nvim](https://github.com/goolord/alpha-nvim)

## gruvbox

The nvim colourcheme.

**Location:** `colourcheme.lua`

> [gruvbox.nvim](https://github.com/goolord/alpha-nvim)

### Lazy

This is the plugin manager.

#### Commands

- `:Lazy` Opens the lazy menu.

### Mason

This handles the lsp, linting client ect.

(https://github.com/mason-org/mason.nvim)[https://github.com/mason-org/mason.nvim]

#### Commands

- `:Mason` will brin lp the menu.

### neo-tree

(https://github.com/nvim-neo-tree/neo-tree.nvim)[https://github.com/nvim-neo-tree/neo-tree.nvim].

- `C-n` brings up the file menu.
- `a` add. Creates a new file.
- `r` rename. Renames a file.

### conform

Files are automatically formatted on save.
(https://github.com/stevearc/conform.nvim)[https://github.com/stevearc/conform.nvim]

- `<leader>ll` calls the formatter.

### nvim-lint
