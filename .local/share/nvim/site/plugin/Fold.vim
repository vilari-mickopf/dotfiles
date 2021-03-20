" Fold -- Better folding function


" ProperTextFolding -- Proper fold
"
" Usage:
"
" set foldtext=ProperTextFolding()
"
function! ProperTextFolding()
    set l:fillchars="fold: "

    let l:line = ' ' . substitute(getline(v:foldstart),
                \ '^\s*["''/\*]*\s*\|\s*"\?\s*{{' .
                \ '{\d*\s*' . '\|["''*/]*', '', 'g') .
                \ ' '

    let l:lines_count = v:foldend - v:foldstart + 1
    let l:lines_count_text = '| ' . printf('%7s', l:lines_count . ' lines') . ' |'
    let l:foldchar = matchstr(&l:fillchars, 'fold:\zs.')

    let l:foldtextstart = strpart('+' . repeat('-', v:foldlevel*2) . l:line[:60],
                                 \ 0, (winwidth(0)*2)/3)
    let foldtextend = l:lines_count_text . repeat(l:foldchar, 8)
    let foldtextlength = strlen(substitute(
            \ l:foldtextstart . l:foldtextend, '.', 'x', 'g')) + &l:foldcolumn
    return l:foldtextstart . repeat('-', 80 - l:foldtextlength) . l:foldtextend
endfunction
