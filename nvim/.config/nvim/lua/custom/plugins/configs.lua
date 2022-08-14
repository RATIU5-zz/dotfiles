local M = {}

M.treesitter = {
    ensure_installed = {
      "html",
      "css",
      "javascript",
      "bash",
      "json",
      "lua",
      "markdown",
      "make",
      "php",
      "python",
      "regex",
      "rust",
      "sql",
      "svelte",
      "tsx",
      "typescript",
      "zig",
    }
  }


  M.cmp = function()
    local cmp = require "cmp"

    return {
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-8),
      }
    }
  end

  return M
