require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use "p00f/nvim-ts-rainbow"
    use {
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    use 'morhetz/gruvbox'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                key_labels = {
                    -- override the label used to display some keys. It doesn't effect WK in any other way.
                    -- For example:
                    ["<space>"] = "SPC",
                    ["<cr>"] = "RET",
                    ["<tab>"] = "TAB",
                    ["<bs>"] = "BKSP",
                    ["<esc>"] = "ESC"
                },
                popup_mappings = {
                    scroll_down = '<c-j>', -- binding to scroll down inside the popup
                    scroll_up = '<c-k>' -- binding to scroll up inside the popup
                }
            }
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'windwp/nvim-autopairs'
    use {
        'phaazon/hop.nvim',
        branch = 'v2' -- optional but strongly recommended
    }
    use 'tpope/vim-fugitive'
    use 'christoomey/vim-tmux-navigator'
end)

local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then vim.notify("colorscheme " .. colorscheme .. " not found") end

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "astro", "bash", "css", "html", "javascript", "json", "lua", "markdown",
        "php", "python", "rust", "sql", "svelte", "tsx", "typescript"
    },
    highlight = {enable = true},
    indent = {enable = true},
    rainbow = {enable = true}
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "astro", "bashls", "cssls", "denols", "eslint", "html", "jsonls",
        "tsserver", "marksman", "intelephense", "pyright", "rust_analyzer",
        "sqls", "svelte", "tailwindcss", "sumneko_lua", "rust_analyzer"
    }
})

local wk_opts = {mode = "n", prefix = "<leader>"}
local wk_mappings = {
    ["f"] = {
        name = "File",
        f = {"<cmd>Telescope find_files<cr>", "Find file"},
        g = {"<cmd>Telescope live_grep<cr>", "Search in files"},
        b = {"<cmd>Telescope buffers<cr>", "Find buffer"},
        e = {"<cmd>enew<cr>", "Create/Edit file"},
        s = {"<cmd>update!<cr>", "Save file"},
        c = {"<cmd>Bdelete<cr>", "Close file"},
        C = {"<cmd>Bdelete!<cr>", "Close file (force)"}
    },
    ["e"] = {"<cmd>NvimTreeToggle<cr>", "File tree"},
    ["w"] = {"<cmd>w!<cr>", "Save"},
    ["q"] = {"<cmd>q!<cr>", "Quit"},
    p = {
        name = "Packer",
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        S = {"<cmd>PackerStatus<cr>", "Status"},
        u = {"<cmd>PackerUpdate<cr>", "Update"}
    },
    g = {
        name = "Git",
        g = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"},
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        d = {"<cmd>Gitsigns diffthis HEAD<cr>", "Diff"}
    },
    l = {
        name = "LSP",
        a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        I = {"<cmd>LspInstallInfo<cr>", "Installer Info"},
        j = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic"},
        k = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic"},
        l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action"},
        q = {"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        }
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
        C = {"<cmd>Telescope commands<cr>", "Commands"}
    },
    t = {
        name = "Terminal",
        n = {"<cmd>lua _NODE_TOGGLE()<cr>", "Node"},
        u = {"<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU"},
        t = {"<cmd>lua _HTOP_TOGGLE()<cr>", "Htop"},
        p = {"<cmd>lua _PYTHON_TOGGLE()<cr>", "Python"},
        f = {"<cmd>ToggleTerm direction=float<cr>", "Float"},
        h = {"<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal"},
        v = {"<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical"}
    }
}

local wk = require("which-key")
wk.register(wk_mappings, wk_opts)

require("nvim-tree").setup()

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {statusline = {}, winbar = {}},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

vim.g.mapleader = " " -- space is the leader key (shows whichkey menu)

local options = {
    backup = false, -- do not create a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- neovim command line height for displaying messages
    completeopt = {"menuone", "noselect"}, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    -- mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    -- termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 8, -- offset padding to prevent the cursor from getting too close to the edges
    sidescrolloff = 8,
    guifont = "monospace:h17" -- the font used in graphical neovim applications
}

vim.wo.fillchars = 'eob: ' -- don't show ~ on blank lines

vim.opt.shortmess:append "c"

for k, v in pairs(options) do vim.opt[k] = v end

require('nvim-autopairs').setup()

require'hop'.setup({quit_key = "<esc>"})
vim.api.nvim_set_keymap('', 'f',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                        {})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
        {name = "path"}
    },
    confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false},
    window = {
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
        }
    },
    experimental = {ghost_text = false, native_menu = false}
}
