" Json.vim -- json specific functions


" Setting json specific options
"
" Usage:    au Filetype json call JsonOptions()
"
function! JsonOptions()
    set concealcursor=

    command! -nargs=* JsonFormat :%!python -m json.tool
endfunction
