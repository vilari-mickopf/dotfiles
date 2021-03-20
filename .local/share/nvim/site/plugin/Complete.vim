" Complete -- Complete functions


" CompleteWords -- Complete function for words in file
"
" Usage:
"
" input('Input: ', '', 'customlist,CompleteWords')
"
function! CompleteWords(ArgLead, CmdLine, CursorPos)
    let l:word_list = []
    let l:filepath = expand('%:p')
    let l:lines = readfile(l:filepath)
    for l:line in l:lines
        let l:words = split(l:line, ' ')
        for l:word in l:words
            let l:word_list += [matchstr(l:word, '[a-zA-Z]\+')]
        endfor
    endfor

    let l:word_list = uniq(sort(l:word_list))

    if !empty(a:ArgLead)
        call filter(l:word_list, 'v:val[:len(a:ArgLead)-1] == a:ArgLead')
    endif

	return l:word_list
endfunction
