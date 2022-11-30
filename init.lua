vim.g.mapleader = ","
-- vim.opt.laststatus = 2
vim.api.nvim_set_option("titlestring", "%F")
-- vim.api.nvim_set_option("statusline", "+%F")
vim.api.nvim_set_option("shell", "/opt/local/bin/fish")

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
