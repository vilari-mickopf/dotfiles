#! /usr/bin/env lua

--------------------------------------------------------------------------------
--  lualine modules
--------------------------------------------------------------------------------

local colors = vim.fn['onedark#GetColors']()

local filename = {
    'filename',
    file_status = true,
    symbols = {modified = ' ', readonly = ' '}
}

local diagnostics = {
    'diagnostics',
    sources = {'nvim_lsp'},
    symbols = {error = ' ', warn = ' ', info= ' '},
    color_error = colors.red.gui,
    color_warn = colors.yellow.gui,
    color_info = colors.blue.gui
}

local lsp_progress = {
    'lsp_progress',
    color = {fg = colors.cyan.gui}
}

local inactive_branch = {
    'branch',
    color = {fg = colors.white.gui,
             bg = colors.menu_grey.gui}
}

local inactive_progress = {
    'progress',
    color = {fg = colors.white.gui,
             bg = colors.menu_grey.gui}
}

local inactive_location = {
    'location',
    color = {fg = colors.white.gui,
             bg = colors.menu_grey.gui}
}

local diff = {
    'diff',
    color_added	= colors.green.gui,
    color_modified = colors.yellow.gui,
    color_removed = colors.red.gui
}

local function encoding()
    if vim.fn.winwidth(0) < 120 then
        return ''
    end
    return vim.o.encoding
end

local function fileformat()
    if vim.fn.winwidth(0) < 120 then
        return ''
    end
    return vim.o.fileformat
end

local function lsp_client()
    if vim.fn.winwidth(0) < 120 then
        return ''
    end

    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return ' ' .. client.name
        end
    end
    return msg
end


--------------------------------------------------------------------------------
--  lualine setup
--------------------------------------------------------------------------------

require('lualine').setup{
    options = {
        theme = 'onedark',
        section_separators = {'', ''},
        component_separators = {'|', '|'},
        icons_enabled = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {filename, diff, lsp_progress},
        lualine_x = {encoding, fileformat, 'filetype', lsp_client},
        lualine_y = {diagnostics, 'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {inactive_branch},
        lualine_c = {filename},
        lualine_x = {'filetype'},
        lualine_y = {inactive_progress},
        lualine_z = {inactive_location}
    },
}


--------------------------------------------------------------------------------
--  bufferline setup
--------------------------------------------------------------------------------

require('bufferline').setup{
    highlights = {
        fill = {
            guifg = colors.cursor_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        background = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },

        tab = {
            guifg = colors.white.gui,
            guibg = colors.black.gui,
        },
        tab_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = 'bold'
        },

        buffer_visible = {
            guifg = colors.white.gui,
            guibg = colors.menu_grey.gui,
            gui = 'bold'
        },
        buffer_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = 'bold'
        },

        indicator_selected = {
            guifg = colors.green.gui,
            guibg = colors.green.gui,
        },

        separator = {
            guifg = colors.black.gui,
            guibg = colors.black.gui,
        },
        separator_visible = {
            guifg = colors.black.gui,
            guibg = colors.black.gui,
        },
        separator_selected = {
            guifg = colors.green.gui,
            guibg = colors.green.gui,
        },

        pick = {
            guifg = colors.green.gui,
            guibg = colors.black.gui,
            gui = 'bold'
        },
        pick_visible = {
            guifg = colors.green.gui,
            guibg = colors.black.gui,
            gui = 'bold'
        },
        pick_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = 'bold'
        },

        modified = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        modified_visible = {
            guifg = colors.white.gui,
            guibg = colors.menu_grey.gui,
        },
        modified_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
        },

        diagnostic = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        diagnostic_visible = {
            guifg = colors.white.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        diagnostic_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold"
        },

        error = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        error_visible = {
            guifg = colors.red.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        error_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },

        error_diagnostic = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        error_diagnostic_visible = {
            guifg = colors.red.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        error_diagnostic_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },

        warning = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        warning_visible = {
            guifg = colors.yellow.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        warning_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },

        warning_diagnostic = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        warning_diagnostic_visible = {
            guifg = colors.yellow.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        warning_diagnostic_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },

        info = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        info_visible = {
            guifg = colors.blue.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        info_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },

        info_diagnostic = {
            guifg = colors.comment_grey.gui,
            guibg = colors.cursor_grey.gui,
        },
        info_diagnostic_visible = {
            guifg = colors.blue.gui,
            guibg = colors.menu_grey.gui,
            gui = "bold",
        },
        info_diagnostic_selected = {
            guifg = colors.black.gui,
            guibg = colors.green.gui,
            gui = "bold",
        },
    },

    options = {
        view = 'default',
        numbers = 'none',
        number_style = '',
        mappings = false,
        modified_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 25,
        max_prefix_length = 15,
        tab_size = 25,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(_, _, diagnostics_dict)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or " " )
                s = s .. n .. sym
            end
            return s
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        sort_by = {'directory'},
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = false,
    }
}
