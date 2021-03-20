" Grep -- greping words in whole project


" GrepInProject -- Greping word in project
"
" Usage:
"
" :GrepInProject
" :GrepWordUnderCursorInProject
"
command! GrepInProject call s:GrepInProject('input')
command! GrepWordUnderCursorInProject call s:GrepInProject('cursor')

function! s:GrepInProject(type)
    " Get project root
    let l:filename = expand('%:p')
    let l:root = system('python ' . g:script_dir .
                       \'project.py --file ' . l:filename)

    if a:type == 'input'
        " Get argument
        let l:word = PromptGetUserInput('Grep: ', 'customlist,CompleteWords')
        if empty(l:word) | return | endif
    elseif a:type == 'cursor'
        let l:word = expand('<cword>')
    endif

    " Grep
    exe 'norm :split term://grep --color ' .
                               \'--exclude-dir=.git/ ' .
                               \'--exclude-dir=.ccls-cache/ ' .
                               \'--exclude-dir=build/ ' .
                               \'--exclude-dir=.objs/ ' .
                               \'-r ' . l:word . ' ' . l:root . '\n'
    redraw!
    echo('Grep in project')
endfunction
