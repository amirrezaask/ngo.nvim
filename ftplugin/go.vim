lua require'go'

" Register Commands
command! GoInstall lua require'go'.utils.install()
command! GoRun lua require'go'.utils.run()
command! GoTestAll lua require'go'.utils.test_all()
command! GoImport lua require'go'.utils.imports()
command! GoFmt lua require'go'.utils.fmt()
command! GoTDD lua require'go'.utils.test_tdd()
if !exists("g:go_disable_save_hooks")
    autocmd BufWritePost *.go lua require'go'.utils.imports()
    autocmd BufWritePost *.go lua require'go'.utils.fmt()
endif
