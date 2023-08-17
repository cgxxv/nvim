local M = {}

local opts = { noremap = true, silent = true, expr = false }

M.general = {
  i = {
    -- use batter-escape instead
    -- ["jk"] = { "<ESC>", "exit insert mode" },
  },
  n = {
    ["<leader>nh"] = { ":nohl<CR>", "clear search highlights" },
    ["x"] = { '"_x', "delete single character without copying into register" },
    ["<leader>sv"] = { "<C-w>v", "split window vertically" },
    ["<leader>sh"] = { "<C-w>s", "split window horizontally" },
    ["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
    ["<leader>sx"] = { ":close<CR>", "close current split window" },
    [";"] = { ":", "command mode", opts = { nowait = true } },

    -- plugin keybinds
    ["<leader>sm"] = { ":MaximizerToggle<CR>", "toggle split window maximization" },

    ["<leader>rb"] = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>" },
    ["<leader>rbf"] = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>" },
    ["<leader>ri"] = { "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>" },
    ["<leader>rp"] = { ":lua require('refactoring').debug.printf({below = false})<CR>" },
    ["<leader>rpv"] = { ":lua require('refactoring').debug.print_var({ normal = true })<CR>" },
    ["<leader>rc"] = { ":lua require('refactoring').debug.cleanup({})<CR>" },

    ["<leader>3n"] = { "<Cmd>NnnPicker<CR>" },
    ["<leader>3ne"] = { "<Cmd>NnnExplorer %:p:h<CR>" },
    ["<leader>2f"] = { "<Cmd>Lf<CR>" },

    ["<leader>aa"] = { "<Cmd>Lspsaga code_action<CR>" },
    ["<leader>af"] = { "<Cmd>Lspsaga finder<CR>" },
    ["<leader>afi"] = { "<Cmd>Lspsaga finder imp<CR>" },
    ["<leader>at"] = { "<Cmd>Lspsaga term_toggle<CR>" },
    ["<leader>an"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
    ["<leader>ap"] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
    ["<leader>ao"] = { "<Cmd>Lspsaga outline<CR>" },
  },

  v = {
    ["<leader>re"] = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "" },
    ["<leader>rf"] = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "" },
    ["<leader>rv"] = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>" },
    ["<leader>ri"] = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>" },
    ["<leader>rr"] = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>" },
    ["<leader>rpv"] = { ":lua require('refactoring').debug.print_var({})<CR>" },
  },
}

-- more keybinds!

M.lspconfig = {
  n = {
    ["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", "show definition, references" },
    ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "see definition and make edits in window" },
    ["<leader>rn"] = { "<cmd>Lspsaga rename<CR>", "smart rename" },
    ["<leader>d"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show diagnostics for cursor" },
    -- ["gr"] = {},
    ["<leader>gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "lsp references" },
    -- the below will override the default keybind
    ["<leader>D"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show diagnostics for line" },
    ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to previous diagnostics in buffer" },
    ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics in buffer" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "show documentation for what is under cursor" },
    ["<leader>o"] = { "<cmd>LSoutlineToggle<CR>", "see outline on right hand side" },
  },
}

return M
