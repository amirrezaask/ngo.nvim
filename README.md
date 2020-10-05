# ngo.nvim
Neovim Go IDE plugin

## Installation
go.nvim uses neovim builtin lsp for auto completion and showing errors and warning. Since builting lsp is not stable yet you need to build neovim from master.

### Using vim-plug
```vim
" For auto completion
Plug 'nvim-lua/completion-nvim'

Plug 'amirrezaask/go.nvim'

```
### Using Packer.nvim
```lua
-- For Autocomplete
use { 'nvim-lua/completion-nvim' }

use { 'amirrezaask/go.nvim' }

require'go'
```
## Commands
- GoRun
- GoTestAll
- GoImport
- GoFmt
- GoInstall



# TODO
- Jump to test file
- better text object support (maybe with treesitter)
- Implement an interface
