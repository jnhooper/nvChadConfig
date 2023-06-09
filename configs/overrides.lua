local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "astro",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "eslint-lsp",
    -- "prettierd",
    "eslint_d",
    -- -   "prettier-eslint",
    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
  -- registries = {
  --   "lua:mason-registry.index",
  --   "github:mason-org/mason-registry",
  --   "github:jnhooper/mason-registry",
  -- },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
