local present, mason_null_ls = pcall(require, "mason-null-ls")
if not present then
  return
end

local options = {
  ensure_installed = {
    "stylua",
    "luacheck",

    -- "eslint_d",
    "eslint",
    "prettierd",
    "stylelint-lsp",
    "jsonlint",
    "jq",

    "shfmt",
    -- "shellcheck",

    "clang_format",
    "cpptools",
    "rustfmt",

    -- "autopep8",
    "isort",
    "pylint",
    "flake8",
    "black",
    -- "yapf",

    "goimports",
    -- "goimports_reviser", -- format imports
    "gofumpt",
    "gomodifytags",
    "golines",
    "staticcheck",
    -- "revive",

    "phpstan",
    "psalm",
    "phpcbf",
    "phpcs",
    "phpcsfixer",

    "sqlfluff",
    "sql_formatter",

    "taplo",
    "yamlfmt",
    "yamllint",

    "write_good",
    "editorconfig_checker",
    "codespell",

    "cmakelint",

    "gitlint",
  },
  automatic_installation = true,
  -- automatic_setup = true,
}

mason_null_ls.setup(options)
