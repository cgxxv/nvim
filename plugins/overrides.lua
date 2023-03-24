local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",

    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "scss",
    "html",
    "css",
    "svelte",

    "bash",
    "c",
    "cpp",
    "go",
    "rust",
    "python",
    "sql",
    "php",

    "make",
    "cmake",

    "markdown",
    "markdown_inline",

    "regex",

    "graphql",
    "dockerfile",
    "gitignore",
  },
  autotag = { enable = true },
  auto_install = true,
}

-- git support in nvimtree
M.nvimtree = {
  -- filters = {
  --   dotfiles = false,
  -- },
  git = {
    enable = true,
    ignore = false,
  },

  update_cwd = false,
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  -- defaults = {},
  extensions_list = { "refactoring" },
}

return M
