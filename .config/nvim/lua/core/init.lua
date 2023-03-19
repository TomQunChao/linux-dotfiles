vim.opt.termguicolors = true
-- before options
vim.g.mapleader = " "
vim.cmd "colorscheme material"
vim.g.material_style = "oceanic" -- darker,lighter,oceanic,palenight,deep ocean
vim.cmd "set nu"
vim.cmd "set smartindent" -- smartindent/cindent
-- set cindent
vim.cmd "set shiftwidth=4"
vim.cmd "set softtabstop=4"
vim.cmd "set tabstop=4"
vim.cmd "set ts=4"
vim.cmd "set expandtab"
-- vim.cmd "set showtabline=2"
-- transparent
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
-- load autocmds
require("core.autocmds")
