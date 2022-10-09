local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  -- web dev
  "html",
  "cssls",
  "tsserver",

  -- backend dev
  "clangd",
  "gopls",
  "pyright",
  "rust_analyzer",
  "phpactor",

  "sqlls",
  "cmake",
  "dockerls",
  "awk_ls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
