vim.g.mapleader = ","
vim.api.nvim_set_option('titlestring', "%{hostname()}  %F  %{strftime('%Y-%m-%d %H:%M',getftime(expand('%')))}")
vim.api.nvim_set_option('shell', "/opt/local/bin/fish")

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
