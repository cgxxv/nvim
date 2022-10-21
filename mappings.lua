local M = {}

      -- vim.keymap.set("n", "<Leader>2f", ":Lf<CR>")
M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    -- ["<Leader>2f"] = { "<cmd>lua require('lf').start()<CR>", "lf file manager", opts = { nowait = true, noremap = true } },
  },
}

-- more keybinds!

return M
