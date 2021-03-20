" Tab -- Working with tabs in vim

" Usage:
"
" :Tabmerge [tab number] [top|bottom|left|right]
"
" The tab number can be "$" for the last tab.  If the tab number isn't
" specified the tab to the right of the current tab is merged.  If there
" is no right tab, the left tab is merged.
"
" The location specifies where in the current tab to merge the windows.
" Defaults to "top".
"
command! -nargs=* Tabmerge call s:Tabmerge(<f-args>)

function! s:Tabmerge(...)
	if a:0 > 2
        EchoWarning('Too many arguments')
		return
	elseif a:0 == 2
		let tabnr = a:1
		let where = a:2
	elseif a:0 == 1
		if a:1 =~ '^\d\+$' || a:1 == '$'
			let tabnr = a:1
		else
			let where = a:1
		endif
	endif

	if !exists('l:where')
		let where = 'top'
	endif

	if !exists('l:tabnr')
		if type(tabpagebuflist(tabpagenr() + 1)) == 3
			let tabnr = tabpagenr() + 1
		elseif type(tabpagebuflist(tabpagenr() - 1)) == 3
			let tabnr = tabpagenr() - 1
		else
            EchoWarning('Already only one tab')
			return
		endif
	endif

	if tabnr == '$'
		let tabnr = tabpagenr(tabnr)
	else
		let tabnr = tabnr
	endif

	let tabwindows = tabpagebuflist(tabnr)

	if type(tabwindows) == 0 && tabwindows == 0
        EchoWarning('No such tab number: ' . tabnr)
		return
	elseif tabnr == tabpagenr()
        EchoWarning("Can't merge with the current tab")
		return
	endif

	if where =~? '^t\(op\)\?$'
		let where = 'topleft'
	elseif where =~? '^b\(ot\(tom\)\?\)\?$'
		let where = 'botright'
	elseif where =~? '^l\(eft\)\?$'
		let where = 'leftabove vertical'
	elseif where =~? '^r\(ight\)\?$'
		let where = 'rightbelow vertical'
	else
        EchoWarning('Invalid location: ' . a:2)
		return
	endif

	let save_switchbuf = &switchbuf
	let &switchbuf = ''

	if where == 'top'
		let tabwindows = reverse(tabwindows)
	endif

	for buf in tabwindows
		exe where . ' sbuffer ' . buf
	endfor

	exe 'tabclose ' . tabnr

	let &switchbuf = save_switchbuf
endfunction


" TabMoveToNext -- Move window to tab right of the current tab
"
" Usage:
"
" :TabMoveToNext
"
command! TabMoveToRight call s:TabMoveToRight()

function! s:TabMoveToRight()
    " There is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif

    " Preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')

    if tabpagenr() < tab_nr
        close!
        if l:tab_nr == tabpagenr('$')
            tabnext
        endif
        sp
    else
        close!
        tabnew
    endif

    " Opening current buffer in new window
    exe "b" . l:cur_buf
endfunc


" TabMoveToPrev -- Move window to tab left of the current tab
" Usage:
"
" :TabMoveToPrev
"
command! TabMoveToLeft :call s:TabMoveToLeft()

function! s:TabMoveToLeft()
    " There is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif

    " Preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')

    if tabpagenr() != 1
        close!
        if l:tab_nr == tabpagenr('$')
            tabprev
        endif
        sp
    else
        close!
        exe '0tabnew'
    endif

    " Opening current buffer in new window
    exe 'b' . l:cur_buf
endfunction


" Toggle tab - Display only focused window in another tab
"
" Usage:
"
" :TabToggle
"
command! TabToggle call s:TabToggle()

function! s:TabToggle()
    if tabpagewinnr(tabpagenr(), '$') > 1
        " Zoom in when this tab has more than one window
        tab split
        echo('Tab zoomed')
    elseif tabpagenr('$') > 1
        " Zoom out when this tab is not the last tab
        if tabpagenr() < tabpagenr('$')
            tabclose
            tabprevious
            echo('Tab toggled')
        else
            tabclose
            echo('Tab untoggled')
        endif
    endif
endfunction



" WhichTab - Return tab number for given name
"
" Usage:
"
" :call WhichTab('main.cpp')
"
function! WhichTab(filename)
    " Try to determine whether file is open in any tab.
    " Return number of tab it's open in
    let buffername = bufname(a:filename)
    if buffername == ''
        return 0
    endif
    let buffernumber = bufnr(buffername)

    " tabdo will loop through pages and leave you on the last one;
    " this is to make sure we don't leave the current page
    let currenttab = tabpagenr()
    let tab_arr = []
    tabdo let tab_arr += tabpagebuflist()

    " return to current page
    exec 'tabnext ' . currenttab

    " Start checking tab numbers for matches
    let i = 0
    for tnum in tab_arr
        let i += 1
        if tnum == buffernumber
            return i
        endif
    endfor

    return 0
endfunction
