local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,
  -- b.formatting.eslint_d,
  -- b.code_actions.eslint,
  -- b.diagnostics.eslint,
  -- b.diagnostics.jshint,
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  -- b.formatting.prettier,
  b.formatting.prettierd,
  b.diagnostics.stylelint,
  b.formatting.stylelint,
  -- b.formatting.rustywind,

  -- json
  b.diagnostics.jsonlint,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- fish
  b.diagnostics.fish,

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,
  b.diagnostics.cppcheck,
  -- b.diagnostics.cpplint,
  -- b.diagnostics.clang_check,

  -- python
  -- b.code_actions.refactoring,
  -- b.diagnostics.flake8,
  b.formatting.autopep8,
  -- b.formatting.black,
  b.formatting.isort,
  -- b.formatting.yapf,

  -- golang
  b.formatting.goimports,
  b.formatting.gofumpt,
  -- b.formatting.golines,
  b.diagnostics.golangci_lint,
  -- b.diagnostics.staticcheck,
  -- b.diagnostics.revive,
  b.code_actions.gomodifytags,

  -- php
  b.diagnostics.php,
  b.diagnostics.phpcs,
  b.diagnostics.phpstan,
  b.diagnostics.psalm,
  b.formatting.phpcbf,
  b.formatting.phpcsfixer,

  -- toml
  b.formatting.taplo,

  -- writing
  b.diagnostics.write_good,
  b.diagnostics.editorconfig_checker,
  b.diagnostics.todo_comments,
  b.diagnostics.dotenv_linter,
  b.diagnostics.trail_space,
  -- b.diagnostics.misspell,
  b.diagnostics.codespell,
  -- b.formatting.codespell,

  -- tools
  b.diagnostics.checkmake,
  b.diagnostics.cmake_lint,

  b.hover.dictionary,
  b.hover.printenv,

  -- b.code_actions.gitsigns,
  b.diagnostics.gitlint,
}

-- NOTE/FIXME: a stupid solution
table.insert(b.formatting.prettierd.filetypes, "svelte")
table.insert(b.code_actions.eslint_d.filetypes, "svelte")
table.insert(b.diagnostics.eslint_d.filetypes, "svelte")
-- table.insert(b.code_actions.eslint.filetypes, "svelte")
-- table.insert(b.diagnostics.eslint.filetypes, "svelte")

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(bufnr, "textDocument/formatting", vim.lsp.util.make_formatting_params {}, function(err, res, ctx)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      -- you can modify the log message / level (or ignore it completely)
      vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
      return
    end

    -- don't apply results if buffer is unloaded or has been modified
    if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd "silent noautocmd update"
      end)
    end
  end)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- async_formatting(bufnr)
          vim.lsp.buf.format {
            filter = function(client2)
              --  only use null-ls for formatting instead of lsp server
              return client2.name == "null-ls"
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}
