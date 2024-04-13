require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

o.relativenumber = true -- show relative line numbers
o.cursorline = true -- highlight the current cursor line

-- o.background = "dark" -- colorschemes that can be light or dark will be made dark

o.clipboard:append "unnamedplus" -- use system clipboard as default register
o.iskeyword:append "-" -- consider string-string as whole word
