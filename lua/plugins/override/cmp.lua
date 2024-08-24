return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { { "hrsh7th/cmp-cmdline" }, "hrsh7th/cmp-nvim-lsp" },
  opts = {
    mapping = {
      ["<Tab>"] = vim.NIL,
      ["<S-Tab>"] = vim.NIL,
      ["<C-k>"] = require("cmp").mapping(function(fallback)
        if vim.lsp.buf.signature_help then
          vim.lsp.buf.signature_help()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    },
  },
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })

    cmp.setup(opts)
  end,
}
