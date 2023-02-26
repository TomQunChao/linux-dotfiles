-- before options
vim.g.mapleader = " "
vim.g.material_style = "darker"
vim.cmd "set nu"
vim.cmd "set autoindent"
-- set cindent
vim.cmd "set shiftwidth=4"
vim.cmd "set softtabstop=4"
vim.cmd "set tabstop=4"
-- load plugins
require("plugins")
-- after options
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
-- load autocmds
require("core.autocmds")
