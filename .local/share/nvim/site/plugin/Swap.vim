" Swap.vim -- Managing swap files


" DeleteSwaps -- Delete all swap files
"
" Usage:
"
" :DeleteSwaps
"
command! DeleteSwaps call s:DeleteSwaps()

function! s:DeleteSwaps()
    write
    let l:output = ''
    redir => l:output
    silent exec ':sw'
    redir END

    let l:current_swap_file = substitute(l:output, '\n', '', '')
    let l:base = substitute(l:current_swap_file, '\v\.\w+$', '', '')
    let l:swap_files = split(glob(l:base.'\.s*'))

    " Delete all except the current swap file
    for l:swap_file in l:swap_files
        if !empty(glob(l:swap_file)) && l:swap_file != l:current_swap_file
            call delete(l:swap_file)
            echo 'swap file removed: ' . l:swap_file
        endif
    endfor

    " Reset swap file extension to `.swp`.
    set swf! | set swf!
    echo 'Reset swap file extension for file: ' . expand('%')
endfunction
