local on_attach = require("gale.utils").on_attach

return {
  "pmizio/typescript-tools.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "javascript", "typescript", "typescriptreact" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    on_attach = on_attach,
    settings = {
      tsserver_file_preferences = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
      jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}
