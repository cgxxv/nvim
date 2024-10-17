-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = require("configs.mason-lsp").servers
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
    local opt = {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
    if lsp == "emmet_ls" then
        opt["filetypes"] = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" }
    end
    lspconfig[lsp].setup(opt)
end
