require('gitsigns').setup {
    signs = {
        add = {hl = 'GitSignsAdd', text = '+',
               numhl='GitSignsAddNr', linehl='GitSignsAddLn'},

        change = {hl = 'GitSignsChange', text = '~',
                  numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},

        delete = {hl = 'GitSignsDelete', text = '-',
                  numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},

        topdelete = {hl = 'GitSignsDelete', text = '-',
                     numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},

        changedelete = {hl = 'GitSignsChange', text = '~',
                        numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    watch_index = {
        interval = 1000
    },

    preview_config = {border = 'none'},
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 250,
    status_formatter = nil,
}
