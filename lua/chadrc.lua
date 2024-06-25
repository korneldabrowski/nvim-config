-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/nvchad_types/chadrc.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = "monekai",
  theme_toggle = { "monekai", "chadracula-evondev" },

  statusline = {
    theme = "vscode_colored",
    order = {
      "mode",
      "tint",
      "separator",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "separator",
      "cwd",
    },
    modules = {
      separator = function()
        return " "
      end,
      -- Force grey on modules that absorb neighbour colour
      -- (because they don't have a highlight set)
      tint = function()
        return "%#StText#"
      end,
      hack = function()
        return "%#@comment#%"
      end,
    },
  },

  telescope = { style = "bordered" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = { bg = "#202025" },
    LspInlayHint = { fg = "#4e5665", bg = "NONE" },
    FloatBorder = { link = "TelescopeBorder" },
    NvimTreeRootFolder = { link = "TelescopeBorder" },
  },

  hl_add = {
    YankVisual = { link = "CursorColumn" },
    LspInfoBorder = { fg = "#444c5b" },
    WinBar = { bg = "NONE" },
    WinBarNC = { bg = "NONE" },
    DropBarMenuCurrentContext = { link = "Visual" },
  },

  term = {
    float = {
      border = "rounded",
    },
  },

  tabufline = {
    modules = {
      fill = function()
        return "%#TbFill#%="
      end,
    },
    order = { "buffers", "tabs", "btns" },
  },

  lsp = {
    signature = true,
    semantic_tokens = true,
  },
}

return M
