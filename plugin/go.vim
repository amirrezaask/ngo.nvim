command! GoInstall lua require'go'.go_install()
command! GoRun lua require'go'.go_run()
command! GoTestAll lua require'go'.go_test_all()
command! GoImport lua require'go'.go_import()
command! GoFmt lua require'go'.go_fmt()
if exists("g:go_on_save_hooks")
    lua require'go'.enable_go_fmt_import_on_save()
endif
