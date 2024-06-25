return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local on_attach = require("gale.utils").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local servers = {
      "astro",
      "bashls",
      "clangd",
      "css_variables",
      "cssls",
      "html",
      "gopls",
      "jsonls",
      "marksman",
      "tailwindcss",
      "pyright",
      "taplo",
      "templ",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    lspconfig.ruff_lsp.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Disable hover in favour of Pyright
        client.server_capabilities.hoverProvider = true
      end,
      on_init = on_init,
      capabilities = capabilities,
    }

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      on_init = on_init,
      settings = {
        Lua = {
          hint = { enable = true },
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
          workspace = {
            library = {
              ["${3rd}/luv/library"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }

    local border = "rounded"
    -- :LspInfo
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = border }
    -- vim.diagnostic.open_float()
    vim.diagnostic.config { virtual_text = true, float = { border = border } }
  end,
}
