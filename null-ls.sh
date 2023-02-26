#!/bin/sh

sudo port install -y shellcheck

npm i -g tree-sitter eslint eslint_d jshint prettier prettier-eslint-cli @fsouza/prettierd prettier_d_slim
npm i -g write-good
npm i -g @tailwindcss/language-server
npm i -g yaml-language-server
npm i -g svelte-language-server

cargo install stylua dotenv-linter
cargo install --features lsp --locked taplo-cli

luarocks install luacheck

go install -v mvdan.cc/sh/v3/cmd/shfmt@latest
go install -v golang.org/x/tools/cmd/goimports@latest
go install -v mvdan.cc/gofumpt@latest
go install -v github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install -v github.com/editorconfig-checker/editorconfig-checker/cmd/editorconfig-checker@latest
go install -v github.com/client9/misspell/cmd/misspell@latest
go install -v github.com/mgechev/revive@latest
go install -v github.com/fatih/gomodifytags@latest

pip install -U autopep8 isort
