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

  -- ["nvim-lualine/lualine.nvim"] = {
  --   requires = { "kyazdani42/nvim-web-devicons", opt = true },
  --   config = function()
  --     require("lualine").setup {
  --       sections = {
  --         lualine_a = {
  --           "buffers",
  --           show_filename_only = false,
  --           buffers_color = {
  --             -- Same values as the general color option can be used here.
  --             active = "lualine_{section}_normal", -- Color for active buffer.
  --             inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
  --           },
  --           symbols = {
  --             modified = " ●", -- Text to show when the buffer is modified
  --             alternate_file = "#", -- Text to show to identify the alternate file
  --             directory = "", -- Text to show when the buffer is a directory
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- ["m-demare/hlargs.nvim"] = {
  --   config = function()
  --     require("hlargs").setup()
  --   end,
  -- },

  -- ["RRethy/nvim-treesitter-textsubjects"] = {
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- },
  --
  -- ["nvim-treesitter/nvim-treesitter-textobjects"] = {
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- },

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
