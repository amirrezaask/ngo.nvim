local nvim = vim.api
local go_fmt_command = 'go fmt'
local go_get_command = 'go get'
local go_install_command = 'go install'
local go = {}

local function go_run(file)
    return function()
        nvim.nvim_command(string.format('!go run %s', file))
    end
end

go['go_fmt'] = function (pkg)
    nvim.nvim_command(string.format('silent ! %s %s', go_fmt_command, pkg))
    nvim.nvim_command('e')
end

go['go_run'] =  go_run("*.go")

go['go_import'] = function(file)
    nvim.nvim_command(string.format('silent ! goimports -w %s', file))
    nvim.nvim_command('e')
end

go['go_get'] = function (pkg)
    nvim.nvim_command(string.format('silent ! %s %s', go_get_command, pkg))
end

go['enable_go_fmt_import_on_save'] = function ()
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_import("%")')
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_fmt(".")')
end


go['go_install'] = function()
    nvim.nvim_command(string.format('silent ! %s .', go_install_command))
end
return go

