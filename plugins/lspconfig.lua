local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  -- web dev
  "html",
  "cssls",
  "tsserver",
  "tailwindcss",
  "svelte",

  -- backend dev
  "clangd",
  "gopls",
  "pyright",
  "rust_analyzer",
  "phpactor",

  -- others
  "sqlls",
  "cmake",
  "dockerls",
  "awk_ls",
  "yamlls", -- for yaml files
  "taplo", -- for toml files
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
