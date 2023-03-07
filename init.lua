vim.g.mapleader = ","
-- vim.opt.laststatus = 2
vim.api.nvim_set_option("titlestring", "%{hostname()}  %F  %{strftime('%Y-%m-%d %H:%M',getftime(expand('%')))}")
-- vim.api.nvim_set_option("statusline", "+%F")
vim.api.nvim_set_option("shell", "/opt/local/bin/fish")

vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

vim.opt.clipboard:append "unnamedplus" -- use system clipboard as default register
vim.opt.iskeyword:append "-" -- consider string-string as whole word
