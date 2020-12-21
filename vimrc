" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim basic settings
" --------------------------------------------------------------------------------

" identify platform {{{
" --------------------------------------------------------------------------------
silent function! OSX()
return  has('macunix')
endfunction

silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
return  (has('win16') || has('win32') || has('win64'))
endfunction
" }}}

" enable syntax and filetype settings {{{
" --------------------------------------------------------------------------------
set nocompatible
if has('autocmd')
    filetype plugin on
    filetype indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif
" }}}

" vim directory path {{{
" --------------------------------------------------------------------------------
let $VIMHOME=expand('<sfile>:p:h:h')

if WINDOWS()
    let $VIMHOME=expand('$VIMHOME/vimfiles')
elseif OSX()
    let $VIMHOME=expand('$VIMHOME/.vim')
else
    let $VIMHOME=expand('$VIMHOME/.vim')
endif
" }}}

" initialize bundles {{{
" --------------------------------------------------------------------------------
source $VIMHOME/plug.vim
" }}}

" path (allow recursive file search) {{{
" --------------------------------------------------------------------------------
set path+=**
" }}}

" gui options {{{
" select via the font chooser with :set guifont=*
" --------------------------------------------------------------------------------
if has("gui_running")
    if WINDOWS()
        set guifont=Monaco:h10:cANSI
    elseif OSX()
        " set guifont=iosevka:h14,Source\ Code\ Pro:h14
        set guifont=JetBrainsMono-Regular:h12
    else
        " set guifont=iosevka\ 12,Camingo\ Code\ 12
        set guifont=JetBrains\ Mono\ 11
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256
    endif
endif
" }}}

" mac os specific {{{
" --------------------------------------------------------------------------------
if OSX() && has("gui")
    set macmeta                     "enable the alt key
    set macligatures                "enable ligatures for supported fonts
endif
if OSX()
    let g:Grep_Xargs_Options='-0'   "disable xargs
endif
" }}}

" leader {{{
" --------------------------------------------------------------------------------
let mapleader="\<Space>"
" }}}

" source utility functions {{{
" --------------------------------------------------------------------------------
source $VIMHOME/functions.vim
" }}}

" set up directories {{{
" --------------------------------------------------------------------------------
call MkDir($VIMHOME . "/tmp")
call MkDir($VIMHOME . "/tmp/bak")
call MkDir($VIMHOME . "/tmp/swp")
call MkDir($VIMHOME . "/tmp/und")
call MkDir($VIMHOME . "/tmp/viw")

set backupdir=$VIMHOME/tmp/bak//     "backup
set directory=$VIMHOME/tmp/swp//     "swap
set undodir=$VIMHOME/tmp/und//       "undo
set viewdir=$VIMHOME/tmp/viw//       "view
" }}}

" don't change directory on file open, buffer switch, etc {{{
" --------------------------------------------------------------------------------
set noautochdir
" }}}

