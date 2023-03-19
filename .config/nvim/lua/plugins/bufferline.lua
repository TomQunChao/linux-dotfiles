local icons = require('plugins.icons')
local function is_ft(b, ft)
    return vim.bo[b].filetype == ft
end
local function diagnostics_indicator(num, _, diagnostics, _)
    local result = {}
    local symbols = {
        error = icons.diagnostics.Error,
        warning = icons.diagnostics.Warning,
        info = icons.diagnostics.Information,
    }
    for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
            table.insert(result, symbols[name] .. " " .. count)
        end
    end
    local result = table.concat(result, " ")
    return #result > 0 and result or ""
end

local function custom_filter(buf, buf_nums)
    local logs = vim.tbl_filter(function(b)
        return is_ft(b, "log")
    end, buf_nums or {})
    if vim.tbl_isempty(logs) then
        return true
    end
    local tab_num = vim.fn.tabpagenr()
    local last_tab = vim.fn.tabpagenr "$"
    local is_log = is_ft(buf, "log")
    if last_tab == 1 then
        return true
    end
    -- only show log buffers in secondary tabs
    return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
end
local buf_kill=function(kill_command, bufnr, force)
    kill_command = kill_command or "bd"
  
    local bo = vim.bo
    local api = vim.api
    local fmt = string.format
    local fnamemodify = vim.fn.fnamemodify
  
    if bufnr == 0 or bufnr == nil then
      bufnr = api.nvim_get_current_buf()
    end
  
    local bufname = api.nvim_buf_get_name(bufnr)
  
    if not force then
      local warning
      if bo[bufnr].modified then
        warning = fmt([[No write since last change for (%s)]], fnamemodify(bufname, ":t"))
      elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
        warning = fmt([[Terminal %s will be killed]], bufname)
      end
      if warning then
        vim.ui.input({
          prompt = string.format([[%s. Close it anyway? [y]es or [n]o (default: no): ]], warning),
        }, function(choice)
          if choice ~= nil and choice:match "ye?s?" then buf_kill(kill_command, bufnr, true) end
        end)
        return
      end
    end
end
local config = {
    -- active = true,
    on_config_done = nil,
    -- keymap = {
    --     normal_mode = {},
    -- },
    highlights = {
        background = {
            italic = true,
        },
        buffer_selected = {
            bold = true,
        },
    },
    options = {
        mode = "buffers",               -- set to "tabs" to only show tabpages instead
        numbers = "none",               -- can be "none" | "ordinal" | "buffer_id" | "both" | function
        -- close_command = function(bufnr) -- can be a string | function, see "Mouse actions"
        --     buf_kill("bd", bufnr, false)
        -- end,
        right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",        -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,              -- can be a string | function, see "Mouse actions"
        indicator = {
            icon = icons.ui.BoldLineLeft,   -- this should be omitted if indicator style is not 'icon'
            style = "icon",                      -- can also be 'underline'|'none',
        },
        buffer_close_icon = icons.ui.Close,
        modified_icon = icons.ui.Circle,
        close_icon = icons.ui.BoldClose,
        left_trunc_marker = icons.ui.ArrowCircleLeft,
        right_trunc_marker = icons.ui.ArrowCircleRight,
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match "%.md" then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = diagnostics_indicator,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = custom_filter,
        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "DiffviewFiles",
                text = "Diff View",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "flutterToolsOutline",
                text = "Flutter Outline",
                highlight = "PanelHeading",
            },
            {
                filetype = "lazy",
                text = "Lazy",
                highlight = "PanelHeading",
                padding = 1,
            },
        },
        color_icons = true,                 -- whether or not to add the filetype icon highlights
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        hover = {
            enabled = false, -- requires nvim 0.8+
            delay = 200,
            reveal = { "close" },
        },
        sort_by = "id",
    },
}

require('bufferline').setup(config)