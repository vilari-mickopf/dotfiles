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

    " Don't resize on new splits
    set noequalalways

    " Include filepath in title of windows (needed for vim-autoswap)
    set title titlestring=

    " Turn on search highlighting
    set hlsearch

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

            " lightline -- A light and configurable statusline/tabline
            call dein#add('itchyny/vim-gitbranch')
            call dein#add('itchyny/lightline.vim')

        " Coding stuff
            " Auto-completion
                " deoplete -- Dark powered asynchronous completion
                " UpdateRemotePlugins
                call dein#add('Shougo/deoplete.nvim', {
                             \'hook_post_update': 'call dein#remote_plugins()',
                             \'lazy' : 1,
                             \'on_event': 'InsertEnter'})

                " deoplete-jedi -- Deoplete source for jedi(python)
                call dein#add('deoplete-plugins/deoplete-jedi', {
                             \'build': 'git submodule update --init',
                             \'depends': 'deoplete.nvim',
                             \'on_ft': 'python'})

                " deoplete-terminal -- Terminal completion for deoplete.nvim
                call dein#add('Shougo/deoplete-terminal', {
                             \'depends': 'deoplete.nvim',
                             \'on_event': 'InsertEnter'})

                " neosnippet-snippets -- standard snippets for neosnippet
                call dein#add('Shougo/neosnippet-snippets', {
                             \'depends': 'deoplete.nvim',
                             \'on_event': 'InsertEnter'})

                " neosnippet -- Snippet support
                call dein#add('Shougo/neosnippet.vim', {
                             \'depends': ['deoplete.nvim', 'neosnippet-snippets'],
                             \'on_event': 'InsertEnter'})

            " echodoc -- Display function signatures on the fly
            call dein#add('Shougo/echodoc.vim', {
                         \'on_ft': ['c', 'cpp', 'python']})

            " ale -- Asynchronous lint engine
            call dein#add('w0rp/ale', {
                         \'on_ft': ['c', 'cpp', 'python', 'bash', 'tex',
                                   \'markdown', 'r', 'vim']})

            " vimspector -- Multi language graphical debugger
            call dein#add('puremourning/vimspector', {
                         \'on_cmd': 'VimspectorInstall',
                         \'hook_post_update': 'VimspectorUpdate'})

            " fswitch -- Switching between .c and .h files
            call dein#add('derekwyatt/vim-fswitch', {
                         \'on_ft': ['c', 'cpp']})

            " Python
                " jedi -- Python doc and refactoring
                call dein#add('davidhalter/jedi-vim', {
                             \'on_ft': 'python'})

                " jupyter -- Jupyter console supports
                call dein#add('jupyter-vim/jupyter-vim', {
                             \'on_ft': 'python'})

                " python-pep8-indent -- Better python indentation
                call dein#add('Vimjas/vim-python-pep8-indent', {
                             \'on_ft': 'python'})

            " Nvim-R -- R for vim
            " call dein#add('jalvesaq/Nvim-R')

            " octave -- Octave/Matlab syntax
            call dein#add('jvirtanen/vim-octave', {
                         \'on_ft': 'matlab'})

            " Tex/Pandoc/Markdown/RMarkdown
                " vimwiki -- Notes/org-mode like
                call dein#add('vimwiki/vimwiki', {
                             \'on_cmd': 'VimwikiIndex'})

                " vimtex -- Plugin for improved LaTeX
                call dein#add('lervag/vimtex', {
                             \'on_ft': 'tex',
                             \'merged': 0})

                " markdown-preview -- Preview markdown in browser
                call dein#add('iamcco/markdown-preview.nvim', {
                             \'build': 'cd app & yarn install',
                             \'on_ft': ['markdown', 'pandoc.markdown',
                                       \'rmarkdown']})

                " pandoc -- Pandoc integration
                call dein#add('vim-pandoc/vim-pandoc', {
                             \'on_ft': ['markdown', 'pandoc.markdown',
                                       \'rmarkdown']})

                " pandoc-syntax -- Syntax for pandoc
                call dein#add('vim-pandoc/vim-pandoc-syntax', {
                             \'on_ft': ['markdown', 'pandoc.markdown',
                                       \'rmarkdown']})

                " rmarkdown -- RMarkdown support
                call dein#add('vim-pandoc/vim-rmarkdown', {
                             \'on_ft': ['markdown', 'pandoc.markdown',
                                       \'rmarkdown']})

                " table-mode -- Table mode
                call dein#add('dhruvasagar/vim-table-mode', {
                              \'on_ft': ['rmd', 'markdown']})

            " MatchTagAlways -- Match html tags
            call dein#add('Valloric/MatchTagAlways', {
                         \'on_ft': ['html', 'xml', 'xhtml', 'jinja']})

            " Git
                " gitgutter -- Show git diff in gutter
                call dein#add('airblade/vim-gitgutter')

                " fugitive -- Git from vim
                call dein#add('tpope/vim-fugitive')

                " git-messenger -- reveal git message under the cursor
                call dein#add('rhysd/git-messenger.vim', {
                              \'on_cmd' : 'GitMessenger',
                              \'on_map' : '<Plug>(git-messenger'})

                " gv -- Commit search
                call dein#add('junegunn/gv.vim', {
                             \'depends': 'vim-fugitive'})

                " ConflictMotions -- Resolve conflict easier
                call dein#add('inkarkat/vim-CountJump')
                call dein#add('inkarkat/vim-ingo-library')
                call dein#add('inkarkat/vim-visualrepeat')
                call dein#add('inkarkat/vim-ConflictMotions', {
                             \'depends': ['vim-CountJump',
                                         \'vim-ingo-library',
                                         \'vim-visualrepeat']})

                " conflict-marker -- Highlight conflict sections
                call dein#add('rhysd/conflict-marker.vim')

                " gist -- Share on gist
                call dein#add('mattn/webapi-vim')
                call dein#add('mattn/vim-gist', {
                             \'depends': 'webapi-vim'})

            " autoformat -- Auto format code
            call dein#add('Chiel92/vim-autoformat', {
                         \'on_cmd:': 'Autoformat'})

            " nerdcommenter - Toggling comments
            call dein#add('preservim/nerdcommenter', {
                         \'on_map:': '<Plug>NERDCommenter'})

            " stackoverflow -- Ask stack overflow for help
            call dein#add('mickaobrien/vim-stackoverflow', {
                         \'on_cmd:': 'StackOverflow'})

        " Utilities
            " startify -- Fancy startup page
            call dein#add('mhinz/vim-startify')

            " startuptime -- Display startup time of each plugin
            call dein#add('dstein64/vim-startuptime', {
                         \'on_cmd:': 'StartupTime'})

            " ctrlp -- Fuzzy search engine
            call dein#add('ctrlpvim/ctrlp.vim', {
                         \'on_map': '<Plug>(ctrlp)'})

            " nerdtree -- When ctrlp is not enough
            call dein#add('scrooloose/nerdtree', {
                         \'on_cmd:': ['NERDTree', 'NERDTreeToggle',
                                     \'NERDTreeFromBookmark', 'NERDTreeFocus']})

            " tagbar -- Class/function viewer
            call dein#add('majutsushi/tagbar', {
                         \'on_cmd:': 'Tagbar'})

            " auto-pairs -- Auto pair parentheses and quotes
            call dein#add('jiangmiao/auto-pairs')

            " sandwich -- Surround like, but better
            call dein#add('machakann/vim-sandwich', {
                         \'on_map': ['<Plug>(operator-sandwich-',
                                    \'<Plug>(textobj-sandwich-',
                                    \'<Plug>(sandwich-']})

            " schlepp -- Move a highlighted text around
            call dein#add('zirrostig/vim-schlepp', {
                         \'on_map': '<Plug>Schlepp'})

            " exchange -- Easier word exchange
            call dein#add('tommcdo/vim-exchange', {
                         \'on_map': '<Plug>(Exchange'})

            " multiple-cursors -- Multi cursor support
            call dein#add('terryma/vim-multiple-cursors')

            " easy-align -- easy align mode
            call dein#add('junegunn/vim-easy-align', {
                         \'on_map': ['<Plug>(EasyAlign', '<Plug>(LiveEasyAlign']})

            " switch -- Substitute word under the cursor
            call dein#add('AndrewRadev/switch.vim', {
                         \'on_map': '<Plug>Switc'})

            " yankstack -- Cycle through yank stack
            call dein#add('maxbrunsfeld/vim-yankstack')

            " repeat -- Dot (.) command for non-native commads
            call dein#add('tpope/vim-repeat')

            " indentLine -- Show indentation
            call dein#add('Yggdroot/indentLine', {
                         \'on_cmd': 'IndentLinesToggle'})

            " signature - Show marks
            call dein#add('kshenoy/vim-signature')

            " template -- Template files
            call dein#add('aperezdc/vim-template')

            " autoswap -- Switch to the correct window if file is already opened
            call dein#add('gioele/vim-autoswap')

            " lastplace -- Open files at last edit position
            call dein#add('farmergreg/vim-lastplace')

            " traces -- Substitute preview
            call dein#add('markonm/traces.vim')

            " goyo -- Put page on center, nice when reading stuff
            call dein#add('junegunn/goyo.vim', {
                         \'on_cmd': 'Goyo'})

            " suda -- Sudo write
            call dein#add('lambdalisue/suda.vim')

            " easymotion -- Easier navigation
            call dein#add('easymotion/vim-easymotion', {
                         \'on_map': '<Plug>(easymotion-'})

            " comfortable-motion -- Smooth scrolling
            call dein#add('yuttie/comfortable-motion.vim')

            " open-browser -- Open link under cursor in browser
            call dein#add('tyru/open-browser.vim')

            " any-jump -- grep in project
            call dein#add('pechorin/any-jump.vim', {
                         \'on_cmd:': ['AnyJump', 'AnyJumpVisual', 'AnyJumpUserArg']})

            " undotree -- visualize undo history
            call dein#add('mbbill/undotree', {
                         \'on_cmd:': 'UndotreeToggle'})

            " firenvim -- Use nvim in browser
            call dein#add('glacambre/firenvim', {
                         \'hook_post_update': 'call firenvim#install(0)'})

        " Highlights and sytnax
            " highlightyank -- Highlight yanked lines
            call dein#add('machakann/vim-highlightedyank')

            " hexokinase -- color hex codes
            call dein#add('rrethy/vim-hexokinase', { 'build': 'make hexokinase' })

            " CursorLineCurrentWindow -- Show cursor line only on focused window
            call dein#add('vim-scripts/CursorLineCurrentWindow')

            " search-pulse -- Pulse on search
            call dein#add('inside/vim-search-pulse', {
                         \'on_map:': '<Plug>Pulse'})

            " rainbow_parentheses.vim -- rainbow parentheses
            call dein#add('kien/rainbow_parentheses.vim')

            " i3-vim-syntax -- Syntax for i3 config
            call dein#add('PotatoesMaster/i3-vim-syntax', {
                         \'on_ft': 'i3'})

            " Tree-sitter stuff
                " treesitter -- Highlighting
                call dein#add('nvim-treesitter/nvim-treesitter')

                " treesitter-context
                call dein#add('romgrk/nvim-treesitter-context')

                " treesitter-refactor -- Refactor modules for nvim-treesitter
                call dein#add('nvim-treesitter/nvim-treesitter-refactor', {
                             \'depends': 'nvim-treesitter'})

                " treesitter-textobjects -- textobjects using treesitter queries
                call dein#add('nvim-treesitter/nvim-treesitter-textobjects', {
                             \'depends': 'nvim-treesitter'})

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
            if exists('terminal_color_0') == 0
                finish
            endif

            " |     Variable                |   Color                        |
            " | :-------------------------: | :----------------------------: |
            " | g:terminal_color_0          | black                          |
            " | g:terminal_color_1          | red                            |
            " | g:terminal_color_2          | green                          |
            " | g:terminal_color_3          | yellow                         |
            " | g:terminal_color_4          | blue                           |
            " | g:terminal_color_5          | purple                         |
            " | g:terminal_color_6          | cyan                           |
            " | g:terminal_color_7          | white                          |
            " | g:terminal_color_8          | visual grey                    |
            " | g:terminal_color_9          | dark_red                       |
            " | g:terminal_color_10         | green        - No dark version |
            " | g:terminal_color_11         | dark yellow                    |
            " | g:terminal_color_12         | blue         - No dark version |
            " | g:terminal_color_13         | purple       - No dark version |
            " | g:terminal_color_14         | cyan         - No dark version |
            " | g:terminal_color_15         | comment grey                   |
            " | g:terminal_color_background | black                          |
            " | g:terminal_color_foreground | white                          |

        " lightline -- A light and configurable statusline/tabline
            " Lightline definition
                let g:lightline = {
                    \ 'colorscheme': 'onedark',
                    \ 'tabline': {
                        \ 'right': [[]]
                        \ },
                    \ 'component_expand': {
                        \ 'tabs': 'LightlineCustomTabs',
                        \ },
                    \ 'active': {
                        \ 'left': [
                            \ ['mode'],
                            \ ['readonly', 'gitbranch', 'filename', 'gitversion'],
                            \ ['ctrlpmark']
                            \ ],
                        \ 'right': [
                            \ ['lineinfo'],
                            \ ['percent'],
                            \ ['ale', 'fileformat', 'fileencoding', 'filetype']
                            \ ]
                            \ },
                    \ 'component_function': {
                        \ 'ale':          'LightlineCustomAleStatus',
                        \ 'mode':         'LightlineCustomMode',
                        \ 'ro':           'LightlineCustomReadonly',
                        \ 'fugitive':     'LightlineCustomFugitive',
                        \ 'gitbranch':    'gitbranch#name',
                        \ 'filename':     'LightlineCustomFilename',
                        \ 'gitversion':   'LightlineCustomGitversion',
                        \ 'ctrlp':        'LightlineCustomCtrlP',
                        \ 'fileformat':   'LightlineCustomFileformat',
                        \ 'fileencoding': 'LightlineCustomFileEncoding',
                        \ 'filetype':     'LightLineCustomFiletype'
                        \ },
                    \ }

            " Tab colors
                let s:palette = g:lightline#colorscheme#onedark#palette
                let s:palette.tabline.tabsel = [[
                    \ g:terminal_color_0,
                    \ g:terminal_color_2,
                    \ 252,
                    \ 66,
                    \ 'None']]
                unlet s:palette

            " Better displaying when a lot of tabs are opened
                function! LightlineCustomTabs() abort
                    let [x, y, z] = [[], [], []]
                    let nr = tabpagenr()
                    let cnt = tabpagenr('$')
                    for i in range(1, cnt)
                        call add(i < nr ? x : i == nr ? y : z,
                        \ '%' . i . '%%{lightline#onetab(' . i . ',' . (i == nr) . ')}'
                        \ . (i == cnt ? '%T' : ''))
                    endfor

                    if len(x) > 3
                        let x = x[len(x)-3:]
                        let x[0] = '<' . x[0]
                    endif

                    if len(z) > 3
                        let z = z[:2]
                        let z[len(z)-1] = z[len(z)-1] . '>'
                    endif
                    return [x, y, z]
                endfunction

            " Adding CtrlP to original mods
                function! LightlineCustomMode()
                    let l:fname = expand('%:t')
                    return l:fname == 'ControlP' ? 'CtrlP' :
                        \ winwidth(0) > 60 ? lightline#mode() : ''
                endfunction

            " Display brach name
                function! LightlineCustomBranch()
                    if &filetype == 'tagbar' || &filetype == 'nerdtree'
                        return ''
                    endif

                    let l:branch = fugitive#head()
                        return strlen(l:branch) ? l:branch : ''
                endfunction

            " Display if file is modified
                function! s:LightlineCustomModified()
                    return &ft =~ 'help' ?
                        \ '' : &modified ? '+' : &modifiable ? '' : '-'
                endfunction

            " Display file name with modification
                function! LightlineCustomFilename()
                    if &filetype == 'nerdtree'
                        return 'NERDTree'
                    endif

                    if &filetype == 'tagbar'
                        return 'Tagbar'
                    endif

                    let l:fname = expand('%:t')
                    return l:fname == 'ControlP' ? g:lightline.ctrlp_item :
                        \ ('' != l:fname ? l:fname : '[No Name]') .
                        \ ('' != s:LightlineCustomModified() ? ' ' .
                                    \ s:LightlineCustomModified() : '')
                endfunction

            " Get git index files names when diffing
                function! LightlineCustomGitversion()
                    let fullname = expand('%')
                    let gitversion = ''

                    if fullname =~? 'fugitive://.*/\.git//0/.*'
                        let gitversion = 'git index'
                    elseif fullname =~? 'fugitive://.*/\.git//2/.*'
                        let gitversion = 'git target'
                    elseif fullname =~? 'fugitive://.*/\.git//3/.*'
                        let gitversion = 'git merge'
                    elseif &diff == 1
                        let gitversion = 'working copy'
                    endif

                    return gitversion
                endfunction

            " Remove fileformat on small windows
                function! LightlineCustomFileformat()
                    return winwidth(0) > 70 ? &fileformat : ''
                endfunction

            " Remove fileencoding on small windows
                function! LightlineCustomFileEncoding()
                    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
                endfunction

            " Remove filetype on small windows
                function! LightlineCustomFiletype()
                    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
                endfunction

            " Proper CtrlP status
                function! LightlineCustomCtrlP()
                    if expand('%:t') =~ 'ControlP'
                        call lightline#link('iR'[g:lightline.ctrlp_regex])
                        return lightline#concatenate([g:lightline.ctrlp_prev,
                                                    \ g:lightline.ctrlp_item,
                                                    \ g:lightline.ctrlp_next], 0)
                    else
                        return ''
                    endif
                endfunction

            " CtrlP status functions
                let g:ctrlp_status_func = {
                    \ 'main': 'LightlineCustomCtrlPStatusMain',
                    \ 'prog': 'LightlineCustomCtrlPStatusProg' }

            " Focused status
                function! LightlineCustomCtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
                    let g:lightline.ctrlp_regex = a:regex
                    let g:lightline.ctrlp_prev = a:prev
                    let g:lightline.ctrlp_item = a:item
                    let g:lightline.ctrlp_next = a:next
                    return lightline#statusline(0)
                endfunction

            " Unfocused status
                function! LightlineCustomCtrlPStatusProg(str)
                    return lightline#statusline(0)
                endfunction

            " Readonly status
                function! LightlineReadonly()
                    return &readonly && &filetype !~# '\v(help|nerdtree|tagbar)' ? 'RO' : ''
                endfunction

            " Lightline status variables
                let g:nerdtree_force_overwrite_statusline = 0
                let g:tagbar_force_overwrite_statusline = 0

            " Ale status
                function! LightlineCustomAleStatus() abort
                    let l:counts = ale#statusline#Count(bufnr(''))

                    let l:all_errors = l:counts.error + l:counts.style_error
                    let l:all_non_errors = l:counts.total - l:all_errors

                    return l:counts.total == 0 ? '' : printf('%dW %dE',
                                                           \ all_non_errors,
                                                           \ all_errors)
                endfunction

    " Coding stuff
        " Auto-completion
            " deoplete -- Dark powered asynchronous completion
                " Init on hook
                call dein#set_hook('deoplete.nvim', 'hook_source', 'call DeopleteInit()')
                function! DeopleteInit()
                    let g:deoplete#enable_at_startup = 1
                    " call deoplete#custom#option({
                    " \ 'smart_case': v:true,
                    " \ 'max_list': 100,
                    " \ 'num_processes': 2,
                    " \ })

                    " Completion triggers may block semshi from highlighting
                    " instantly, so add some delay
                    " call deoplete#custom#option({'auto_complete_delay': 100,})

                    " deoplete-terminal
                    call deoplete#custom#var('terminal', 'require_same_tab', v:false)
                    call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

                    " If it slows cpu too much
                    " let g:deoplete#max_processes = 1

                    " Debug mode
                    " let g:deoplete#enable_debug = 1
                endfunction

            " deoplete-jedi -- Deoplete source for jedi(python)
                " Type info for completions
                let g:deoplete#sources#jedi#enable_typeinfo = 1
                " Cache cache cache
                let g:deoplete#sources#jedi#enable_cache = 1
                " Show docstrings
                let g:deoplete#sources#jedi#show_docstring = 1
                " Ignore useless stuff
                let g:deoplete#sources#jedi#ignore_private_members = 1
                let g:deoplete#sources#jedi#ignore_errors = 1

            " neosnippet -- Snippet support
                " let g:neosnippet#enable_completed_snippet = 1
                let g:neosnippet#enable_complete_done = 1
                let g:neosnippet#enable_auto_clear_markers = 1

        " echodoc -- Display function signatures on the fly
            " Enable at start
            let g:echodoc_enable_at_startup = 1

        " ale -- Asynchronous lint engine
            " Ale signs
            let g:ale_sign_error = '>>'
            let g:ale_sign_warning = '>>'

            " Color warnings in yellow (by default they are red)
            exe 'hi ALEWarningSign guifg=' . g:terminal_color_3
            hi ALEWarning guifg=None

            let g:ale_c_parse_compile_commands = 1
            let g:ale_c_parse_makefile = 1
            let g:ale_completion_enabled = 0
            let g:ale_completion_autoimport = 1
            " let g:ale_lint_on_text_changed = 'always'
            let g:ale_linters_explicit=1

            let g:ale_linters = {
                \ 'c': ['ccls'],
                \ 'cpp': ['ccls'],
                \ 'python': ['pyls'],
                \ 'vim': ['vimls'],
                \ 'sh': ['language_server', 'shell'],
                \}

            let g:ale_fixers = {
                \ 'c': ['astyle'],
                \ 'cpp': ['astyle']
                \}

            let g:ale_python_pyls_config = {
                \ 'pyls': {
                    \ 'configurationSources': ['flake8'],
                    \ 'plugins': {
                        \ 'pycodestyle': {
                            \ 'enabled': v:false
                            \},
                        \ 'flake8': {
                            \ 'enabled': v:false
                            \}
                        \}
                    \}
                \}

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

            exe 'hi BreakSign guifg=' . g:terminal_color_1 . ' ' . ' gui=bold'
            exe 'hi DebugSign guifg=' . g:terminal_color_5 . ' ' . ' gui=bold'
            " exe 'hi DebugLine guibg=' . g:terminal_color_8 . ' ' . ' gui=bold'
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

        " Nvim-R -- R for vim
            " let R_user_maps_only = 1

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
                    \}

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
            " gitgutter -- Show git diff in gutter
                " Update in real time
                let g:gitgutter_realtime = 1

            " ConflictMotions -- Resolve conflict easier
                " Disable mappings
                let g:ConflictMotions_TakeMappingPrefix = ''

            " conflict-marker -- Highlight conflict sections
                let g:conflict_marker_highlight_group = ''
                highlight ConflictMarkerTheirs guibg=#35374A

                let g:conflict_marker_enable_mappings = 0
                let g:conflict_marker_enable_matchit = 0

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

        " Stackoverflow
            " Better prompt
            command! AskStackOverflow call s:AskStackOverflow()
            function! s:AskStackOverflow()
                let l:msg = PromptGetUserInput('Question: ', 'custom,ListUsers')
                if empty(l:msg) | return | endif
                execute 'StackOverflow ' . msg
            endfunction

    " Utilities
        " startify -- Fancy startup page
            " Disable header
            let g:startify_custom_header = []

        " ctrlp -- Fuzzy search engine
            " Set local working directory (r - nearest ancestor, a - current)
            let g:ctrlp_working_path_mode = 'ra'

            " Exclude files and directories
            let g:ctrlp_root_markers = ['.cproject', '.pyproject']

            " Cache dir
            let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

            " Leave caches on exit
            let g:ctrlp_clear_cache_on_exit = 0

        " nerdtree -- When ctrlp is not enough
            " NerdTree bug Quick-fix
            hi NERDTreeFile ctermfg=251

            " Disable line numbering
            let g:NERDTreeShowLineNumbers=0

            " Bookmark file
            let g:NERDTreeBookmarksFile=expand('$HOME') . '/.cache/nvim/NERDTreeBookmarks'

        " tagbar -- Class/function viewer
            let g:tagbar_iconchars =  ['▸','▾']
            let g:tagbar_previewwin_pow = 'rightbelow'

            exe 'hi TagbarFoldIcon guifg=' . g:terminal_color_5
            exe 'hi TagbarHighlight guifg=' . g:terminal_color_4
            exe 'hi TagbarKind guifg=' . g:terminal_color_5
            exe 'hi TagbarSignature guifg=' . g:terminal_color_15

        " auto-pairs -- Auto pair parentheses and quotes
            " Disable multiline pairs
            let g:AutoPairsMultilineClose = 0

        " schlepp -- Move a highlighted text around
            let g:Schlepp#allowSquishingLines = 1
            let g:Schlepp#allowSquishingBlock = 1

        " exchange -- Easier word exchange
            " Disable mappings
            let g:exchange_no_mappings=1

        " multiple-cursors -- Multi cursor support
            " Disable defult mappings
            let g:multi_cursor_use_default_mapping=0

            " Disable deoplete/ale when in cursor mode
            function! Multiple_cursors_before()
                if deoplete#is_enabled()
                    call deoplete#disable()
                    ALEDisable
                    let g:deoplete_is_enable_before_multi_cursors = 1
                else
                    let g:deoplete_is_enable_before_multi_cursors = 0
                endif
            endfunc

            " Enable deoplete/ale when not in cursor mode
            function! Multiple_cursors_after()
                if g:deoplete_is_enable_before_multi_cursors
                    call deoplete#enable()
                    ALEEnable
                endif
            endfunc

        " switch -- Substitute word under the cursor
            " Disable default mappings
            let g:switch_mapping = ''

            " General definitions
            let g:switch_custom_definitions = [
                \   ['true', 'false'],
                \   ['on', 'off'],
                \   ['yes', 'no'],
                \   ['get', 'set'],
                \   ['enable', 'disable'],
                \   ['zero', 'one', 'two', 'three', 'four', 'five', 'six',
                    \'seven', 'eight', 'nine', 'ten'],
                \   ['sunday', 'monday', 'tuesday', 'wensday', 'thursday',
                    \'friday', 'saturday'],
                \   ['sun', 'mon', 'tue', 'wen', 'thu', 'fri', 'sat'],
                \   ['return', 'break', 'continue' ]]

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
                let g:python_switch_custom_definitions = [
                    \ ['elif, else']]

                " C/C++
                let g:cpp_switch_custom_definitions = [
                    \ ['else if, else']]

            let g:camelcase_switch_definitions = [{
                \   '\<[a-z0-9]\+_\k\+\>': {
                    \   '_\(.\)': '\U\1'
                    \},
                \   '\<[a-z0-9]\+[A-Z]\k\+\>': {
                    \   '\([A-Z]\)': '_\l\1'
                    \},
                \}]

        " yankstack -- Cycle through yank stack
            " Disable default mappings
            let g:yankstack_map_keys = 0
            call yankstack#setup()

        " indentLine -- Show indentation
            let g:indentLine_enabled = 0
            let g:indentLine_color_gui = g:terminal_color_15
            let g:indentLine_char = '▏'

        " signature - Show marks
            exe 'hi SignatureMarkText guifg=' . g:terminal_color_11
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

            command! OpenBrowserUnderCursor exe 'OpenBrowser ' . expand("<cWORD>")

        " comfortable-motion -- Smooth scrolling
            " Disable mappings
            let g:comfortable_motion_no_default_key_mappings = 1
            let g:comfortable_motion_interval = 1000.0/60

            " Find impulse for given amount of lines
            function! ComforableMotionFindImpulse(diff)
                let l:X = pow(abs(a:diff), 0.5)
                let l:impulse =  0.7642497185838693
                              \+11.916201835589376*l:X
                              \ +1.4842847475051253*(pow(l:X, 2))
                              \ +0.01733669295908215*(pow(l:X, 3))
                              \ -0.00034498320824916107*(pow(l:X, 4))
                              \ +2.941264385825093e-06*(pow(l:X, 5))
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
            let g:any_jump_ignored_files = ['*.tmp', '*.temp', &wildignore]

            " Get argument with completion
            function! AnyJumpUserArg()
                let l:arg = PromptGetUserInput('Grep: ', 'customlist,CompleteWords')
                if empty(l:arg) | return | endif
                exe 'AnyJumpArg '. l:arg
            endfunction

        " Firenvim
            let g:firenvim_config = {
                \ 'globalSettings': {
                        \ 'alt': 'all',
                        \ },
                \ 'localSettings': {
                    \ '.*': {
                        \ 'priority': 0,
                        \ 'takeover': 'always',
                        \ },
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
        " highlightyank -- Highlight yanked lines
            " Set highlight color
            exe 'hi HighlightedyankRegion ctermbg=237 guibg=' . g:terminal_color_8

            " Set duration
            let g:highlightedyank_highlight_duration = 1000

        " search-pulse -- Pulse on search
            let g:terminal_color_8_dark_shade_2 = '#2B2F38'
            let g:terminal_color_8_dark_shade_1 = '#3E4452'
            let g:terminal_color_8_light_shade_1 = '#515A6B'
            let g:terminal_color_8_light_shade_2 = '#656F85'
            let g:vim_search_pulse_color_list = [
                \ g:terminal_color_8_dark_shade_2,
                \ g:terminal_color_8_dark_shade_1,
                \ g:terminal_color_8,
                \ g:terminal_color_8_light_shade_1,
                \ g:terminal_color_8_light_shade_2
                \ ]

        " rainbow_parentheses.vim -- rainbow parentheses
            let g:rbpt_max = 9
            let g:rbpt_colorpairs = [
                \ ['red', g:terminal_color_11],
                \ ['red', g:terminal_color_7],
                \ ['red', g:terminal_color_9],
                \ ['red', g:terminal_color_3],
                \ ['red', g:terminal_color_4],
                \ ['red', g:terminal_color_2],
                \ ['red', g:terminal_color_6],
                \ ['red', g:terminal_color_1],
                \ ['red', g:terminal_color_5]]

        " nvim-treesitter
            set foldexpr=nvim_treesitter#foldexpr()

            "Syntax/parser errors.
            exe 'hi TSError guifg=' . g:terminal_color_1

            " Delimiters ie: `.`
            exe 'hi TSPunctDelimiter guifg=' . g:terminal_color_7

            " Brackets and parens.
            exe 'hi TSPunctBracket guifg=' . g:terminal_color_7

            " For special punctutation that does not fall in the catagories
            " before.
            exe 'hi TSPunctSpecial guifg=' . g:terminal_color_5

            " Tags like html tag names.
            exe 'hi TSTag guifg=' . g:terminal_color_6

            " Tag delimiter like `<` `>` `/`
            exe 'hi TSTagDelimiter guifg=' . g:terminal_color_9

            " For constants
            exe 'hi TSConstant guifg=' . g:terminal_color_11

            " For constant that are built in the language: `nil` in Lua.
            exe 'hi TSConstBuiltin guifg=' . g:terminal_color_11

            " For constants that are defined by macros: `NULL` in C.
            exe 'hi TSConstMacro guifg=' . g:terminal_color_13

            " For strings.
            exe 'hi TSString guifg=' . g:terminal_color_2

            " For regexes.
            exe 'hi TSStringRegex guifg=' . g:terminal_color_6

            " For escape characters within a string.
            exe 'hi TSStringEscape guifg=' . g:terminal_color_4

            " For characters.
            exe 'hi TSCharacter guifg=' . g:terminal_color_11

            " For integers.
            exe 'hi TSNumber guifg=' . g:terminal_color_11

            " For booleans.
            exe 'hi TSBoolean guifg=' . g:terminal_color_11

            " TSFloat
            exe 'hi TSFloat guifg=' . g:terminal_color_11

            " For function (calls and definitions).
            exe 'hi TSFunction guifg=' . g:terminal_color_4

            " For builtin functions: `table.insert` in Lua.
            exe 'hi TSFuncBuiltin guifg=' . g:terminal_color_5

            " For macro defined fuctions (calls and definitions): each
            " `macro_rules` in Rust.
            exe 'hi TSFuncMacro guifg=' . g:terminal_color_5

            " For references to parameters of a function.
            exe 'hi TSParameterReference guifg=' . g:terminal_color_5

            " For parameters of a function.
            exe 'hi TSParameter guifg=' . g:terminal_color_3

            " For method calls and definitions.
            exe 'hi TSMethod guifg=' . g:terminal_color_4

            " For fields.
            exe 'hi TSField guifg=' . g:terminal_color_7

            " Same as `TSField`.
            exe 'hi TSProperty guifg=' . g:terminal_color_4

            " For constructor calls and definitions: `{}` in Lua, and Java
            " constructors.
            exe 'hi TSConstructor guifg=' . g:terminal_color_4

            " For keywords related to conditionnals.
            exe 'hi TSConditional guifg=' . g:terminal_color_5

            " For keywords related to loops.
            exe 'hi TSRepeat guifg=' . g:terminal_color_5

            " For labels: `label:` in C and `:label:` in Lua.
            exe 'hi TSLabel guifg=' . g:terminal_color_5

            " For any operator: `+`, but also `->` and `*` in C.
            exe 'hi TSOperator guifg=' . g:terminal_color_5

            " For keywords that don't fall in previous categories.
            exe 'hi TSKeyword guifg=' . g:terminal_color_5

            " For keywords used to define a fuction.
            exe 'hi TSKeywordFunction guifg=' . g:terminal_color_4

            " For exception related keywords.
            exe 'hi TSException guifg=' . g:terminal_color_5

            " For types.
            exe 'hi TSType guifg=' . g:terminal_color_6

            " For builtin types (you guessed it, right ?).
            exe 'hi TSTypeBuiltin guifg=' . g:terminal_color_3

            " For identifiers referring to modules and namespaces.
            exe 'hi TSNamespace guifg=' . g:terminal_color_6

            " None
            exe 'hi TSNone guifg=' . g:terminal_color_11

            " For includes: `#include` in C, `use` or `extern crate` in
            " Rust, or `require` in Lua.
            exe 'hi TSInclude guifg=' . g:terminal_color_5

            " For C++/Dart attributes, annotations that can be attached to
            " the code to denote some kind of meta information.
            exe 'hi TSAnnotation guifg=' . g:terminal_color_6

            " For comment blocks.
            exe 'hi TSComment guifg=' . g:terminal_color_15

            " For strings considered text in a markup language.
            exe 'hi TSText guifg=' . g:terminal_color_7

            " For text to be represented with strong.
            exe 'hi TSStrong guifg=' . g:terminal_color_7

            " For text to be represented with emphasis.
            exe 'hi TSEmphasis guifg=' . g:terminal_color_11

            " For text to be represented with an underline.
            exe 'hi TSUnderline guifg=' . g:terminal_color_7

            " Text that is part of a title.
            exe 'hi TSTitle guifg=' . g:terminal_color_5

            " Literal text.
            exe 'hi TSLiteral guifg=' . g:terminal_color_2

            " Any URI like a link or email.
            exe 'hi TSURI guifg=' . g:terminal_color_4

            " Any variable name that does not have another highlight.
            exe 'hi TSVariable guifg=' . g:terminal_color_7

            " Variable names that are defined by the languages, like
            " `this` or `self`.
            exe 'hi TSVariableBuiltin guifg=' . g:terminal_color_5

            " Refactor
            " Used by refactor.highlight_definitions to highlight the
            " definition of the symbol under the cursor.
            exe 'hi TSDefinition guifg=' . g:terminal_color_3
            ". ' gui=underline'
            " Used by refactor.highlight_definitions to highlight usages
            " of the symbol under the cursor.
            exe 'hi TSDefinitionUsage guibg=' . g:terminal_color_8

            " Used by refactor.highlight_current_scope to highlight the
            " current scope.
            exe 'hi TSCurrentScope guibg=' . g:terminal_color_8

            lua << EOF
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    'c', 'cpp', 'python'
                },
                highlight = {
                    enable = true,
                    use_languagetree = true, -- Use this to enable language injection
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                refactor = {
                    highlight_definitions = {
                        enable = true,
                        disable = { 'markdown' }
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",

                            -- Or you can define your own textobjects like this
                            ["iF"] = {
                              python = "(function_definition) @function",
                              cpp = "(function_definition) @function",
                              c = "(function_definition) @function",
                              java = "(method_declaration) @function",
                            },
                        },
                    },
                },
            }
EOF
" endfunction
