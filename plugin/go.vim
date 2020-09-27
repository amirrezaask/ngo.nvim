if exists("g:go_on_save_hooks")
    lua require'go'.go_fmt_import_on_save()
endif
