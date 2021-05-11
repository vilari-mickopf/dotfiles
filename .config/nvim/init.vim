" GENERAL SETTINGS
    " Covers things like UI, colors, tabs, spaces...
    "
    " Set default clipboard to system clipboard
    set clipboard=unnamedplus

    " Show command on last line of the screen
    set showcmd

    " Used for line termination (not same in DOS and Unix, '\r\n' and '\n')
    set fileformat=unix

    " Enable UTF-8 encoding
    set encoding=utf-8

    " Give priority to local, project wire .vimrc files
    set exrc

    " Set relative line numbering
    set number relativenumber

    " Enable and set listchars
    set list

    " Set icons for tab and break
    " set listchars=tab:▸\ ,extends:❯,precedes:❮
    set listchars=tab:\ \ ,extends:,precedes:
    set showbreak=

    " Set positions for new splits
    set splitbelow splitright

    " Smart case sensitive search (if there is upper case in world you are
    " searching for, case sensitivity will be turned on)
    set ignorecase smartcase

    " Automatically indent when pressing <CR>
    set autoindent

    " Tab character is four spaces wide
    set tabstop=4 softtabstop=4 shiftwidth=4

    " Tab press will produce spaces instead of tab character
    set expandtab

    " Turn off backups
    set nobackup nowritebackup

    " Turn on undo files
    if !isdirectory("/tmp/.vim-undo")
        call mkdir("/tmp/.vim-undo", "", 0700)
    endif
    set undodir=/tmp/.vim-undo
    set undofile

    " Make backspace work like most other programs
    set backspace=2
    " set backspace=indent,eol,start

    " Disable lag when exiting insert mode
    set timeoutlen=1000 ttimeoutlen=0

    " Update time (used for gitgutter)
    set updatetime=100

    " Needed for lightline
    set laststatus=2

    " Disable showmode alltogether (used for echodoc)
    set noshowmode
    set completeopt-=preview

    " Conceal stuff used for neosnippet (overridden for markdown/pandoc stuff
    " in lang specific settings)
    set conceallevel=2 concealcursor=niv

    " Ignore paths (used for ctrlp)
    set wildignore+=*.so,*.a,*exe,*.swp
    set wildignore+=*/tmp/*,build/*,.objs/*,.ccls-cache/*
    set wildignore+=__pycache__/*,*.pyc,*.pyo,*.egg,*.egg-info
    set wildignore+=*.png,*.jpg,*.gif,*pdf,*svg
    set wildignore+=*.zip,*.7z,*.tar,*.tar.gz,*.tar.bz2
    set wildignore+=*.git,*.hg,*.svn,*.perforce

    " Text gets wrapped at column 80
    set textwidth=80

    " Make folding be based on indentations
    set foldmethod=indent

    " Fold python comments as well
    set foldignore=

    " Set function for generating folding string
    set foldlevelstart=0 foldtext=ProperTextFolding()
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

    " Don't resize on new splits
    set noequalalways

    " Include filepath in title of windows (needed for vim-autoswap)
    set title titlestring=

    " Turn on search highlighting
    set hlsearch

    " startofline
    set sol

    " traces like preview
    set inccommand=nosplit

    " Enable 24-bit color
    set termguicolors

    " Highlight cursor row
    set cursorline

    " Enable mouse mode (just in order to disable scroll properly)
    set mouse=a

    " Don't pass messages
    set shortmess+=c

    " Make comments italic, bc it's classy af
    highlight Comment cterm=italic

    " Add different color past column 80 to indicate line break overstepping
    let &colorcolumn=join(range(81, 999), ',')

    " No compatibility, because we're not in the stone age
    " (also needed for some plugins like vim-wiki, dein...)
    set nocompatible

    " viminfo file loc
    set viminfo+=n~/.cache/nvim/viminfo

    " Speed up startup
    let g:python_host_prog = '/bin/python2'
    let g:python3_host_prog = '/bin/python3'

    " Highlight embedded python code in vim
    let g:vimsyn_embed = 'lP'

    let g:script_dir = '~/.local/share/nvim/site/plugin/python/'

" PLUGINS
    " Use dein to install different plugins
    "
    " Add the dein installation directory into runtime path
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.cache/dein')
        call dein#begin('~/.cache/dein')

        " Plugin manager
            " dein -- Dark powered plugin manager
            call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

        " Theme and status line
            " onedark -- A dark color scheme inspired by theme for the Atom
            call dein#add('joshdick/onedark.vim')

            " lualine -- Configurable statusline
            call dein#add('hoob3rt/lualine.nvim')
            call dein#add('arkav/lualine-lsp-progress', {
                        \ 'depends': ['lualine.nvim']})

            " bufferline -- Configurable bufferlineline
            call dein#add('akinsho/nvim-bufferline.lua')
            call dein#add('nvim-lua/lsp-status.nvim')

        " Coding stuff
            " Auto-completion
                " deoplete -- Dark powered asynchronous completion
                call dein#add('Shougo/deoplete.nvim', {
                            \ 'hook_post_update': 'call dein#remote_plugins()',
                            \ 'lazy' : 1,
                            \ 'on_event': 'InsertEnter'})

                call dein#add('deoplete-plugins/deoplete-lsp', {
                            \ 'depends': 'deoplete.nvim',
                            \ 'on_event': 'InsertEnter'})

                " deoplete-terminal -- Terminal completion for deoplete.nvim
                call dein#add('Shougo/deoplete-terminal', {
                            \ 'depends': 'deoplete.nvim',
                            \ 'on_event': 'InsertEnter'})

                " neosnippet-snippets -- standard snippets for neosnippet
                call dein#add('Shougo/neosnippet-snippets', {
                            \ 'depends': 'deoplete.nvim',
                            \ 'on_event': 'InsertEnter'})

                " neosnippet -- Snippet support
                call dein#add('Shougo/neosnippet.vim', {
                            \ 'depends': ['deoplete.nvim', 'neosnippet-snippets'],
                            \ 'on_event': 'InsertEnter'})

            " echodoc -- Display function signatures on the fly
            call dein#add('Shougo/echodoc.vim')

            " lsp
                " lspconifg -- language server protocol
                call dein#add('neovim/nvim-lspconfig')

                " lsp-smag -- smart tags for lsp
                call dein#add('weilbith/nvim-lsp-smag')

            " symbols-outline -- lsp tagbar
            call dein#add('simrat39/symbols-outline.nvim')

            " vimspector -- Multi language graphical debugger
            call dein#add('puremourning/vimspector', {
                        \ 'on_cmd': 'VimspectorInstall',
                        \ 'on_map': '<Plug>Vimspector',
                        \ 'hook_post_update': 'VimspectorUpdate'})

            " fswitch -- Switching between .c and .h files
            call dein#add('derekwyatt/vim-fswitch', {
                        \ 'on_ft': ['c', 'cpp']})

            " Python
                " jedi -- Python doc and refactoring
                call dein#add('davidhalter/jedi-vim', {
                            \ 'on_ft': 'python'})

                " jupyter -- Jupyter console supports
                call dein#add('jupyter-vim/jupyter-vim', {
                            \ 'on_ft': 'python'})

                " python-pep8-indent -- Better python indentation
                call dein#add('Vimjas/vim-python-pep8-indent', {
                            \ 'on_ft': 'python'})

            " octave -- Octave/Matlab syntax
            call dein#add('jvirtanen/vim-octave', {
                        \ 'on_ft': 'matlab'})

            " Tex/Pandoc/Markdown/RMarkdown
                " vimwiki -- Notes/org-mode like
                call dein#add('vimwiki/vimwiki', {
                            \ 'on_cmd': 'VimwikiIndex'})

                " markdown-preview -- Preview markdown in browser
                call dein#add('iamcco/markdown-preview.nvim', {
                            \ 'build': 'cd app & yarn install',
                            \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmarkdown']})

                " pandoc -- Pandoc integration
                call dein#add('vim-pandoc/vim-pandoc', {
                            \ 'on_ft': ['markdown', 'pandoc.markdown','rmarkdown']})

                " pandoc-syntax -- Syntax for pandoc
                call dein#add('vim-pandoc/vim-pandoc-syntax', {
                            \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmarkdown']})

                " rmarkdown -- RMarkdown support
                call dein#add('vim-pandoc/vim-rmarkdown', {
                            \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmarkdown']})

                " table-mode -- Table mode
                call dein#add('dhruvasagar/vim-table-mode', {
                            \ 'on_ft': ['markdown', 'pandoc.markdown', 'markdown']})

            " MatchTagAlways -- Match html tags
            call dein#add('Valloric/MatchTagAlways', {
                        \ 'on_ft': ['html', 'xml', 'xhtml', 'jinja']})

            " Git
                " gitsigns -- Show git diff in gutter
                call dein#add('nvim-lua/plenary.nvim')
                call dein#add('lewis6991/gitsigns.nvim', {
                            \ 'depends': 'plenary.nvim'})
                call dein#add('lewis6991/foldsigns.nvim')

                " fugitive -- Git from vim
                call dein#add('tpope/vim-fugitive')

                " git-messenger -- reveal git message under the cursor
                call dein#add('rhysd/git-messenger.vim', {
                            \ 'on_cmd' : 'GitMessenger',
                            \ 'on_map' : '<Plug>(git-messenger'})

                " gv -- Commit search
                call dein#add('junegunn/gv.vim', {
                            \ 'depends': 'vim-fugitive'})

                " ConflictMotions -- Resolve conflict easier
                call dein#add('inkarkat/vim-CountJump')
                call dein#add('inkarkat/vim-ingo-library')
                call dein#add('inkarkat/vim-visualrepeat')
                call dein#add('inkarkat/vim-ConflictMotions', {
                            \ 'depends': ['vim-CountJump',
                                        \ 'vim-ingo-library',
                                        \ 'vim-visualrepeat']})

                " gist -- Share on gist
                call dein#add('mattn/webapi-vim')
                call dein#add('mattn/vim-gist', {
                            \ 'depends': 'webapi-vim'})

            " autoformat -- Auto format code
            call dein#add('Chiel92/vim-autoformat', {
                        \ 'on_cmd:': 'Autoformat'})

            " nerdcommenter - Toggling comments
            call dein#add('preservim/nerdcommenter', {
                        \ 'on_map': '<Plug>NERDCommenter'})

            " stackoverflow -- Ask stack overflow for help
            call dein#add('mickaobrien/vim-stackoverflow', {
                        \ 'on_cmd:': 'StackOverflow'})

        " Utilities
            " startify -- Fancy startup page
            call dein#add('mhinz/vim-startify')

            " startuptime -- Display startup time of each plugin
            call dein#add('dstein64/vim-startuptime', {
                        \ 'on_cmd:': 'StartupTime'})

            " ctrlp -- Fuzzy search engine
            call dein#add('junegunn/fzf', {
                        \ 'build': './install --all', 'merged': 0})
            call dein#add('junegunn/fzf.vim', {
                        \ 'depends': 'fzf'})
            call dein#add('ojroques/nvim-lspfuzzy', {
                        \ 'depends': ['fzf', 'fzf.vim']})

            " nvim-tree -- When ctrlp is not enough
            call dein#add('kyazdani42/nvim-tree.lua', {
                        \ 'on_cmd:': ['NvimTreeToggle', 'NvimTreeRefresh',
                                    \ 'NvimTreeFindFile']})

            " auto-pairs -- Auto pair parentheses and quotes
            call dein#add('jiangmiao/auto-pairs')

            " sandwich -- Surround like, but better
            call dein#add('machakann/vim-sandwich', {
                        \ 'on_map': ['<plug>(operator-sandwich-',
                                   \ '<plug>(textobj-sandwich-',
                                   \ '<plug>(sandwich-']})

            " schlepp -- Move a highlighted text around
            call dein#add('zirrostig/vim-schlepp', {
                        \ 'on_map': '<plug>Schlepp'})

            " exchange -- Easier word exchange
            call dein#add('tommcdo/vim-exchange', {
                        \ 'on_map': '<plug>(Exchange'})

            " visual-multi -- Multi cursor support
            call dein#add('mg979/vim-visual-multi')

            " easy-align -- easy align mode
            call dein#add('junegunn/vim-easy-align', {
                        \ 'on_map': ['<plug>(EasyAlign',
                                   \ '<plug>(LiveEasyAlign']})

            " switch -- Substitute word under the cursor
            call dein#add('AndrewRadev/switch.vim', {
                        \ 'on_map': '<plug>Switc'})

            " yankstack -- Cycle through yank stack
            call dein#add('maxbrunsfeld/vim-yankstack')

            " repeat -- Dot (.) command for non-native commads
            call dein#add('tpope/vim-repeat')

            " indentLine -- Show indentation
            call dein#add('Yggdroot/indentLine', {
                        \ 'on_cmd': 'IndentLinesToggle'})

            " signature - Show marks
            call dein#add('kshenoy/vim-signature')

            " template -- Template files
            call dein#add('aperezdc/vim-template')

            " autoswap -- Switch to the correct window if file is already opened
            call dein#add('gioele/vim-autoswap')

            " lastplace -- Open files at last edit position
            call dein#add('farmergreg/vim-lastplace')

            " goyo -- Put page on center, nice when reading stuff
            call dein#add('junegunn/goyo.vim', {
                        \ 'on_cmd': 'Goyo'})

            " suda -- Sudo write
            call dein#add('lambdalisue/suda.vim')

            " easymotion -- Easier navigation
            call dein#add('easymotion/vim-easymotion', {
                        \ 'on_map': '<Plug>(easymotion-'})

            " asterisk -- proper */# commands
            call dein#add('haya14busa/vim-asterisk', {
                        \ 'on_map': '<Plug>(asterisk-'})

            " comfortable-motion -- Smooth scrolling
            call dein#add('yuttie/comfortable-motion.vim')

            " open-browser -- Open link under cursor in browser
            call dein#add('tyru/open-browser.vim')

            " any-jump -- grep in project
            call dein#add('pechorin/any-jump.vim', {
                        \ 'on_cmd:': ['AnyJump',
                                    \ 'AnyJumpVisual',
                                    \ 'AnyJumpUserArg']})

            " undotree -- visualize undo history
            call dein#add('mbbill/undotree', {
                        \ 'on_cmd:': 'UndotreeToggle'})

            " firenvim -- Use nvim in browser
            call dein#add('glacambre/firenvim', {
                        \ 'hook_post_update': 'call firenvim#install(0)'})

        " Highlights and sytnax
            " hexokinase -- color hex codes
            call dein#add('rrethy/vim-hexokinase', {
                        \ 'build': 'make hexokinase'})

            " CursorLineCurrentWindow -- Show cursor line only on focused window
            call dein#add('vim-scripts/CursorLineCurrentWindow')

            " search-pulse -- Pulse on search
            call dein#add('inside/vim-search-pulse')

            " hlslens -- show search count
            call dein#add('kevinhwang91/nvim-hlslens')

            " conflict-marker -- Highlight conflict sections
            call dein#add('rhysd/conflict-marker.vim')

            " i3-vim-syntax -- Syntax for i3 config
            call dein#add('PotatoesMaster/i3-vim-syntax', {
                        \ 'on_ft': 'i3'})

            " Tree-sitter stuff
                " treesitter -- Highlighting
                call dein#add('nvim-treesitter/nvim-treesitter')

                " treesitter-context
                call dein#add('romgrk/nvim-treesitter-context', {
                            \ 'depends': 'nvim-treesitter'})

                " treesitter-refactor -- Refactor modules for nvim-treesitter
                call dein#add('nvim-treesitter/nvim-treesitter-refactor', {
                            \ 'depends': 'nvim-treesitter'})

                " treesitter-textobjects -- textobjects using treesitter queries
                call dein#add('nvim-treesitter/nvim-treesitter-textobjects', {
                            \ 'depends': 'nvim-treesitter'})

        call dein#end()
        call dein#save_state()
    endif
    filetype plugin indent on
    syntax enable

