# nvim-go
Neovim Go IDE plugin

## Installation
### Using vim-plug
```vim
Plug 'amirrezaask/go.nvim'
" Enable Goimports and Go fmt on save for Go files
let g:go_on_save_hooks = 1
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


