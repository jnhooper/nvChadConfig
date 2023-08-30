---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tw"] = {
      function()
        require("twilight").toggle()
      end,
      "toggle twilight",
    },
    ["<leader>zm"] = {
      function()
        require("zen-mode").toggle()
      end,
      "toggle zen mode",
    },
    ["<leader>cb"] = {
      ":%bd|e# <CR>",
      "close all buffers except current",
    },
  },
}

M.split = {
  n = {

    ["<leader>m"] = {
      function()
        require("treesj").toggle()
      end,
      "toggle split/join node",
    },
    ["<leader>s"] = {
      function()
        require("treesj").split()
      end,
      "split node",
    },
    ["<leader>j"] = {
      function()
        require("treesj").join()
      end,
      "join node",
    },
  },
}

M.disabled = {

  n = {
    -- toggle comment in both modes
    ["<leader>/"] = "",
    ["<leader>rn"] = "",
    ["<leader>ra"] = "",
    ["<leader>h"] = "",
  },

  v = {
    -- toggle comment in both modes
    ["<leader>/"] = "",
  },
}

-- TODO REMAP RENAME TO RN AND TOGGLE LINE NUMBER TO an (absoulute numbers)
M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>ci"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>ci"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.lspconfig = {
  n = {

    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<leader>dd"] = { "<cmd>Telescope diagnostics<CR>", "See diagnostics for current buffer" },
  },
}

-- more keybinds!
M.jumps = {
  -- n === normal mode
  n = {
    ["<C-j>"] = { "5j", "jump down 5 lines" },
    ["<C-k>"] = { "5k", "jump up 5 lines" },
    ["[g"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "go to previous error" },
    ["]g"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "go to next error" },
  },
}
M.typeCheck = {
  n = {
    ["<leader>k"] = { "<cmd>InspectTwoslashQueries<CR>", "inspect type under cursor" },
    ["<leader>ck"] = { "<cmd>RemoveTwoslashQueries<CR>", "clear all type queries from buffer" },
  },
}

M.gitsigns = {
  n = {
    ["<Leader>hs"] = {
      ":Gitsigns stage_hunk<CR>",
      "hunk stage",
    },
    ["<Leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "HUNK STAGE (stage file)",
    },
    ["<Leader>hr"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "hunk reset",
    },
    ["<Leader>gs"] = {
      ":Gvdiffsplit!<CR>",
      "git split",
    },
    ["dgh"] = {
      ":diffget //2<CR>|:diffupdate<CR>",
      "diff get left",
    },
    ["dgl"] = {
      ":diffget //3<CR>|:diffupdate<CR>",
      "diff get right",
    },
  },
}

return M
