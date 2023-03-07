local overrides = require "custom.plugins.overrides"

return {
  ["christoomey/vim-tmux-navigator"] = {},
  ["szw/vim-maximizer"] = {},

  -- ["williamboman/mason-lspconfig.nvim"] = {
  --   after = "mason.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup {
  --       ensure_installed = overrides.mason.ensure_installed,
  --       automatic_installation = true,
  --     }
  --   end,
  -- },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["jayp0521/mason-null-ls.nvim"] = {
    after = "mason.nvim",
    config = function()
      require "custom.plugins.mason-null-ls"
    end,
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      require("lspsaga").setup {
        -- keybinds for navigation in lspsaga window
        scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
        -- use enter to open file with definition preview
        definition = {
          edit = "<CR>",
        },
        ui = {
          colors = {
            normal_bg = "#022746",
          },
        },
      }
    end,
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  -- TODO: need this?
  ["jose-elias-alvarez/typescript.nvim"] = {},
  ["onsails/lspkind.nvim"] = {},

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- ["kyazdani42/nvim-tree.lua"] = {
  --   override_options = overrides.nvimtree,
  -- },

  ["nvim-telescope/telescope.nvim"] = {
    branch = "0.1.x",
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      -- configure custom mappings
      require("telescope.actions").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
          },
        },
      }
    end,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["m-demare/hlargs.nvim"] = {
    config = function()
      require("hlargs").setup()
      -- TODO: should double check
      -- require "nvim-treesitter/nvim-treesitter"
    end,
  },

  -- lf file manager
  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("toggleterm").setup()
    end,
  },
  ["lmburns/lf.nvim"] = {
    requires = {"plenary.nvim", "toggleterm.nvim"},
    config = function()
      -- requires { "plenary.nvim", "toggleterm.nvim" }

      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1

      require("lf").setup {
        escape_quit = false,
        border = "rounded",
        highlights = {
          Normal = { guibg = "NONE" },
          NormalFloat = { link = "Normal" },
          FloatBorder = { guifg = "#819C3B", guibg = "NONE" },
        },
        -- highlights = { NormalFloat = { guibg = "NONE" }, FloatBorder = { guifg = "NONE" } },
        winblend = 0,
      }
      vim.keymap.set("n", "<Leader>2f", ":Lf<CR>")
    end,
  },

  ["rcarriga/nvim-notify"] = {},
  ["dnlhc/glance.nvim"] = {
    config = function()
      require("glance").setup()
    end,
  },

  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require("symbols-outline").setup()
    end,
  },

  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
  },

  -- ["gpanders/editorconfig.nvim"] = {},

  -- add, delete, change surroundings
  ["tpope/vim-surround"] = {},

  -- replace with register contents using motion (gr + motion)
  ["inkarkat/vim-ReplaceWithRegister"] = {},
}
