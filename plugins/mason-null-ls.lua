-- import mason-null-ls plugin safely
local present, mason_null_ls = pcall(require, "mason-null-ls")
if not present then
  return
end

local opts = {
  ensure_installed = {
    "stylua",
    "luacheck",

    "eslint_d",
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

    "autopep8",
    "isort",

    "goimports",
    "gofumpt",
    "golangci_lint",
    "gomodifytags",

    "php",
    "phpcs",
    "phpstan",
    "psalm",
    "phpcbf",
    "phpcsfixer",

    "taplo",

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

mason_null_ls.setup(opts)