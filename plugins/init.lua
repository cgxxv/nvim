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

  ["m-demare/hlargs.nvim"] = {
    config = function()
      require("hlargs").setup()
      -- TODO: should double check
      -- require "nvim-treesitter/nvim-treesitter"
    end,
  },

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
  ["nvim-lua/plenary.nvim"] = {},
  ["akinsho/toggleterm.nvim"] = {
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  ["lmburns/lf.nvim"] = {
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
    requires = { "plenary.nvim", "toggleterm.nvim" },
  },

  -- FIXME: will lead to nvchad.ui.icons not found error
  -- ["ibhagwan/fzf-lua"] = {
  --   -- optional for icon support
  --   -- requires = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("fzf-lua").setup {
  --       winopts = {
  --         hl = { border = "FloatBorder" },
  --       },
  --     }
  --   end,
  -- },
  ["rcarriga/nvim-notify"] = {},
  ["dnlhc/glance.nvim"] = {
    config = function()
      require("glance").setup()
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("gitsigns").setup()
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

  ["numToStr/Comment.nvim"] = {
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
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

  -- FIXME: will lead to nvchad.ui.icons error
  -- ["ldelossa/nvim-ide"] = {
  --   config = function()
  --     -- default components
  --     local bufferlist = require "ide.components.bufferlist"
  --     local explorer = require "ide.components.explorer"
  --     local outline = require "ide.components.outline"
  --     local callhierarchy = require "ide.components.callhierarchy"
  --     local timeline = require "ide.components.timeline"
  --     local terminal = require "ide.components.terminal"
  --     local terminalbrowser = require "ide.components.terminal.terminalbrowser"
  --     local changes = require "ide.components.changes"
  --     local commits = require "ide.components.commits"
  --     local branches = require "ide.components.branches"
  --     local bookmarks = require "ide.components.bookmarks"
  --
  --     require("ide").setup {
  --       -- The global icon set to use.
  --       -- values: "nerd", "codicon", "default"
  --       icon_set = "default",
  --       -- Component specific configurations and default config overrides.
  --       components = {
  --         -- The global keymap is applied to all Components before construction.
  --         -- It allows common keymaps such as "hide" to be overriden, without having
  --         -- to make an override entry for all Components.
  --         --
  --         -- If a more specific keymap override is defined for a specific Component
  --         -- this takes precedence.
  --         global_keymaps = {
  --           -- example, change all Component's hide keymap to "h"
  --           -- hide = h
  --         },
  --         -- example, prefer "x" for hide only for Explorer component.
  --         -- Explorer = {
  --         --     keymaps = {
  --         --         hide = "x",
  --         --     }
  --         -- }
  --       },
  --       -- default panel groups to display on left and right.
  --       panels = {
  --         left = "explorer",
  --         right = "git",
  --       },
  --       -- panels defined by groups of components, user is free to redefine the defaults
  --       -- and/or add additional.
  --       panel_groups = {
  --         explorer = {
  --           outline.Name,
  --           bufferlist.Name,
  --           explorer.Name,
  --           bookmarks.Name,
  --           callhierarchy.Name,
  --           terminalbrowser.Name,
  --         },
  --         terminal = { terminal.Name },
  --         git = { changes.Name, commits.Name, timeline.Name, branches.Name },
  --       },
  --       -- workspaces config
  --       workspaces = {
  --         -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
  --         auto_open = "left",
  --       },
  --       -- default panel sizes for the different positions
  --       panel_sizes = {
  --         left = 30,
  --         right = 30,
  --         bottom = 15,
  --       },
  --     }
  --   end,
  -- },
}
