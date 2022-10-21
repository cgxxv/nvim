local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- lf file manager
  -- ["nvim-lua/plenary.nvim"] = {},
  -- ["akinsho/toggleterm.nvim"] = {
  --   tag = "*",
  --   config = function()
  --     require("toggleterm").setup()
  --   end
  -- },
  -- ["lmburns/lf.nvim"] = {
  --   config = function()
  --     -- This feature will not work if the plugin is lazy-loaded
  --     vim.g.lf_netrw = 1
  --
  --     require("lf").setup(
  --       {
  --         escape_quit = false,
  --         border = "rounded",
  --         -- highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
  --       }
  --     )
  --
  --     vim.keymap.set("n", "<Leader>2f", ":Lf<CR>")
  --   end,
  --   requires = {"plenary.nvim", "toggleterm.nvim"}
  -- }
}
