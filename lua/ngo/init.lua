local base = require('ngo.base')
local lsp = require('ngo.lsp')
local register_commands = require('ngo.cmds')
local autocommands = require('ngo.autocommands')

-- Setup LSP
lsp()

-- Register exec commands
register_commands()

-- AutoCommands
autocommands()

