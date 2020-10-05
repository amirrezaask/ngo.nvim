local base = require('ngo.base')


local function default_formatter()
    if vim.api.executable("goimports") then
        return "goimports"
    else 
        return "gofmt"
    end
end

return function()
    -- check for option variables
    local disable_formatter = vim.g.go_disable_formatter
    local formatter = vim.g.go_formatter

    if disable_formatter ~= nil then
     return 
    end

    if formatter == "" or formatter == nil then
      formatter = default_formatter()
    end
    local callback = {}

    -- Create callback string
    if formatter == "gofmt" then
        callback =  "utils.fmt"
    elseif formatter == "goimports" then
     callback = "utils.imports"
    else
      callback = nil
    end

    if callback == nil then
      print(string.format("Error no formatter matched %s", formatter))
      return
    end
    local cmd = string.format("lua require'ngo.base'.%s()", callback)
    vim.api.nvim_command(
        string.format(
          [[autocmd BufWritePost *.go %s]],
          cmd))
end
