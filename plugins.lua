local overrides = require "custom.configs.overrides"

return {
  -- { "christoomey/vim-tmux-navigator", lazy = false },

  -- { "szw/vim-maximizer", lazy = false },

  {
    "numToStr/Comment.nvim",
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("custom.configs.mason-lsp").setup()
    end,
  },

  -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- lazy = false,
    config = function()
      require "custom.configs.null-ls"
    end,
  },

  -- towolf/vim-helm provides basic syntax highlighting and filetype detection
  -- ft = 'helm' is important to not start yamlls
  { "towolf/vim-helm", ft = "helm" },
  -- { "sheerun/vim-polyglot" },

  {
    "neovim/nvim-lspconfig",
    -- lazy = false,
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile", "BufEnter" },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    -- opts = overrides.mason,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    -- lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require "custom.configs.mason-null-ls"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    -- opts = overrides.nvimtree,
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- {
  --   "fatih/vim-go",
  --   config = function()
  --     vim.g.go_addtags_transform = "camelcase"
  --   end,
  -- },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      -- require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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

  {
    "glepnir/lspsaga.nvim",
    lazy = false,
    branch = "main",
    config = function()
      require("lspsaga").setup {
        -- keybinds for navigation in lspsaga window
        -- scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
        -- use enter to open file with definition preview
        definition = {
          keys = {
            edit = "<CR>",
          },
        },
        -- ui = {
        --   colors = {
        --     normal_bg = "#022746",
        --   },
        -- },
        extract_var_statements = {
          go = "%s := %s // poggers",
          cpp = {
            'printf("a custom statement %%s %s", %s)',
          },
        },
      }
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      --Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter",
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
  { "onsails/lspkind.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    opts = function()
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

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "m-demare/hlargs.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("hlargs").setup()
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  -- lf file manager
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  },

  {
    "luukvbaal/nnn.nvim",
    lazy = false,
    config = function()
      require("nnn").setup()
    end,
  },

  {
    "lmburns/lf.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
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
      -- vim.keymap.set("n", "<Leader>2f", ":Lf<CR>")
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#3A1078",
      }
    end,
  },
  {
    "dnlhc/glance.nvim",
    -- lazy = false,
    config = function()
      require("glance").setup()
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
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
  { "tpope/vim-surround" },

  -- replace with register contents using motion (gr + motion)
  { "inkarkat/vim-ReplaceWithRegister" },
}
