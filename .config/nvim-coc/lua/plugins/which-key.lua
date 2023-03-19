local wk = require("which-key")
wk.setup({
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = '<c-d>', -- binding to scroll down inside the popup
      scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })
local mapping1={
  c={
    name="Code", --https://github.com/neoclide/coc.nvim
    f={":call CocAction('format')<cr>","Format"},
    s={":<C-u>CocFzfList symbols<cr>","Workspace Symbol"},
    d={":<C-u>CocFzfList diagnostics<cr>","List Diagnostics"},
    D={":<C-u>CocFzfList diagnostics --current-buf<cr>","List Current Diagnostics"},
    n={":<C-u>CocNext<cr>","CocNext"},
    p={":<C-u>CocPrev<cr>","CocPrev"},
    r={"<Plug>(coc-rename)","Rename Symbol"},
    i={":<C-u>CocFzfList issues<cr>","List issues"}
  },
  s={":<C-u>CocFzfList outline<cr>","Outline(Symbol)"},
  b={
    name="Buffer", -- https://github.com/romgrk/barbar.nvim
    p={"<Cmd>BufferPrevious<CR>","BufferPrevious"},
    n={"<Cmd>BufferNext<CR>","BufferNext"},
    P={"<Cmd>BufferMovePrevious<CR>","BufferMovePrevious"},
    N={"<Cmd>BufferMoveNext<CR>","BufferMoveNext"},
    b={"<Cmd>BufferOrderByBufferNumber<CR>","BufferOrderByBufferNumber"},
    d={"<Cmd>BufferOrderByDirectory<CR>","BufferOrderByDirectory"},
    l={"<Cmd>BufferOrderByLanguage<CR>","BufferOrderByLanguage"},
    w={"<Cmd>BufferOrderByWindowNumber<CR>","BufferOrderByWindowNumber"},
    i={"<Cmd>BufferPin<CR>","BufferPin"},
    c={"<Cmd>BufferClose<CR>","BufferClose"}
  },
  w={
    name="Window",
    s={":split<cr>","Split Horizontally"},
    v={":vsplit<cr>","Split Vertically"},
    -- view/sview命令
    n={":new<cr>","new file"},
    w={"<C-W>w","Switch Window"},
    j={"<C-W>j","Switch Down"},
    k={"<C-W>k","Switch Up"},
    h={"<C-W>h","Switch Left"},
    l={"<C-W>l","Switch Right"},
    t={"<C-W>t","Switch Top"},
    b={"<C-W>b","Switch Bottom"},
    p={"<C-W>p","Switch Previous"}
  },
  e={"<cmd>NvimTreeToggle<cr>","FileExplorer"},
  f={
    name="Find Files",
    f={function ()require('telescope.builtin').find_files()end,"Find Files"},
    g={function ()require('telescope.builtin').live_grep() end,"Live Grep"},
    b={function ()require('telescope.builtin').buffers() end,"Find Buffers"},
    h={function()require('telescope.builtin').help_tags() end,"Help Tags"}
  },
  l={
    name="Lsp And Config",
    c={"<cmd>CocConfig<cr>","Config"},
    C={":<C-u>CocList commands<cr>","List Coc Commands"},
    e={":<C-u>CocList extensions<cr>","List Coc Extensions"},
  },
  p={"<cmd>Lazy<cr>","Plugins"},
  t={":ToggleTerm<cr>","Terminal"},
  h={":noh<cr>","Clear Search Highlight"}
}
local opt1={
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

wk.register(mapping1, opt1)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-Up>', ':vertical resize +1', opts)
map('n', '<C-Down>', ':vertical resize -1', opts)
map('n', '<C-Left>', ':resize -1', opts)
map('n', '<C-Right>', ':resize +1', opts)
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- https://github.com/romgrk/barbar.nvim

-- Move to previous/next
-- map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
-- map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- -- Re-order to previous/next
-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- -- Goto buffer in position...
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- -- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- -- Close buffer
-- map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- -- Wipeout buffer
-- --                 :BufferWipeout
-- -- Close commands
-- --                 :BufferCloseAllButCurrent
-- --                 :BufferCloseAllButPinned
-- --                 :BufferCloseAllButCurrentOrPinned
-- --                 :BufferCloseBuffersLeft
-- --                 :BufferCloseBuffersRight
-- -- Magic buffer-picking mode
-- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- -- Sort automatically by...
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
