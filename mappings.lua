---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.disabled = {

  n = {
    -- toggle comment in both modes
    ["<leader>/"] = "",
    ["<leader>rn"] = "",
    ["<leader>ra"] = "",
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
  },
}

-- more keybinds!
M.jumps = {
  -- n === normal mode
  n = {
    ["<C-j>"] = { "5j", "jump down 5 lines" },
    ["<C-k>"] = { "5k", "jump up 5 lines" },
  },
}

return M
