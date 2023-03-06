vim.g.mapleader = ","
-- vim.opt.laststatus = 2
vim.api.nvim_set_option("titlestring", "%{hostname()}  %F  %{strftime('%Y-%m-%d %H:%M',getftime(expand('%')))}")
-- vim.api.nvim_set_option("statusline", "+%F")
vim.api.nvim_set_option("shell", "/opt/local/bin/fish")

vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- open nvim-tree on setup
local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = open_nvim_tree,
})