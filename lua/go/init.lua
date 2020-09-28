local nvim = vim.api
local go_fmt_command = 'go fmt'
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
local function go_install(pkg)
    return function()
        nvim.nvim_command(string.format('silent ! %s %s', go_install_command, pkg))
    end
end
local function enable_save_hooks()
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_import_this_file()')
    nvim.nvim_command('autocmd BufWritePost *.go lua require\'go\'.go_fmt_this_pkg()')
end

go['go_fmt_this_pkg'] = go_fmt('.')
go['go_test_all'] = go_test('./...')
go['go_run'] =  go_run("*.go")
go['go_import_this_file'] = go_import('%')
go['go_install'] = go_install('.')
go['enable_go_fmt_import_on_save'] = enable_save_hooks

-- Define Ex commands
nvim.nvim_command [[command! GoInstall lua require'go'.go_install()]]
nvim.nvim_command[[command! GoRun lua require'go'.go_run()]]
nvim.nvim_command[[command! GoTestAll lua require'go'.go_test_all()]]
nvim.nvim_command[[command! GoImport lua require'go'.go_import()]]
nvim.nvim_command[[command! GoFmt lua require'go'.go_fmt()]]


-- Enable Go save hooks
if nvim.nvim_get_var('go_on_save_hooks') then go['enable_go_fmt_import_on_save']() end

return go

