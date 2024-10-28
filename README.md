# custom nvChad config

## install nvim
https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package

some minimal additions and modifications to the [nvChad](https://nvchad.com/)
setup.

once you install nvChad you should be able to just clone this into your
`~/.config/nvim/lua/custom` directory

## additions

- leap -> https://github.com/ggandor/leap.nvim
- nvim-surround -> https://github.com/kylechui/nvim-surround
- some fun ascii art for the dashboard
- vim-fugitive -> https://github.com/tpope/vim-fugitive
- two-slash-queries -> marilari88/twoslash-queries.nvim

## modifications

- `<C - j>` & `<C - k>` -> 5 line jumps
- added prettierd -> https://github.com/fsouza/prettierd
- added support for asto -> https://astro.build/
- turned on format on save
- added some gitsigns commands for staging and unstaging hunks
- `space k` -> show the type for the variable your cursor is on
- `space ck` -> remove all type comments from the above command
