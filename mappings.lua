local M = {}

M.general = {
  i = {
    ["jk"] = {"<ESC>", "exit insert mode"},
  },
  n = {
    ["<leader>nh"] = {":nohl<CR>", "clear search highlights"},
    ["x"] = {'"_x', "delete single character without copying into register"},
    ["<leader>sv"] = {"<C-w>v", "split window vertically"},
    ["<leader>sh"] = {"<C-w>s", "split window horizontally"},
    ["<leader>se"] = {"<C-w>=", "make split windows equal width & height" },
    ["<leader>sx"] = {":close<CR>", "close current split window"},
    [";"] = {":", "command mode", opts = { nowait = true } },

    -- plugin keybinds
    ["<leader>sm"] = {":MaximizerToggle<CR>", "toggle split window maximization"},
  },
}

-- more keybinds!

M.lspconfig = {
  n = {
    ["gf"] = {"<cmd>Lspsaga lsp_finder<CR>", "show definition, references"},
    ["gd"] = {"<cmd>Lspsaga peek_definition<CR>", "see definition and make edits in window"},
    ["<leader>rn"] = {"<cmd>Lspsaga rename<CR>", "smart rename"},
    ["<leader>d"] = {"<cmd>Lspsaga show_cursor_diagnostics<CR>", "show diagnostics for cursor"},
    ["gr"] = {},
    ["<leader>gr"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "lsp references"},
    -- the below will override the default keybind
    ["<leader>D"] = {"<cmd>Lspsaga show_line_diagnostics<CR>", "show diagnostics for line"},
    ["[d"] = {"<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to previous diagnostics in buffer"},
    ["]d"] = {"<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics in buffer"},
    ["K"] = {"<cmd>Lspsaga hover_doc<CR>", "show documentation for what is under cursor"},
    ["<leader>o"] = {"<cmd>LSoutlineToggle<CR>", "see outline on right hand side"},

    -- typescript specific keymaps (e.g. rename file and update imports)
    ["<leader>rf"] = {":TypescriptRenameFile<CR>", "rename file and update imports"},
    ["<leader>oi"] = {":TypescriptOrganizeImports<CR>", "orgnize imports"},
    ["<leader>ru"] = {":TypescriptRemoveUnused<CR>", "remove unused variables"},
  },
}

return M
