" Wrap.vim -- Toggle wrapping


" Store current wrapping setting
let s:wrap = 1


" Enable/disable wrapping
"
command! WrapToggle call s:WrapToggle()

function s:WrapToggle()
    if s:wrap == 1
        set formatoptions-=t
        set formatoptions+=c
        let s:wrap = 0
        echo('Wrapping disabled')
    else
        set formatoptions+=t
        set formatoptions-=c
        let s:wrap = 1
        echo('Wrapping enabled')
    endif
endfunction
