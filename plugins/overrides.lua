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

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "luacheck",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",
    "jq",
    -- "jshint", -- not exists
    "jsonlint",

    -- yaml
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- python
    -- "refactoring",
    "flake8",
    "autopep8",
    "black",
    "isort",
    "yapf",

    -- golang
    "gopls",
    "go-debug-adapter",
    "delve",
    "golangci-lint",
    "goimports",
    "golines",
    "gofumpt",
    -- "staticcheck",
    -- "revive",

    -- python
    -- "pyright-langserver",
    "pyright",
    "pylint",

    -- rust
    "rust-analyzer",

    -- c++ or c
    "clangd",
    "clang-format",

    -- cmake
    "cmake-language-server",

    -- php
    "phpactor",
    "php-debug-adapter",
    "phpcs",
    "php-cs-fixer",

    -- docker
    "dockerfile-language-server",

    -- sql
    "sqlls",
    "sqlfluff",
    "sql-formatter",

    -- shell, bash
    "shfmt",
    "shellcheck",
    "bash-debug-adapter",

    -- awk
    "awk-language-server",

    -- writting
    "write-good",
  },
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

return M
