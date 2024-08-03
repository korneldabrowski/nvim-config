-- ~/.config/nvim/lua/gale/custom_functions.lua
local M = {}

M.go_to_definition = function()
  if vim.bo.filetype == "go" then
    vim.lsp.buf.definition {
      on_list = function(options)
        if options == nil or options.items == nil or #options.items == 0 then
          return
        end

        local targetFile = options.items[1].filename
        local prefix = string.match(targetFile, "(.-)_templ%.go$")

        if prefix then
          options.items[1].filename = prefix .. ".templ"
        end

        vim.fn.setqflist({}, " ", options)
        vim.api.nvim_command "cfirst"
      end,
    }
  else
    vim.lsp.buf.definition()
  end
end
M.copilot = {
  i = {
    ["<C-CR>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}
return M
