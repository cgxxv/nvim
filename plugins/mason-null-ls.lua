local present, mason_null_ls = pcall(require, "mason-null-ls")
if not present then
  return
end

local options = {
  ensure_installed = {
    "stylua",
    "luacheck",

    -- "eslint_d",
    -- "eslint",
    "prettierd",
    "stylelint",
    "jsonlint",
    "jq",

    "shfmt",
    "shellcheck",

    "fish",

    "clang_format",
    "cppcheck",
    "rustfmt",

    -- "autopep8",
    "isort",
    "pylint",
    "refactoring",
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

    "php",
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
    "dotenv_linter",
    "trail_space",
    "codespell",

    "checkmake",
    "cmake_lint",

    "dictionary",
    "printenv",

    "gitlint",
  },
  automatic_installation = true,
  -- automatic_setup = true,
}

mason_null_ls.setup(options)