" file backup and undo {{{
" --------------------------------------------------------------------------------
set backup
set backupskip=/tmp/*,/private/tmp/*"   "make vim able to edit crontab files

if has('persistent_undo')
    " setting undofile causes undo to behave unexpectedly
    " when pressing undo it undoes cursor movements as well
    " causing multiple undo presses for one edit undo
    set noundofile

    set undolevels=2000
    set undoreload=10000
endif
" }}}

" use a tags file (if any) {{{
" --------------------------------------------------------------------------------
set tags=tags
" }}}

" update the system clipboard on copy/paste {{{
" --------------------------------------------------------------------------------
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" }}}

" colors and transparency {{{
" --------------------------------------------------------------------------------
try
    if has('gui_running')
        set background=dark
        colorscheme solarized8
    else
        set background=light
        colorscheme solarized
    endif
catch /E185:/
    colorscheme default
endtry

if has('gui_running')
    let g:solarized_termcolors=256
    let g:solarized_termtrans=0
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
else
    let g:solarized_termcolors=16
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"

    if $TERM_PROGRAM == 'Apple_Terminal'
        let g:solarized_termcolors=&t_Co

        if exists('$TERM_THEME') && $TERM_THEME == 'solarized_light'
            set background=light
        endif

        if g:colors_name == 'solarized' && &background == 'dark'
            hi Visual term=reverse cterm=reverse ctermfg=10 ctermbg=7
        endif
    endif
endif
" }}}

" spacing and indenting {{{
" --------------------------------------------------------------------------------
set autoindent
set smartindent
set linebreak
set nowrap
set backspace=indent,eol,start
set cpoptions-=m
" }}}

" output encoding {{{
" --------------------------------------------------------------------------------
if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif
" }}}

" invisible characters and encoding {{{
" use set sytax=whitespace to see al white space characters
" --------------------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8

set list
set showbreak="↪\ "
set listchars=tab:▸\ ,trail:␣,precedes:←,extends:→,nbsp:␣
" }}}

" brace matching {{{
" --------------------------------------------------------------------------------
set showmatch
set matchtime=1
" }}}

" tabs {{{
" --------------------------------------------------------------------------------
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" }}}

" number formats and shift round {{{
" --------------------------------------------------------------------------------
set nrformats=octal,bin,hex
set shiftround
" }}}

" key timeout {{{
" --------------------------------------------------------------------------------
" Timeout on Vim entered key codes.
set timeout
" Timeout on terminal entered key codes.
set ttimeout
" Time Vim will wait for successive Vim keycodes which are entered
" manually by the user. This is only relevant if timeout is enabled.
set timeoutlen=5000
" Time vim will wait for different parts of a terminal key codes.
" This should be a small value since the keycodes are sent by the
" terminal all at once.
set ttimeoutlen=300
" }}}

" search behavior {{{
" this behavior is mostly determined by the incsearch plugin
" --------------------------------------------------------------------------------
set ignorecase
set incsearch
set smartcase
set nogdefault
set hlsearch
set nowrapscan
" }}}

" insert mode completion {{{
" --------------------------------------------------------------------------------
set complete-=i
set completeopt=longest,menuone
set infercase
" }}}

" auto reload changed files {{{
" --------------------------------------------------------------------------------
set autoread
set fileformats+=mac
" }}}

" cursor settings {{{
" --------------------------------------------------------------------------------
if has("gui_running")
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver20-iCursor
    set guicursor+=n-v-c:blinkon0
endif

" change cursor shape for insert and normal mode in iTerm2 with Tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" user interface settings {{{
" --------------------------------------------------------------------------------
set laststatus=2              "status bar (0=never, 1=default, 2=always)
set number
set relativenumber            "relative numbers by default (toggle with cor)
set ruler
set showcmd
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*rbc,*.class,.svn,vendor/gems/*,node_modules,*/tmp/*
set showmode
set statusline=%F%m%r%h%w\ %n:%{&ff}:%Y\ L=%04l/%L[%p%%]\ C=%04c/%{len(getline(line(\".\")))}\ %{&wrap?'w':'\ '}\ %{&diff?'d':'\ '}

set mousehide
set mouse=a

if !has('nvim')
    set ttymouse=xterm
endif

set guioptions=
set showtabline=0
set title
set nofoldenable
set foldmethod=indent
set foldlevel=2
set foldnestmax=2
set cursorline
set nocursorcolumn
set modelines=1
set modeline
set virtualedit=block
set shortmess=filmnrxoOtT
set keywordprg=:help
" }}}

" don't sound on errors {{{
" --------------------------------------------------------------------------------
set noerrorbells
set visualbell
set vb t_vb=
" }}}

" diff should split vertically {{{
" --------------------------------------------------------------------------------
set diffopt=vertical
" }}}

" always report the number of lines changed {{{
" --------------------------------------------------------------------------------
set report=0
" }}}

" command line history {{{
" --------------------------------------------------------------------------------
if &history < 2000
    set history=2000
endif
" }}}

" maximum number of tabs {{{
" --------------------------------------------------------------------------------
if &tabpagemax < 50
    set tabpagemax=50
endif
" }}}

" auto save info {{{
" --------------------------------------------------------------------------------
set viminfo^=!
" }}}

" cursor padding {{{
" --------------------------------------------------------------------------------
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
" }}}

" display last lines that don't fit {{{
" --------------------------------------------------------------------------------
set display+=lastline
" }}}

" hidden files patterns {{{
" --------------------------------------------------------------------------------
if !exists('g:netrw_list_hide')
    let g:netrw_list_hide = '^\.,\~$,^tags$'
endif
" }}}

" load matchit.vim, but only if the user hasn't installed a newer version. {{{
" --------------------------------------------------------------------------------
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif
" }}}

" set what is saved during a session  {{{
" --------------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
" }}}

" command window height {{{
" --------------------------------------------------------------------------------
set cmdwinheight=20
" }}}

" command line height {{{
" --------------------------------------------------------------------------------
set cmdheight=1
" }}}

" don't redraw while executing macros {{{
" --------------------------------------------------------------------------------
set lazyredraw
" }}}

" buffers {{{
" --------------------------------------------------------------------------------
set hidden          " allow hide unsaved buffers
set equalalways
set splitbelow
set splitright
" }}}

" grep {{{
" --------------------------------------------------------------------------------
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" source additional settings {{{
" --------------------------------------------------------------------------------
source $VIMHOME/align.vim         " alignment functions
source $VIMHOME/coremap.vim       " core key mappings
source $VIMHOME/corecmd.vim       " core auto commands
source $VIMHOME/bundle.vim        " plugins settings
" }}}

" word delimiters {{{
" --------------------------------------------------------------------------------
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-
" }}}

" Use local vimrc if available {{{
" --------------------------------------------------------------------------------
if filereadable(expand("$VIMHOME/vimrc.local"))
    source $VIMHOME/vimrc.local
endif
" }}}

" Force loading python3 {{{
" Load python after vimrc.local runs in case it needs to set some paths
" --------------------------------------------------------------------------------
if has('python3')
endif
" }}}

" Secure {{{
" --------------------------------------------------------------------------------
set secure
" }}}

" Html syntax {{{
" --------------------------------------------------------------------------------
let html_no_rendering=1
" }}}


" vim:foldmethod=marker:foldlevel=0
