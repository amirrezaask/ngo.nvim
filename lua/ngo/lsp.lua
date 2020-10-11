local nvim_lsp = require('nvim_lsp')

return function()
    nvim_lsp.gopls.setup{on_attach = require'completion'.on_attach}
end
