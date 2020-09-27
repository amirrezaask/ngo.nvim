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

local function go_import(file)
    return function()
        nvim.nvim_command(string.format('silent ! goimports -w %s', file))
        nvim.nvim_command('e')
    end
end

local function go_test(path)
    return function()
        nvim.nvim_command(string.format('!go test %s', path))
    end
end
local function go_fmt(pkg)
    return function()
        nvim.nvim_command(string.format('silent ! %s %s', go_fmt_command, pkg))
        nvim.nvim_command('e')
    end
end

go['go_fmt_this_pkg'] = go_fmt('.')
go['go_test_all'] = go_test('./...')
go['go_run'] =  go_run("*.go")
go['go_import_this_file'] = go_import('%')
go['go_get'] = function (pkg)
    nvim.nvim_command(string.format('silent ! %s %s', go_get_command, pkg))
end

go['enable_go_fmt_import_on_save'] = function ()
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_import_this_file()')
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_fmt_this_pkg()')
end


go['go_install'] = function()
    nvim.nvim_command(string.format('silent ! %s .', go_install_command))
end
return go

