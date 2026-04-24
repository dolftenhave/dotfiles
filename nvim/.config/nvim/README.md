# Config guide

All plugins are located in [lua/plugins/](lua/plugins/). With the exception of lazy which is in [init.lua](init.lua).

- [Instillation](#insillation)
- [External Dependendies](#external-dependencies)
- [Filetype/language support](#filetype\/language-support)
- [Plugins](#plugins)
- [TODO](#todo)

## Instillation

> [!NOTE]
> This is only compatable with nvim-0.12+ due to dependency on [vim.pack](https://neovim.io/doc/user/pack/#_plugin-manager).

## ⚡️External dependencies

- `git`, C compiler (`gcc`)
- `Node` & `yarn`
- `fzf`
- `luarocks`
- <details> <summary>tree-sitter-cli</summary>
        [Github source](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file)
        ## Dependendies
            - clang (for rust to compile)
            - rustc & cargo
  </details>

- A nerd font

## Filetype/language support


| Lang       | TS  | LSP | Name | Compiler | Name |
| :--------- | :-: | :-: | :--- | :------: | :--- |
| bash       | [x] | [x] | bashls |   [x]    | Name |
| C          | [x] | [x] | clangd |   [x]    | Name |
| Cpp        | [x] | [x] | clangd |   [x]    | Name |
| css        | [x] | [.] |  |   [ ]    | Name |
| csv        | [x] | [ ] | Name |    -     | Name |
| golang     | [x] | [x] | gopls |   [x]    | Name |
| html       | [x] | [ ] |  |    -     | Name |
| java       | [x] | [ ] | Name |   [ ]    | Name |
| json       | [x] | [x] | Name |    -     | Name |
| latex      | [x] | [ ] | Name |    -     | Name |
| lau        | [x] | [x] | Name |   [x]    | Name |
| makefile   | [x] | [ ] | Name |   [x]    | Name |
| md         | [x] | [x] | Name |    -     | Name |
| nix        | [x] | [ ] | Name |   [ ]    | Name |
| nz english | [ ] | [ ] | Name |    -     | Name |
| python     | [x] | [x] | Name |   [x]    | Name |
| qml        | [x] | [x] | Name |   [ ]    | Name |
| rust       | [x] | [x] | Name |   [x]    | Name |
| sql        | [x] | [x] | Name |   [x]    | Name |
| vim        | [x] | [ ] | Name |    -     | Name |
| vimdoc     | [x] | [x] | vimdocls |    -     | Name |
| yaml       | [x] | [x] | Name |    -     | Name |

**Yes:** [x] **No:** [ ] **NA:** -

## Plugins

| Name | Use | Location |
| :-- | :-- | :-- |
| [blink.cmp](https://github.com/saghen/blink.cmp) | An auto completion plugin. | [plugin/blink.lua](plugin/blink.lua) |
| [gruvbox](https://github.com/goolord/alpha-nvim) | Theme | [plugin/gruvbox.nvim](plugin/gruvbox.nvim) |
| [indent-blankline.lua](https://github.com/lukas-reineke/indent-blankline.nvim) | Shows method indents to make it clearer to see where you are in the code | [plugin/indent-blankline.lua](plugin/indent-blankline.lua) | 
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Shows a representation of rendered markdown | [plugin/markview.lua](plugin/markview.lua) |
| [telescope.lua](https://github.com/nvim-telescope/telescope.nvim) | fuzzy finder for many different things | [plugin/telescope.lua](plugin/telescope.lua) |
| [treesitter.lua](https://github.com/nvim-treesitter/nvim-treesitter) | Creates a parse tree for text objects | [plugin/treesitter.lua](plugin/treesitter.lua) |

## TODO
- [ ] Auto install script for compilers and language servers.
