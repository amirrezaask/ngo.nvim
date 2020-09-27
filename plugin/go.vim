command! GoInstall lua require'go'.go_install()
command! GoRun lua require'go'.go_run()
if exists("g:go_on_save_hooks")
    lua require'go'.enable_go_fmt_import_on_save()
endif
