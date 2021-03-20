" Strip.vim -- Striping whitespaces


" Store current stripping setting
let s:strip = 1


" StripToggle -- Enable/disable stripping
"
" Usage:
"
" :StripToggle
"
command! StripToggle call s:StripToggle()
function s:StripToggle()
    if s:strip == 1
        let s:strip = 0
        echo('Stripping disabled')
    else
        let s:strip = 1
        echo('Stripping enabled')
    endif
endfunction


" Remove trailing whitespace on file save
"
" Usage:
"
" au BufWritePre * :call StripTrailingWhitespaces()
"
function! StripTrailingWhitespaces()
    if s:strip == 1
        " Save cursor position
        let l = line(".")
        let c = col(".")

        " Remove trailing spaces
        %s/\s\+$//e

        " Restore cursor position
        call cursor(l, c)
    else
        call EchoWarning('Stripping disabled')
    endif
endfun
