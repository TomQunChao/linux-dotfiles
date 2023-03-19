
-- setup plugins
vim.cmd 'colorscheme material'
require("wilder").setup({ modes = { ':', '/', '?' } })
require('nvim-tree').setup()
require('plugins.bufferline')
require('plugins.cmp')
require('plugins.lspconfig')
require('nvim-ts-autotag').setup()
require('plugins.null-ls')
require("plugins.autopairs")
require('plugins.treesitter')
require("plugins.nvim-tree")
require("plugins.comment") -- :h comment.config https://github.com/numToStr/Comment.nvim
require("plugins.which-key")
require("plugins.vim-instant-markdown")
-- vim.cmd('source vimtex.vim')
