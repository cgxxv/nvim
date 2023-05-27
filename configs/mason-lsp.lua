local M = {}

M.servers = {
  -- already installed by nvchad
  -- "lua_ls",

  -- web dev stuff
  "cssls",
  "html",
  -- "tsserver",
  "emmet_ls",
  "jsonls",
  -- "jqls",
  "svelte",
  "tailwindcss",

  "yamlls",
  "pyright",
  "gopls",
  "rust_analyzer",
  "clangd",
  "cmake",
  "phpactor",

  "sqlls",
  "awk_ls",

  "dockerls",
  "docker_compose_language_service",
}

M.setup = function()
  local present, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not present then
    return
  end
  mason_lspconfig.setup {
    -- list of servers for mason to install
    ensure_installed = M.servers,
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  }
end

return M
