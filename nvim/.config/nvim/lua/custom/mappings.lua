local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape to normal mode" },
  },

  n = {
    -- Move text up and down    
    ["<A-j>"] = { "<ESC>:m .+1<CR>==gi", "move line down" },
    ["<A-k>"] = { "<ESC>:m .-2<CR>==gi", "move line up" },
  },

  v = {
    -- Move text up and down    
    ["<A-j>"] = { ":m .+1<CR>==", "move selection down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move selection up" },
  },
}

return M
