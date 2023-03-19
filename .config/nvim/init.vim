let g:mapleader = " "
"  sil !wget -nc -q github.com/junegunn/vim-plug/raw/master/plug.vim -P "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
" bootstrap

call plug#begin()
" [[performance]]
Plug 'lewis6991/impatient.nvim'
" [[ appearance ]]
" icons use with nerdfonts
Plug  'nvim-tree/nvim-web-devicons'
" material theme
Plug  'marko-cerovac/material.nvim'
" set font color
Plug 'NvChad/nvim-colorizer.lua'
Plug 'folke/lsp-colors.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'norcalli/nvim-colorizer.lua'
" status bar & bufferline
Plug 'nvim-lua/popup.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
" Scroll
Plug 'karb94/neoscroll.nvim'
" top bar & status bar
" welcome
Plug 'goolord/alpha-nvim'
"  Plug 'wakatime/vim-wakatime'
" [[ editor ]]
" keymaps Only load whichkey after all the gui
Plug 'folke/which-key.nvim'
" [[ file manager and search ]]
" file tree
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tamago324/lir.nvim'
Plug 'ahmedkhalf/project.nvim'
" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
" File manager
"  Plug 'Pocco81/auto-save.nvim'
Plug 'ethanholz/nvim-lastplace'
Plug 'folke/persistence.nvim'
" [[ language features & runner]]
" fuzzy search & symbol search
Plug 'SmiteshP/nvim-navic'
Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/trouble.nvim'
" language server & auto-complete & debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'neovim/nvim-lspconfig'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"  Plug 'ray-x/lsp_signature.nvim'
Plug 'rmagatti/goto-preview'
Plug 'metakirby5/codi.vim'
"  Plug 'turbio/bracey.vim'
"  Plug 'tpope/vim-bundler'
"  Plug 'tpope/vim-rails'
"  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
"  Plug 'zbirenbaum/copilot.lua'
" Plug 'zbirenbaum/copilot-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'folke/neodev.nvim' " Plug for neovim init.vim/lua
Plug 'windwp/nvim-autopairs'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-ts-autotag'
"  Plug 'jasonwoodland/vim-html-indent'
" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"  Plug 'monaqa/dial.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
" align indent
Plug 'lukas-reineke/indent-blankline.nvim'
" syntax highlights
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'b0o/schemastore.nvim'
" comments
Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'
" jupyter support
Plug 'dccsillag/magma-nvim'
" markdown support
Plug 'instant-markdown/vim-instant-markdown',
"  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" tex support
Plug 'lervag/vimtex'
" [[ utils ]]
" notification
Plug 'rcarriga/nvim-notify'
Plug 'akinsho/toggleterm.nvim'
"git signs
Plug 'lewis6991/gitsigns.nvim'
" command auto complete
Plug 'gelguy/wilder.nvim'
function! UpdateRemotePlugins(...)
  " Needed to refresh runtime files
  let &rtp=&rtp
  UpdateRemotePlugins
endfunction

Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
Plug 'neovim/tree-sitter-vimdoc'
" Log
Plug 'Tastyep/structlog.nvim'
"  jump anywhere in a document with as few keystrokes as possible
Plug 'phaazon/hop.nvim' 
" [[ other ]]
"  Plug 'ggandor/lightspeed.nvim'
"  Plug 'echasnovski/mini.map'
"  Plug 'nacro90/numb.nvim'
"  Plug 'kevinhwang91/nvim-bqf'
"  Plug 'windwp/nvim-spectre'
"  Plug 'nvim-neo-tree/neo-tree.nvim'
"  Plug 'kevinhwang91/rnvimr'
"  Plug 'camspiers/snap'
"  Plug 'andymass/vim-matchup'
"  Plug 's1n7ax/nvim-window-picker'
"  Plug 'sindrets/diffview.nvim'
"  Plug 'f-person/git-blame.nvim'
"  Plug 'ruifm/gitlinker.nvim'
"  Plug 'pwntester/octo.nvim'
"  Plug 'tpope/vim-fugitive'
"  Plug 'mattn/vim-gist'
"  Plug 'windwp/nvim-ts-autotag'
"  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
"  Plug 'mrjones2014/nvim-ts-rainbow'
"  Plug 'tpope/vim-repeat'
call plug#end()

lua require('plugins')
lua require('core')

