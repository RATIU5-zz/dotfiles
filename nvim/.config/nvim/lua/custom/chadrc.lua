-- This file overrides core/default_config.lua
-- Just an example, supposed to be placed in /lua/custom/

local pluginConfs = require "custom.plugins.configs"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
  clipboard = "unnamesplus",
  numberwidth = 2,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  relativenumber = false,
  cursorline = true,
}

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme = "gruvchad",
  transparency = false,
  italic_comments = true,
}


M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
  },
  remove = {},
  user = {
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
  },
}

M.mappings = require "custom.mappings"

return M
