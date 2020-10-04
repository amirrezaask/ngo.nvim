# go.nvim
Neovim Go IDE plugin

## Installation
### Using vim-plug
```vim
" go.nvim assumes you have nvim-lsp ( Neovim master build )
" For auto completion
Plug 'nvim-lua/completion-nvim'

Plug 'amirrezaask/go.nvim'

```
### Using Packer.nvim
```lua
use { 'amirrezaask/go.nvim' }

require'go'
```
## Commands
- GoRun
- GoTestAll
- GoImport
- GoFmt
- GoInstall



#TODO
- Jump to test file
- better text object support (maybe with treesitter)

