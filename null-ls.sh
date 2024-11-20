#!/bin/sh

brew install shellcheck

# npm i -g tree-sitter-cli
npm i -g eslint jshint prettier #@fsouza/prettierd
npm i -g write-good
npm i -g @tailwindcss/language-server
npm i -g yaml-language-server
npm i -g svelte-language-server
npm i -g rustywind

cargo binstall stylua dotenv-linter -y
# cargo binstall --features lsp --locked taplo-cli -y
cargo binstall --locked taplo-cli -y
cargo binstall tree-sitter-cli -y

luarocks install luacheck

go install -v mvdan.cc/sh/v3/cmd/shfmt@latest
go install -v golang.org/x/tools/cmd/goimports@latest
go install -v mvdan.cc/gofumpt@latest
go install -v github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install -v github.com/editorconfig-checker/editorconfig-checker/cmd/editorconfig-checker@latest
go install -v github.com/client9/misspell/cmd/misspell@latest
go install -v github.com/mgechev/revive@latest
go install -v github.com/fatih/gomodifytags@latest
go install -v github.com/mrtazz/checkmake/cmd/checkmake@latest

pip install -U autopep8 isort
pip install -U cpplint
pip install -U cmakelang
