return function()
    vim.cmd [[command! GoInstall lua require'ngo.base'.utils.install()]]
    vim.cmd [[command! GoRun lua require'ngo.base'.utils.run()]]
    vim.cmd [[command! GoTestAll lua require'ngo.base'.utils.test_all()]]
    vim.cmd [[command! GoImport lua require'ngo.base'.utils.imports()]]
    vim.cmd [[command! GoFmt lua require'ngo.base'.utils.fmt()]]
    vim.cmd [[command! GoTDD lua require'ngo.base'.utils.test_tdd()]]
end