" PLUGIN CONFIGURATION
    " Configure all installed plugins
    "
    " Plugin manager
        " dein -- Dark powered plugin manager
            command! DeinUpdate call dein#update()

            " Install plugins
            command! DeinInstall call DeinInstall()
            function! DeinInstall()
                if dein#check_install()
                    call dein#install()
                else
                    echo 'All plugins are already installed.'
                endif
            endfunction

            " Delete unused plugins
            command! DeinClean call DeinClean()
            function! DeinClean()
                call map(dein#check_clean(), "delete(v:val, 'rf')")
                call dein#recache_runtimepath()
                echo 'Done.'
            endfunction

    " Theme and status line
        " onedark -- A dark color scheme inspired by theme for the Atom
            silent! colorscheme onedark
            let s:colors = exists("*onedark#GetColors") ? onedark#GetColors() : {}
            if s:colors == {} | finish | endif

        " lualine/bufferline
            lua require('config-line')

    " Coding stuff
        " Auto-completion
            " deoplete -- Dark powered asynchronous completion
                " Init on hook
                call dein#set_hook('deoplete.nvim', 'hook_source', 'call DeopleteInit()')
                function! DeopleteInit()
                    let g:deoplete#enable_at_startup = 1

                    " deoplete-terminal
                    call deoplete#custom#var('terminal', 'require_same_tab', v:false)
                    call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

                    " lsp
                    let g:deoplete#lsp#handler_enabled = 1

                    " Debug mode
                    " let g:deoplete#enable_debug = 1
                endfunction

            " neosnippet -- Snippet support
                let g:neosnippet#enable_completed_snippet = 1
                let g:neosnippet#enable_complete_done = 1
                let g:neosnippet#enable_auto_clear_markers = 1

        " echodoc -- Display function signatures on the fly
            " Enable at start
            let g:echodoc_enable_at_startup = 1

        " lspconfig
            exe 'hi LspDiagnosticsDefaultHint guibg=' . s:colors.black.gui
            exe 'hi LspDiagnosticsDefaultHint guifg=' . s:colors.cyan.gui
            exe 'hi LspDiagnosticsUnderlineHint guifg=None'

            sign define LspDiagnosticsSignError text=>>
                                              \ texthl=LspDiagnosticsSignError
                                              \ linehl= numhl=

            sign define LspDiagnosticsSignWarning text=>>
                                                \ texthl=LspDiagnosticsSignWarning
                                                \ linehl= numhl=

            sign define LspDiagnosticsSignInformation text=>>
                                                    \ texthl=LspDiagnosticsSignInformation
                                                    \ linehl= numhl=

            sign define LspDiagnosticsSignHint text=>>
                                             \ texthl=LspDiagnosticsSignHint
                                             \ linehl= numhl=

            lua require('config-lsp')

        " symbols-outlne
            exe 'hi FocusedSymbol guibg=' . s:colors.visual_grey.gui
            lua require('symbols-outline').setup(opts)

        " vimspector
            let g:vimspector_enable_mappings = ''

            let g:vimspector_code_minwidth = 90
            let g:vimspector_terminal_maxwidth = 75
            let g:vimspector_terminal_minwidth = 40

            " let g:vimspector_sidebar_width = 40
            let g:vimspector_bottombar_height = 10

            function! VimspectorInputWatchVaiable(type)
                if a:type == 'input'
                    " Get variable
                    let l:var = PromptGetUserInput('Watch: ', 'customlist,CompleteWords')
                    if empty(l:var) | return | endif
                elseif a:type == 'cursor'
                    let l:var = expand('<cword>')
                endif

                exe 'VimspectorWatch ' . l:var
            endfunction

            function! VimspectorInputBreakpointCondition()
                " Get variable
                let l:condition = PromptGetUserInput('Condition: ', 'customlist,CompleteWords')
                if empty(l:condition) | return | endif
                let l:condition = expand('<cword>')

                exe "call vimspector#ToggleBreakpoint({'condition': '" . l:condition . "'}) "
            endfunction

            exe 'hi BreakSign guifg=' . s:colors.red.gui . ' ' . ' gui=bold'
            exe 'hi DebugSign guifg=' . s:colors.purple.gui . ' ' . ' gui=bold'
            " exe 'hi DebugLine guibg=' . s:colors.visual_grey.gui . ' ' . ' gui=bold'
            exe 'hi DebugLine gui=bold'

            sign define vimspectorBP         text=●  texthl=BreakSign
            sign define vimspectorBPCond     text=  texthl=BreakSign
            sign define vimspectorBPDisabled text=●  texthl=LineNr
            sign define vimspectorPC         text=-> texthl=DebugSign linehl=DebugLine
            sign define vimspectorPCBP       text=-> texthl=DebugSign linehl=DebugLine

            function! VimspectorOptions() abort
                call win_gotoid( g:vimspector_session_windows.watches )
                nnoremap <buffer> <space> <Nop>

                call win_gotoid( g:vimspector_session_windows.variables )
                nnoremap <buffer> <space> <Nop>

                call win_gotoid( g:vimspector_session_windows.stack_trace )
                nnoremap <buffer> <space> <Nop>
            endfunction

        " Python
            " jedi -- Python doc and refactoring
                " Disable configuration
                " let g:jedi#auto_vim_configuration = 0

                " Disable completion
                let g:jedi#completions_enabled = 0
                " let g:jedi#show_call_signatures = "1"

                " Disable everything else
                let g:jedi#goto_command = ''
                let g:jedi#goto_assignments_command = ''
                let g:jedi#goto_stubs_command = ''
                let g:jedi#goto_definitions_command = ''
                let g:jedi#usages_command = ''
                let g:jedi#completions_command = ''

            " jupyter -- Jupyter console supports
                " Set kernel
                let b:jupyter_kernel_type = 'python'

                " Automatically update pseudo console
                let g:jupyter_monitor_console = 1

                " Echo msgs sent from vim
                let g:jupyter_verbose = 1

                " Disable default keys
                let g:jupyter_mapkey = 0

                command! JupyterCustomOpen call s:JupyterCustomOpen('console')
                command! JupyterCustomQtOpen call s:JupyterCustomOpen('qtconsole')
                function! s:JupyterCustomOpen(type)
                    let bytecode = system('screen -A -m -d -S jupyter_session jupyter ' . a:type)
                    let g:jupyter_mode = 1
                    JupyterConnect
                endfunction

                " Run file in Jupyter
                command! JupyterCustomRun call s:JupyterCustomRun()
                function! s:JupyterCustomRun()
                    if !exists('g:jupyter_mode')
                        " call s:JupyterCustomOpen()
                        call EchoWarning('Jupyter not started')
                        return
                    endif

                    JupyterRunFile

                    if !(bufwinnr('__jupyter_term__') > 0)
                        JupyterRunFile
                        exe "norm \<C-w>\<C-k>"
                        redraw!
                    else
                        JupyterRunFile
                    endif
                endfunction

                " Run cell in Jupyter
                command! JupyterCustomSendCell call s:JupyterCustomSendCell()
                function! s:JupyterCustomSendCell()
                    if !exists('g:jupyter_mode')
                        " call s:JupyterCustomOpen()
                        call EchoWarning('Jupyter not started')
                        return
                    endif

                    if !(bufwinnr('__jupyter_term__') > 0)
                        JupyterSendCell
                        exe "norm \<C-w>\<C-k>"
                        redraw!
                    else
                        JupyterSendCell
                    endif
                endfunction

                " Run line in Jupyter
                command! JupyterCustomSendRange call s:JupyterCustomSendRange()
                function! s:JupyterCustomSendRange()
                    if !exists('g:jupyter_mode')
                        " call s:JupyterCustomOpen()
                        call EchoWarning('Jupyter not started')
                        return
                    endif

                    if !(bufwinnr('__jupyter_term__') > 0)
                        JupyterSendRange
                        call Reduce()
                        exe "norm \<C-w>\<C-k>"
                        redraw!
                    else
                        JupyterSendRange
                    endif
                endfunction

                command! JupyterCustomOpenBuffer call s:JupyterCustomOpenBuffer()
                function! s:JupyterCustomOpenBuffer()
                    if !exists('g:jupyter_mode')
                        " call s:JupyterCustomOpen()
                        call EchoWarning('Jupyter not started')
                        return
                    endif

                    execute 'split | buffer' . jupyter#monitor_console#OpenJupyterTerm()
                endfunction

                " Run range in Jupyter
                command! JupyterCustomSendRangeVisual call s:JupyterCustomSendRangeVisual()
                function! s:JupyterCustomSendRangeVisual()
                    if !exists('g:jupyter_mode')
                        " call s:JupyterCustomOpen()
                        call EchoWarning('Jupyter not started')
                        return
                    endif

                    if !(bufwinnr('__jupyter_term__') > 0)
                        " JupyterSendRange
                        exe "normal gv\"zy"
                        JupyterSendCode(@z)

                        call Reduce()
                        exe "norm \<C-w>\<C-k>"
                        redraw!
                    else
                        " JupyterSendRange
                        exe "normal gv\"zy"
                        JupyterSendCode(@z)
                        redraw!
                    endif
                endfunction

                " Terminate Jupyter
                command! JupyterCustomTerminate call s:JupyterCustomTerminate()
                function! s:JupyterCustomTerminate()
                    if exists('g:jupyter_mode')
                        JupyterTerminateKernel
                        let bytecode = system('screen -X -S jupyter_session quit')
                        unlet g:jupyter_mode
                    endif

                    let ret = system("kill $(screen -ls | grep jupyter_session | cut -f1 -d'.')")
                endfunction

        " Tex/Pandoc/Markdown/RMarkdown
            " vimwiki -- Notes/org-mode like
                " Wiki files location
                let g:vimwiki_list = [{'path': '~/Documents/vimwiki',
                                     \ 'syntax': 'markdown'}]

                " Use vim wiki for .md files, because of great syntax support
                let g:vimwiki_ext2syntax = {
                    \ '.md' : 'markdown',
                    \ '.mdown' : 'markdown',
                    \ '.markdown' : 'markdown'
                    \ }

            " vimtex -- Plugin for improved LaTeX
                " interpret .tex files as latex
                let g:tex_flavor = 'latex'

                " Disable maps
                let g:vimtex_mappings_enable = 0

            " markdown-preview -- Preview markdown in browser
                let g:mkdp_auto_start = 0
                let g:mkdp_auto_close = 1
                let g:mkdp_command_for_global = 1

            " pandoc -- Pandoc integration
                 let g:pandoc#folding#fdc = 0
                 let g:pandoc#keyboard#use_default_mappings = 0
                 let g:pandoc#filetypes#handled = ['pandoc', 'markdown']
                 let g:pandoc#filetypes#pandoc_markdown = 0
                 " let g:pandoc#command#prefer_pdf
                 let g:pandoc#toc#close_after_navigating = 0
                 let g:pandoc#spell#enabled = 0

        " Git
            " gitsigns -- Show git diff in gutter
                lua require('config-gitsigns')
                lua require('foldsigns').setup()

            " ConflictMotions -- Resolve conflict easier
                " Disable mappings
                let g:ConflictMotions_TakeMappingPrefix = ''

            " gist -- Share on gist
                " Private only
                let g:gist_post_private = 1

                " Open in browser
                " let g:gist_open_browser_after_post = 1

        " NERDCommenter
            " Add spaces after comment delimiters by default
            let g:NERDSpaceDelims = 1

            " Use compact syntax for prettified multi-line comments
            let g:NERDCompactSexyComs = 1

            " Remove alternative comment when uncommenting
            let g:NERDRemoveAltComs = 1

            " Disable maps
            let g:NERDCreateDefaultMappings = 0

    " Utilities
        " startify -- Fancy startup page
            " Disable header
            let g:startify_custom_header = []

        " fzf -- Fuzzy search engine
            exe 'hi FzfBorder guifg=' . s:colors.black.gui
            let g:fzf_colors = {'border':  ['fg', 'FzfBorder']}

            let g:fzf_layout = { 'down': '40%' }

            lua require('lspfuzzy').setup{  methods = 'all'}

        " nvim-tree -- When ctrlp is not enough
            exe 'hi NvimTreeFolderIcon guifg=' . s:colors.blue.gui
            exe 'hi NvimTreeGitDirty guifg=' . s:colors.green.gui
            exe 'hi NvimTreeGitNew guifg=' . s:colors.green.gui
            exe 'hi NvimTreeGitStaged guifg=' . s:colors.cyan.gui
            exe 'hi NvimTreeGitMerge guifg=' . s:colors.red.gui
            exe 'hi NvimTreeGitDeleted guifg=' . s:colors.dark_red.gui
            exe 'hi NvimTreeGitRenamed guifg=' . s:colors.yellow.gui
            exe 'hi NvimTreeSpecialFile guifg=' s:colors.white.gui

            let g:nvim_tree_disable_keybindings = 0
            let g:nvim_tree_auto_open = 1
            let g:nvim_tree_width = 40
            let g:nvim_tree_gitignore = 1
            let g:nvim_tree_indent_markers = 1
            let g:nvim_tree_hide_dotfiles = 1
            let g:nvim_tree_git_hl = 1
            let g:nvim_tree_tab_open = 0
            let g:nvim_tree_width_allow_resize = 0
            let g:nvim_tree_auto_close = 1
            let g:nvim_tree_lsp_diagnostics = 1
            let g:nvim_tree_auto_ignore_ft = ['startify']
            let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1}
            let g:nvim_tree_git_hl = ''
            let g:nvim_tree_icons = {
                \ 'default': '',
                \ 'symlink': '',
                \ 'git': {
                    \ 'unstaged': "",
                    \ 'staged': "",
                    \ 'unmerged': "",
                    \ 'renamed': "",
                    \ 'untracked': "",
                    \ 'deleted': "",
                    \ 'ignored': ""},
                \ 'folder': {
                    \ 'default': "",
                    \ 'open': "",
                    \ 'empty': "",
                    \ 'empty_open': "",
                    \ 'symlink': "",
                    \ 'symlink_open': ""},
                \ 'lsp': {
                    \ 'hint': "",
                    \ 'info': "",
                    \ 'warning': "",
                    \ 'error': ""}
                \ }

        " auto-pairs -- Auto pair parentheses and quotes
            " Disable multiline pairs
            let g:AutoPairsMultilineClose = 0

        " schlepp -- Move a highlighted text around
            let g:Schlepp#allowSquishingLines = 1
            let g:Schlepp#allowSquishingBlock = 1

        " exchange -- Easier word exchange
            " Disable mappings
            let g:exchange_no_mappings=1

        " visual-multi -- Multi cursor support
            let g:VM_theme = 'nord'

            let g:VM_default_mappings = 0
            let g:VM_mouse_mappings = 0

        " switch -- Substitute word under the cursor
            " Disable default mappings
            let g:switch_mapping = ''

            " General definitions
            let g:switch_custom_definitions = [
                \ ['true', 'false'],
                \ ['on', 'off'],
                \ ['yes', 'no'],
                \ ['get', 'set'],
                \ ['enable', 'disable'],
                \ ['black', 'red', 'yellow', 'green', 'blue', 'magenta',
                \  'cyan', 'white'],
                \ ['zero', 'one', 'two', 'three', 'four', 'five', 'six',
                \  'seven', 'eight', 'nine', 'ten'],
                \ ['sunday', 'monday', 'tuesday', 'wensday', 'thursday',
                \  'friday', 'saturday'],
                \ ['sun', 'mon', 'tue', 'wen', 'thu', 'fri', 'sat'],
                \ ['return', 'break', 'continue' ]]

            function! SwitchCustomForward()
                if !switch#Switch()
                    exe "norm! " . v:count1 . "\<C-A>"
                endif
                echo
            endfunction

            function! SwitchCustomBackward()
                if !switch#Switch({'reverse': 1})
                    exe "norm! " . v:count1 . "\<C-X>"
                endif
                echo
            endfunction

            " Language specific definitions
                " Python
                let g:python_switch_custom_definitions = [['elif, else']]

                " C/C++
                let g:cpp_switch_custom_definitions = [['else if, else']]

            let g:camelcase_switch_definitions = [{
                \ '\<[a-z0-9]\+_\k\+\>': {'_\(.\)': '\U\1'},
                \ '\<[a-z0-9]\+[A-Z]\k\+\>': {'\([A-Z]\)': '_\l\1'},
                \ }]

        " yankstack -- Cycle through yank stack
            " Disable default mappings
            let g:yankstack_map_keys = 0
            call yankstack#setup()

        " sandwich
            let g:sandwich_no_default_key_mappings = 1
            let g:operator_sandwich_no_default_key_mappings = 1
            let g:textobj_sandwich_no_default_key_mappings = 1

        " indentLine -- Show indentation
            let g:indentLine_enabled = 0
            let g:indentLine_color_gui = s:colors.comment_grey.gui
            let g:indentLine_char = '▏'

        " signature - Show marks
            exe 'hi SignatureMarkText guifg=' . s:colors.dark_yellow.gui
            let g:SignatureForceRemoveGlobal = 1

        " template -- Template files
            let g:templates_directory = '~/.local/share/nvim/site/templates'

            " Template if file is empty
            function! TemplateEmptyFile()
                let l:content = getline(0,line('$'))
                let l:result = 1

                for l:temp in l:content
                    if strlen(l:temp) > 0
                        let l:result = 1
                        break
                    endif
                endfor

                if l:result == 0
                    let l:extension = expand('%:c')
                    " exec 'Template .' . l:extension
                    TemplateHere
                endif
            endfunction

        " suda -- Sudo write
            " Automatically ask for pass when saving RO file
            let g:suda_smart_edit = 1

        " easymotion -- Easier navigation
            " Disable default mappings
            let g:EasyMotion_do_mapping = 0

        " OpenBrowser
            command! OpenBrowserUnderCursor exe 'OpenBrowser ' . expand("<cWORD>")

        " comfortable-motion -- Smooth scrolling
            " Disable mappings
            let g:comfortable_motion_no_default_key_mappings = 1
            let g:comfortable_motion_interval = 1000.0/60

            " Find impulse for given amount of lines
            function! ComforableMotionFindImpulse(diff)
                let l:X = pow(abs(a:diff), 0.5)
                let l:impulse = 0.7642497185838693
                             \ +11.916201835589376*l:X
                             \  +1.4842847475051253*(pow(l:X, 2))
                             \  +0.01733669295908215*(pow(l:X, 3))
                             \  -0.00034498320824916107*(pow(l:X, 4))
                             \  +2.941264385825093e-06*(pow(l:X, 5))
                return l:impulse
            endfunction

            " Comforable-motion equivalent to zz
            function! ComforableMotionCenter(...)
                " Save original cursor position
                let s:orig_line = line('.')
                let s:orig_curs = col('.')

                " Count visble difference to top
                let s:abs_top = line('w0')
                let s:vis_top_diff = 0
                while line('.') > s:abs_top
                    normal 1k
                    let s:vis_top_diff += 1
                endwhile

                let s:vis_center = round(winheight('.')/2)
                if ((winheight('.') % 2) + 2) % 2 == 0
                    let s:vis_center = s:vis_center - 1
                endif
                let s:vis_center_diff = s:vis_top_diff - s:vis_center

                " Restore original cursor position
                call cursor(s:orig_line, s:orig_curs)

                if s:vis_center_diff == 0
                    return
                endif

                if (a:0 > 0 && ((a:1 == 'up' && s:vis_center_diff >= 0) ||
                              \ (a:1 == 'down' && s:vis_center_diff <= 0)))
                    return
                endif

                let l:impulse = ComforableMotionFindImpulse(s:vis_center_diff)
                call comfortable_motion#flick(s:vis_center_diff/abs(s:vis_center_diff)*l:impulse)
            endfunction

            " Comforable-motion equivalent to zt
            function! ComforableMotionTop()
                let s:curLine = line('.')
                let s:curCurs = col('.')
                let s:absTop =  line('w0')
                let s:visTopDif = 0

                while line('.') > s:absTop
                    normal 1k
                    let s:visTopDif = s:visTopDif + 1
                endwhile

                let l:impulse = ComforableMotionFindImpulse(s:visTopDif)
                call comfortable_motion#flick(l:impulse)
                call cursor(s:curLine, s:curCurs)
            endfunction

            " Comforable-motion equivalent to zb
            function! ComforableMotionBottom()
                let s:curLine = line('.')
                let s:curCurs = col('.')
                let s:absTop =  line('w0')
                let s:visTopDif = 0

                " counts difference to top
                while line('.') > s:absTop
                    normal 1k
                    let s:visTopDif = (s:visTopDif + 1)
                endwhile

                let s:visBotDif = winheight('.') - s:visTopDif
                let l:impulse = ComforableMotionFindImpulse(s:visBotDif - 1)
                call comfortable_motion#flick(-l:impulse)
                call cursor(s:curLine, s:curCurs)
            endfunction

            " Comforable-motion equivalent to zb
            function! ComforableMotionPage(direction, ...)
                let l:scale = 1
                if a:0 > 0
                    let l:scale = a:1
                endif

                let l:impulse = ComforableMotionFindImpulse(l:scale*(winheight('.') - 1))
                if a:direction == 'up'
                    call comfortable_motion#flick(-l:impulse)
                elseif a:direction == 'down'
                    call comfortable_motion#flick(l:impulse)
                endif
            endfunction

        " any-jump -- grep in project
            let g:any_jump_disable_default_keybindings = 1
            let g:any_jump_ignored_files = [ &wildignore ]

            " Get argument with completion
            function! AnyJumpUserArg()
                let l:arg = PromptGetUserInput('Find: ', 'customlist,CompleteWords')
                if empty(l:arg) | return | endif
                exe 'AnyJumpArg '. l:arg
            endfunction

        " Firenvim
            let g:firenvim_config = {
                \ 'globalSettings': {
                    \ 'alt': 'all' },
                \ 'localSettings': {
                    \ '.*': {
                        \ 'priority': 0,
                        \ 'takeover': 'always' },
                    \ }
                \ }

            let fc = g:firenvim_config['localSettings']
            " Block sites
            let fc['https?://[^/]*facebook.com/*'] = { 'takeover': 'never', 'priority': 1 }
            let fc['https?://[^/]*translate.google.com/*'] = { 'takeover': 'never', 'priority': 1 }
            let fc['https?://[^/]*linkedin..com/*'] = { 'takeover': 'never', 'priority': 1 }
            " Target areas
            let fc['.*'] = { 'selector': 'textarea:not([readonly]), div[role="textbox"]' }

            " Check firenvim
            function! s:IsFirenvimActive(event) abort
                if !exists('*nvim_get_chan_info')
                    return 0
                endif
                let l:ui = nvim_get_chan_info(a:event.chan)
                return has_key(l:ui, 'client') &&
                    \ has_key(l:ui.client, 'name') &&
                    \ l:ui.client.name =~? 'Firenvim'
            endfunction

            " Firenvim init
            function! FirenvimOptions(event) abort
                if s:IsFirenvimActive(a:event)
                    set laststatus=0
                    set guifont=UbuntuMono:h12

                    " Disable wrap
                    set formatoptions-=t
                    set formatoptions+=c
                endif
            endfunction

    " Themes and colors
        " on_yank
            exe 'hi HighlightOnYank guibg=' . s:colors.visual_grey.gui

        " hexokinase
            let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'

        " conflict-marker -- Highlight conflict sections
            let g:conflict_marker_highlight_group = ''

            let s:conflict_color_ours = '#2B3840'
            let s:conflict_color_theirs = '#35374A'
            exe 'hi ConflictMarkerBegin guibg=' . s:conflict_color_ours
            exe 'hi ConflictMarkerOurs guibg=' . s:conflict_color_ours
            exe 'hi ConflictMarkerTheirs guibg=' . s:conflict_color_theirs
            exe 'hi ConflictMarkerEnd guibg=' . s:conflict_color_theirs
            exe 'hi ConflictMarkerCommonAncestorsHunk guibg=' . s:conflict_color_theirs

            let g:conflict_marker_enable_mappings = 0
            let g:conflict_marker_enable_matchit = 0

        " search-pulse -- Pulse on search
            let g:vim_search_pulse_disable_auto_mappings = 1

            let g:vim_search_pulse_color_list = [
                \ '#2B2F38', '#3E4452', s:colors.visual_grey.gui, '#515A6B', '#656F85']

        " nvim-treesitter
            set foldexpr=nvim_treesitter#foldexpr()

            "Syntax/parser errors
            exe 'hi TSError guifg=' . s:colors.red.gui

            " Delimiters ie: `.`
            exe 'hi TSPunctDelimiter guifg=' . s:colors.white.gui

            " Brackets and parens
            exe 'hi TSPunctBracket guifg=' . s:colors.white.gui

            " For special punctutation that does not fall in the catagories
            " before
            exe 'hi TSPunctSpecial guifg=' . s:colors.purple.gui

            " Tags like html tag names
            exe 'hi TSTag guifg=' . s:colors.cyan.gui

            " Tag delimiter like `<` `>` `/`
            exe 'hi TSTagDelimiter guifg=' . s:colors.dark_red.gui

            " For constants
            exe 'hi TSConstant guifg=' . s:colors.dark_yellow.gui

            " For constant that are built in the language: `nil` in Lua
            exe 'hi TSConstBuiltin guifg=' . s:colors.dark_yellow.gui

            " For constants that are defined by macros: `NULL` in C
            exe 'hi TSConstMacro guifg=' . s:colors.purple.gui

            " For strings
            exe 'hi TSString guifg=' . s:colors.green.gui

            " For regexes
            exe 'hi TSStringRegex guifg=' . s:colors.cyan.gui

            " For escape characters within a string
            exe 'hi TSStringEscape guifg=' . s:colors.blue.gui

            " For characters
            exe 'hi TSCharacter guifg=' . s:colors.dark_yellow.gui

            " For integers
            exe 'hi TSNumber guifg=' . s:colors.dark_yellow.gui

            " For booleans
            exe 'hi TSBoolean guifg=' . s:colors.dark_yellow.gui

            " TSFloat
            exe 'hi TSFloat guifg=' . s:colors.dark_yellow.gui

            " For function (calls and definitions)
            exe 'hi TSFunction guifg=' . s:colors.blue.gui

            " For builtin functions: `table.insert` in Lua
            exe 'hi TSFuncBuiltin guifg=' . s:colors.purple.gui

            " For macro defined fuctions (calls and definitions): each
            " `macro_rules` in Rust
            exe 'hi TSFuncMacro guifg=' . s:colors.purple.gui

            " For references to parameters of a function
            exe 'hi TSParameterReference guifg=' . s:colors.purple.gui

            " For parameters of a function
            exe 'hi TSParameter guifg=' . s:colors.yellow.gui

            " For method calls and definitions
            exe 'hi TSMethod guifg=' . s:colors.blue.gui

            " For fields
            exe 'hi TSField guifg=' . s:colors.white.gui

            " Same as `TSField`
            exe 'hi TSProperty guifg=' . s:colors.blue.gui

            " For constructor calls and definitions: `{}` in Lua, and Java
            " constructors
            exe 'hi TSConstructor guifg=' . s:colors.blue.gui

            " For keywords related to conditionnals
            exe 'hi TSConditional guifg=' . s:colors.purple.gui

            " For keywords related to loops
            exe 'hi TSRepeat guifg=' . s:colors.purple.gui

            " For labels: `label:` in C and `:label:` in Lua
            exe 'hi TSLabel guifg=' . s:colors.purple.gui

            " For any operator: `+`, but also `->` and `*` in C
            exe 'hi TSOperator guifg=' . s:colors.purple.gui

            " For keywords that don't fall in previous categories
            exe 'hi TSKeyword guifg=' . s:colors.purple.gui

            " For keywords used to define a fuction
            exe 'hi TSKeywordFunction guifg=' . s:colors.blue.gui

            " For exception related keywords
            exe 'hi TSException guifg=' . s:colors.purple.gui

            " For types
            exe 'hi TSType guifg=' . s:colors.yellow.gui

            " For builtin types (you guessed it, right ?)
            exe 'hi TSTypeBuiltin guifg=' . s:colors.yellow.gui

            " For identifiers referring to modules and namespaces
            exe 'hi TSNamespace guifg=' . s:colors.cyan.gui

            " None
            exe 'hi TSNone guifg=' . s:colors.dark_yellow.gui

            " For includes: `#include` in C, `use` or `extern crate` in
            " Rust, or `require` in Lua
            exe 'hi TSInclude guifg=' . s:colors.purple.gui

            " For C++/Dart attributes, annotations that can be attached to
            " the code to denote some kind of meta information
            exe 'hi TSAnnotation guifg=' . s:colors.cyan.gui

            " For comment blocks
            exe 'hi TSComment guifg=' . s:colors.comment_grey.gui

            " For strings considered text in a markup language
            exe 'hi TSText guifg=' . s:colors.white.gui

            " For text to be represented with strong
            exe 'hi TSStrong guifg=' . s:colors.white.gui

            " For text to be represented with emphasis
            exe 'hi TSEmphasis guifg=' . s:colors.dark_yellow.gui

            " For text to be represented with an underline
            exe 'hi TSUnderline guifg=' . s:colors.white.gui

            " Text that is part of a title
            exe 'hi TSTitle guifg=' . s:colors.purple.gui

            " Literal text
            exe 'hi TSLiteral guifg=' . s:colors.green.gui

            " Any URI like a link or email
            exe 'hi TSURI guifg=' . s:colors.blue.gui

            " Any variable name that does not have another highlight
            exe 'hi TSVariable guifg=' . s:colors.white.gui

            " Variable names that are defined by the languages, like
            " `this` or `self`
            exe 'hi TSVariableBuiltin guifg=' . s:colors.purple.gui

            " Refactor
                " Used by refactor.highlight_definitions to highlight the
                " definition of the symbol under the cursor
                exe 'hi TSDefinition guifg=' . s:colors.yellow.gui
                ". ' gui=underline'
                " Used by refactor.highlight_definitions to highlight usages
                " of the symbol under the cursor
                exe 'hi TSDefinitionUsage guibg=' . s:colors.visual_grey.gui

                " Used by refactor.highlight_current_scope to highlight the
                " current scope
                exe 'hi TSCurrentScope guibg=' . s:colors.visual_grey.gui

            lua require('config-treesitter')
