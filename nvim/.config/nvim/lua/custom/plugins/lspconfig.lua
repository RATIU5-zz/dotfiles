local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "eslint",
  "intelephense",
  "jsonls",
  "marksman",
  "pyre",
  "rust_analyzer",
  "sqls",
  "svelte",
  "tailwindcss",
  "tsserver",
  "denols",
  "bashls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
