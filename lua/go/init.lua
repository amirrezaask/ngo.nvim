local nvim = vim.api
local go_fmt_command = 'go fmt'
local go_get_command = 'go get'
local go = {}

go['go_fmt'] = function (pkg)
    nvim.nvim_command(string.format('silent ! %s %s', go_fmt_command, pkg))
    nvim.nvim_command('e')
end

go['go_import'] = function(file)
    nvim.nvim_command(string.format('silent ! goimports -w %s', file))
end
go['go_get'] = function (pkg)
    nvim.nvim_command(string.format('silent ! %s %s', go_get_command, pkg))
end

go['go_fmt_import_on_save'] = function ()
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_import("%")')
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_fmt(".")')
end

return go

