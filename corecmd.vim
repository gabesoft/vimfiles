" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim core auto commands
" --------------------------------------------------------------------------------

" Resize splits when the window is resized {{{
" --------------------------------------------------------------------------------
autocmd VimResized * exe "normal! \<c-w>="
" }}}

" Color scheme change fixes {{{
" --------------------------------------------------------------------------------
augroup ColorSchemeChange
    autocmd!
    autocmd ColorScheme * call <SID>OnColorSchemeChange()
    autocmd VimEnter * call <SID>OnColorSchemeChange()
augroup END

function! s:OnColorSchemeChange()
    highlight clear SignColumn      "signColumn should match background
    highlight clear LineNr          "lineNr matches background
    highlight clear CursorLineNr    "remove highlight color from the current line number
    highlight Cursor guibg=#268BD2
    highlight iCursor guibg=#268BD2
endfunction
" }}}

" Remember folds {{{
" --------------------------------------------------------------------------------
augroup RememberFolds
  autocmd!
  autocmd BufWinLeave *.ts,*.js,*.vim,*.java,*.py mkview
  autocmd BufWinEnter *.ts,*.js,*.vim,*.java,*.py silent! loadview
augroup END
" }}}

" Highlight word under cursor {{{
" Disabled in favor of vim-asterisk
" --------------------------------------------------------------------------------
" autocmd CursorMoved * exe printf('match Underlined /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" autocmd BufLeave,BufWinLeave,WinLeave * exe printf('match Normal /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" }}}

" Incremental search + search highlight {{{
" Disabled in favor of incsearch
" --------------------------------------------------------------------------------
" augroup vimrc-incsearch-highlight
"   autocmd!
"   autocmd CmdlineEnter [/\?] :set hlsearch
"   autocmd CmdlineLeave [/\?] :set nohlsearch
" augroup END
"  }}}

" Change cursor color based on mode {{{
" --------------------------------------------------------------------------------
augroup CursorColorMode
    autocmd!
    autocmd InsertLeave * call <SID>SetCursorColor('n')
    autocmd CursorHold * call <SID>SetCursorColor('n')
    autocmd InsertEnter * call <SID>SetCursorColor(v:insertmode)
augroup END

vnoremap <silent> <expr> <SID>SetCursorColorVisual <SID>SetCursorColor('v')
nnoremap <silent> <script> v v<SID>SetCursorColorVisual
nnoremap <silent> <script> V V<SID>SetCursorColorVisual
nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorColorVisual

" Sets the color based on the current mode
" Uses solarized colors: n - blue, i - green, r - red, v - magenta
function! s:SetCursorColor(mode)
    if a:mode == 'n'
        if has_key(s:, 'saved_updatetime')
            let &g:updatetime=s:saved_updatetime
        endif
        highlight Cursor guibg=#268BD2 ctermbg=2
        highlight iCursor guibg=#268BD2 ctermbg=2
    elseif a:mode == 'i'
        highlight Cursor guibg=#859900 ctermbg=4
        highlight iCursor guibg=#859900 ctermfg=4
    elseif a:mode == 'r'
        highlight Cursor guibg=#DC322F ctermbg=1
        highlight iCursor guibg=#DC322F ctermfg=1
    elseif a:mode == 'v'
        if &updatetime != 0
            let s:saved_updatetime = &updatetime
            silent set updatetime=0
        endif
        highlight Cursor guibg=#D33682 ctermbg=5
        highlight iCursor guibg=#D33682 ctermfg=5
    endif
    return ''
endfunction
" }}}

" Keep cursor position after exiting insert mode {{{
" - disabled because it interferes with vim-multiple-cursors
" --------------------------------------------------------------------------------
" augroup CursorPositionAfterInsert
"     autocmd!
"     autocmd InsertEnter * let s:cursorColumnI = col('.')
"     autocmd CursorMovedI * let s:cursorColumnI = col('.')
"     autocmd InsertLeave * if col('.') != s:cursorColumnI | call cursor(0, col('.') + 1) | endif
" augroup END
" }}}

" Number line settings {{{
" --------------------------------------------------------------------------------
autocmd FocusLost * :set norelativenumber
autocmd BufLeave * :set norelativenumber
autocmd InsertEnter * :set norelativenumber

autocmd FocusGained * :set relativenumber
autocmd BufEnter * :set relativenumber
autocmd InsertLeave * :set relativenumber
" }}}

" Crontab settings {{{
" --------------------------------------------------------------------------------
autocmd FileType crontab set nobackup nowritebackup
autocmd FileType crontab colorscheme vividchalk
" }}}

" Help settings {{{
" --------------------------------------------------------------------------------
autocmd FileType help setlocal nospell | setlocal number
" }}}

" Auto save on text changed {{{
" --------------------------------------------------------------------------------
function! s:AutoSave()
    if strlen(expand('%')) == 0 || strlen(&buftype) != 0
        return
    endif

    " Save the session to preserve any existing marks
    let w:winview = winsaveview()

    update

    if exists('w:winview')
        call winrestview(w:winview)
    endif
endfunction

autocmd InsertLeave,TextChanged,TextChangedI * call <SID>AutoSave()
" }}}

" Autoread (works with set autoread) {{{
" --------------------------------------------------------------------------------
autocmd FocusGained,BufEnter,BufWinEnter * :silent checktime
" }}}

" Overwrite tab width settings for some languages {{{
" The default tab settings are in vimrc
" --------------------------------------------------------------------------------
autocmd FileType coffee set tabstop=2 | set softtabstop=2 | set shiftwidth=2
autocmd FileType templatehtml set tabstop=2 | set softtabstop=2 | set shiftwidth=2
" }}}

" Keep clipboard contents on exit {{{
" --------------------------------------------------------------------------------
if executable("pbcopy")
    autocmd VimLeave * call system("echo -n " . shellescape(getreg("+")) . " | pbcopy")
elseif  !has("gui_running") && executable("xsel")
    autocmd VimLeave * call system("xsel -ib", getreg("+"))
endif
" }}}

" Git settings {{{
" --------------------------------------------------------------------------------
autocmd BufNewFile,BufRead .gitconfig.local setf gitconfig

autocmd FileType gitcommit set spell

if has("gui_running")
    autocmd FileType gitcommit set background=light
    autocmd FileType gitcommit colorscheme solarized
endif

function! s:CapitalizeFirstLetter()
    if &ft ==# 'gitcommit'
        if search('\v(%^|[.!?]\_s)\_s*%#',  'bcnw') != 0
            let v:char = toupper(v:char)
        endif
    endif
endfunction

" autocmd InsertCharPre * call <SID>CapitalizeFirstLetter()
" }}}

" Dust settings {{{
" - enable matchit for dust templates
" --------------------------------------------------------------------------------
autocmd FileType dustjs let b:match_words = '<:>,<\(\w\w*\):</\1,{:}'
" }}}

" Typescript settings {{{
" - make vim-commentary work properly in typescript.tsx files
" --------------------------------------------------------------------------------
autocmd FileType typescript.tsx setlocal commentstring=//\ %s
" }}}

" Proto settings {{{
" --------------------------------------------------------------------------------
autocmd FileType proto setlocal commentstring=//\ %s
" }}}

" Scss settings {{{
" --------------------------------------------------------------------------------
autocmd FileType scss setlocal iskeyword+=-
autocmd BufEnter,BufWinEnter *.scss setlocal syntax=scss
" }}}

" Yaml settings {{{
" --------------------------------------------------------------------------------
autocmd BufEnter,BufWinEnter *.yml,*.yaml setlocal syntax=yaml
" }}}

" No swap/backup for encrypted files {{{
" --------------------------------------------------------------------------------
if !has('nvim')
    autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
endif
" }}}

" Omni completion {{{
" --------------------------------------------------------------------------------
augroup omnicomplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal omnifunc=scsscomplete#CompleteSCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
