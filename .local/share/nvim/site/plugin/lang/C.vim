" Cpp.vim -- C/C++ specific functions


" Setting C/C++ specific options
"
" Usage:    au Filetype c, cpp, h, hpp call COptions()
"
function! COptions()
    " Highlights
    exe 'hi TSType guifg=' . g:terminal_color_3
endfunction
