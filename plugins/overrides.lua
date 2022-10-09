local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "tsserver",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",
    "jq",

    -- yaml
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- golang
    "gopls",
    "go-debug-adapter",
    "delve",
    "golangci-lint",
    "goimports",

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
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

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
