local overrides = require "custom.plugins.overrides"

return {
  ["christoomey/vim-tmux-navigator"] = {},
  ["szw/vim-maximizer"] = {},

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
    config = function()
      require("custom.plugins.mason-lsp").setup()
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jayp0521/mason-null-ls.nvim"] = {
    after = "mason.nvim",
    config = function()
      require "custom.plugins.mason-null-ls"
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["fatih/vim-go"] = {
    config = function()
      vim.g.go_addtags_transform = "camelcase"
    end,
  },
  ["ThePrimeagen/refactoring.nvim"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup {
        prompt_func_return_type = {
          go = true,
          java = false,

          cpp = true,
          c = true,
          h = true,
          hpp = true,
          cxx = true,
        },
        prompt_func_param_type = {
          go = true,
          java = false,

          cpp = true,
          c = true,
          h = true,
          hpp = true,
          cxx = true,
        },
        printf_statements = {},
        print_var_statements = {},
      }
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
        extract_var_statements = {
          go = "%s := %s // poggers",
          cpp = {
            'printf("a custom statement %%s %s", %s)',
          },
        },
      }
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- TODO: need this?
  -- ["jose-elias-alvarez/typescript.nvim"] = {
  --   config = function()
  --     local on_attach = require("plugins.configs.lspconfig").on_attach
  --     local capabilities = require("plugins.configs.lspconfig").capabilities
  --     require("typescript").setup {
  --       server = {
  --         capabilities = capabilities,
  --         on_attach = on_attach,
  --       },
  --     }
  --   end,
  -- },
  ["onsails/lspkind.nvim"] = {},

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- ["kyazdani42/nvim-tree.lua"] = {
  --   override_options = overrides.nvimtree,
  -- },

  ["nvim-telescope/telescope.nvim"] = {
    branch = "0.1.x",
    override_options = function()
      local actions = require "telescope.actions"
      -- configure custom mappings
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
          },
        },
        extensions_list = { "refactoring" },
      }
    end,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["m-demare/hlargs.nvim"] = {
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("hlargs").setup()
    end,
  },

  -- lf file manager
  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("toggleterm").setup()
    end,
  },
  ["lmburns/lf.nvim"] = {
    requires = { "plenary.nvim", "toggleterm.nvim" },
    config = function()
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

  ["rcarriga/nvim-notify"] = {
    config = function()
      require("notify").setup {
        background_colour = "#3A1078",
      }
    end,
  },
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
