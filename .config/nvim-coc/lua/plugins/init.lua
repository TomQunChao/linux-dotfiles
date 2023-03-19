local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
local opts = {
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
-- plugin list
local plugins = {
  --[[ performance ]]
  "lewis6991/impatient.nvim",
  --[[ appearance ]]
  --icons use with nerdfonts
  "nvim-tree/nvim-web-devicons",
  -- material theme
  'marko-cerovac/material.nvim',
  -- set font color
  "NvChad/nvim-colorizer.lua",
  -- status bar
  { "feline-nvim/feline.nvim", branch = '0.5-compat' },
  -- "vim-airline/vim-airline",
  -- 'vim-airline/vim-airline-themes',
  -- "hoob3rt/lualine.nvim",
  -- top bar
  { 'romgrk/barbar.nvim',      dependencies = 'nvim-tree/nvim-web-devicons' },
  -- welcome
  { 'goolord/alpha-nvim',      dependencies = { 'nvim-tree/nvim-web-devicons' } },
  --[[ editor ]]
  --keymaps Only load whichkey after all the gui
  "folke/which-key.nvim",
  --[[ file manager and search ]]
  -- fuzzy search
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- file tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },
  --[[ language features & runner]]
  -- auto complete
  { 'junegunn/fzf', dir = '~/.fzf' },
  {'junegunn/fzf.vim',lazy=false},
  { 'neoclide/coc.nvim',    branch = 'release' },
  -- symbol,outline,...
  { 'antoinemadec/coc-fzf', branch = 'release' },
  -- align indent
  "lukas-reineke/indent-blankline.nvim",
  -- syntax highlights
  "nvim-treesitter/nvim-treesitter",
  -- comments
  "numToStr/Comment.nvim",
  -- useful snippets
  "rafamadriz/friendly-snippets",
  -- jupyter support
  "dccsillag/magma-nvim",
  -- markdown support
  'instant-markdown/vim-instant-markdown',
  --[[ utils ]]
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  -- git signs
  "lewis6991/gitsigns.nvim",
  -- command auto complete
  "gelguy/wilder.nvim",
  "neovim/tree-sitter-vimdoc"
}
require("lazy").setup(plugins, opts)
-- setup plugins
vim.cmd 'colorscheme material'
require('feline').setup()
-- require('feline').winbar.setup()
require("plugins.coc")
require("nvim-tree").setup()
require("wilder").setup({ modes = { ':', '/', '?' } })
require("plugins.comment") -- :h comment.config https://github.com/numToStr/Comment.nvim
require("plugins.which-key")
require("plugins.vim-instant-markdown")
