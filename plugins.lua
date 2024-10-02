local overrides = require "custom.configs.overrides"
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    --   config = function()
    --     return {
    --   registries:  {
    --     "github:jnhooper/mason-registry"
    --       }
    --
    -- }
    --   end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- needed for nvim-surround
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              --   -- You can optionally set descriptions to the mappings (used in the desc parameter of
              --   -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = {
                query = "@class.inner",
                desc = "Select inner part of a class region",
              },
              --   -- You can also use captures from other query groups like `locals.scm`
              ["as"] = {
                query = "@scope",
                query_group = "locals",
                desc = "Select language scope",
              },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            -- selection_modes = {
            --   ["@parameter.outer"] = "v", -- charwise
            --   ["@function.outer"] = "V", -- linewise
            --   ["@class.outer"] = "<c-v>", -- blockwise
            -- },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
          },
        },
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
  },
  {
    "folke/twilight.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        default = true,
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore",
          },
        },
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log",
          },
        },
      }
    end,
  },

  -- this guy helped figure out how to override the keys here.
  --   last message has some interesting ideas that would get into the shortcuts
  -- https://github.com/NvChad/NvChad/issues/1292
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    config = function()
      require("twoslash-queries").setup {
        multi_line = true, -- to print types in multi line mode
        highlight = "Type", -- to set up a highlight group for the virtual text
      }
    end,
  },

  --https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "tpope/vim-fugitive" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- keys = { "<space>m", "<space>j", "<space>s" },
    config = function()
      require("treesj").setup { -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = "hold",
      }
    end,
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"
    end,
    keys = {
      "ga", -- Default invocation prefix
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    lazy = false,
  },
  {
    "tpope/vim-abolish",
    init = function()
      -- Disable coercion mappings. I use text-case.nvim for that.
      vim.g.abolish_no_mappings = true
    end,
  },
}

return plugins
