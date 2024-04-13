local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = require("configs.mason-lsp").servers

for _, lsp in ipairs(servers) do
  local opt = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
  if lsp == "emmet_ls" then
    opt["filetypes"] = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" }
  end
  lspconfig[lsp].setup(opt)
end
