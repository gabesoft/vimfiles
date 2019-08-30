" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim plugin settings
" --------------------------------------------------------------------------------

" Incsearch + Anzu {{{
" --------------------------------------------------------------------------------
let g:incsearch#auto_nohlsearch = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
map N  <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzy#converter()],
                \   'modules': [incsearch#config#easymotion#module()],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

function! s:config_fuzzyall(...) abort
    return extend(copy({
                \   'converters': [
                \     incsearch#config#fuzzy#converter(),
                \     incsearch#config#fuzzyspell#converter()
                \   ],
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" }}}

" Bufferize https://github.com/AndrewRadev/bufferize.vim {{{
" --------------------------------------------------------------------------------
nnoremap <leader>me :Bufferize messages<CR>
nnoremap <leader>ma :Bufferize map<CR>
" }}}

" Vim-Sneak {{{
" --------------------------------------------------------------------------------
hi link Sneak Search
hi link SneakLabel Label
hi link SneakScope Incsearch
" }}}

" Vim-Peekaboo {{{
" --------------------------------------------------------------------------------
let g:peekaboo_window = 'vertical botright 50new'
" }}}

" Vim-Startify {{{
" --------------------------------------------------------------------------------
let g:startify_change_to_dir = 0
let g:startify_custom_indices = [ 'a', 'c', 'd', 'f', 'g', 'm', 'n', 'o', 'p', 'r' ]
" }}}

" FZF {{{
" --------------------------------------------------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Title'],
  \ 'fg+':     ['fg', 'Statement', 'Special', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Special'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let s:fzf_grep_cmd = 'rg
            \ --column
            \ --line-number
            \ --hidden
            \ --ignore-case
            \ --no-heading
            \ --color=always
            \ --ignore-file=.ignore
            \ --colors="match:fg:yellow"
            \ --colors="match:bg:black"
            \ --colors="path:fg:magenta"
            \ --colors="path:style:nobold"
            \ --colors="line:fg:green"
            \ --colors="line:style:nobold"
            \ --smart-case '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   s:fzf_grep_cmd.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent><c-f> :Files<CR>
nnoremap <silent><c-g> :GFiles<CR>
nnoremap <silent><c-b> :Buffers<CR>
nnoremap <silent><c-l> :BLines<CR>
nnoremap <silent><c-s> :Rg<CR>
nnoremap <silent><c-h> :History:<CR>

" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" Prettier {{{
" --------------------------------------------------------------------------------
let g:prettier#exec_cmd_path = 'node_modules/prettier'
nmap <leader>py <Plug>(Prettier)
" }}}

" NERDTree {{{
" --------------------------------------------------------------------------------
let NERDTreeIgnore = ['\.pyc$', '\.rbc$', '\~$']
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 35
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 0
let NERDTreeChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeAutoDeleteBuffer=1
let g:NERDCustomDelimiters = { 'dustjs': { 'left': '{!', 'right': '!}' } }

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>
" }}}

" NERDCommenter {{{
" --------------------------------------------------------------------------------
let NERDSpaceDelims = 1
" }}}

" Vim-Javascript {{{
" --------------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" }}}

" Syntastic {{{
" requires jsl for javascript
"     - download from http://www.javascriptlint.com/download.htm
" or  - brew install jslint
" or  - node install jshint -g
"       the config for jshint is at ~/.jshintrc, see http://www.jshint.com/docs/#options
" navigate errors with :lnext, :lprev (or [l, ]l via unimpaired)
" --------------------------------------------------------------------------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 0                 " don't display the error list at the bottom
let g:syntastic_always_populate_loc_list = 1      " update the location list when running the syntax checkers
" }}}

" CopyPath - https://github.com/vim-scripts/copypath.vim {{{
" --------------------------------------------------------------------------------
let g:copypath_copy_to_unnamed_register = 1
nnoremap <Leader>cp :CopyPath<CR>
nnoremap <Leader>cf :CopyFileName<CR>
" }}}

" EasyMotion - https://github.com/Lokaltog/vim-easymotion {{{
" <leader>f      - move to char
" <leader>w      - word motion forward
" <leader>ge     - word motion backward
" <leader>k      - jump to line up
" <leader>j      - jump to line down
" <ctrl>-<space> - jump to line
" --------------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz,.ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
nmap <C-Space> <Plug>(easymotion-sol-bd-jk)
nmap <M-Space> <Plug>(easymotion-s2)
" }}}

" Fugitive - https://github.com/tpope/vim-fugitive {{{
" add to status line: set statusline+=%{fugitive#statusline()}
" F9: cd to the git root directory
" --------------------------------------------------------------------------------
nnoremap <F9> :Gcd<CR>:pwd<CR>
" }}}

" Surround - https://github.com/tpope/vim-surround {{{
" --------------------------------------------------------------------------------
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('!')} = "<!-- \r -->"
let g:surround_{char2nr('s')} = " \r "
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1
" }}}

" Grep - https://github.com/vim-scripts/grep.vim" {{{
" --------------------------------------------------------------------------------
nnoremap <Leader>sf :Rgrep<CR>
nnoremap <Leader>sb :Bgrep<CR>
" }}}

" YouCompleteMe/TabNine {{{
" --------------------------------------------------------------------------------
let g:acp_enableAtStartup = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers =  {
            \ 'css'  : ['    ', '@', ':',  ': ', '!'],
            \ 'scss' : ['    ', '@', ':',  ': ', '!']
            \ }
" }}}

" Vim-Over - https://github.com/osyo-manga/vim-over {{{
" --------------------------------------------------------------------------------
nnoremap <Leader>sr :OverCommandLine<CR> %s/\<<C-R><C-W>\>//g<Left><Left>
nnoremap <Leader>ss :OverCommandLine<CR> %s/
nnoremap <Leader>su :OverCommandLine<CR> %S/
" }}}

" Abolish {{{
" --------------------------------------------------------------------------------
let g:abolish_save_file = expand($VIMHOME) . '/after/plugin/abolish.vim'
" }}}

" UltiSnips - https://github.com/SirVer/ultisnips/tree/master/UltiSnips {{{
" --------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = '<C-J>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsListSnippets = '<C-Q>'
let g:UltiSnipsSnippetsDir = expand($VIMHOME) . '/snips'
let g:UltiSnipsSnippetDirectories = [ 'snips' ]
" }}}

" ArgTextObj - https://github.com/vim-scripts/argtextobj.vim {{{
" --------------------------------------------------------------------------------
let g:argumentobject_force_toplevel = 0
" }}}

" Ags {{{
" --------------------------------------------------------------------------------
let g:ags_edit_show_line_numbers = 1
let g:ags_no_stats = 1
let g:ags_stats_max_ln = 10000
let g:ags_enable_async = 1

let g:ags_agexe = 'rg'
let g:ags_agargs = {
  \ '--column'         : ['', ''],
  \ '--line-number'    : ['', ''],
  \ '--before-context' : ['0', '-B'],
  \ '--after-context'  : ['1', '-A'],
  \ '--max-count'      : ['g:ags_agmaxcount', ''],
  \ '--heading'        : ['',''],
  \ '--smart-case'     : ['','-S'],
  \ '--color'          : ['always',''],
  \ '--colors'         : ['"match:fg:green" --colors="match:bg:black" --colors="match:style:nobold" --colors="path:fg:red" --colors="path:style:bold" --colors="line:fg:black" --colors="line:style:bold"',''],
  \ }

command! -nargs=? -complete=file Todo execute "Ags" 'TODO\|FIXME\|XXX\|HACK' <f-args>
nnoremap <Leader>s :Ags<Space><C-R>=expand('<cword>')<CR><CR>
vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
nnoremap <Leader>a :Ags<Space>
nnoremap <Leader><Leader>a :AgsQuit<CR>
" }}}

" Tabularize {{{
" --------------------------------------------------------------------------------
nmap <Leader>te :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>te :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>tE :Tabularize /^[^=]*\zs=/r0c0l0<CR>
vmap <Leader>tE :Tabularize /^[^=]*\zs=/r0c0l0<CR>
nmap <Leader>tc :Tabularize /^[^:]*\zs:<CR>
vmap <Leader>tc :Tabularize /^[^:]*\zs:<CR>
nmap <Leader>tC :Tabularize /^[^:]*\zs:/r0c0l0<CR>
vmap <Leader>tC :Tabularize /^[^:]*\zs:/r0c0l0<CR>
nmap <Leader>tm :Tabularize /,\zs<CR>
vmap <Leader>tm :Tabularize /,\zs<CR>
" }}}

" Lightline {{{
" --------------------------------------------------------------------------------
set noshowmode
set fillchars+=stl:\ ,stlnc:\ ,vert:\ 

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'mode_map': { 'c': 'NORMAL' },
            \ 'component': {
            \   'lineinfo': '⭡ %3l:%-2v',
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'absolutepath', 'winnum' ] ]
            \ },
            \ 'component_function' : {
            \   'modified'     : 'ModifiedStatusLine',
            \   'readonly'     : 'ReadonlyStatusLine',
            \   'fugitive'     : 'FugitiveStatusLine',
            \   'filename'     : 'FilenameStatusLine',
            \   'absolutepath' : 'AbsolutepathStatusLine',
            \   'winnum'       : 'WinnrStatusLine',
            \   'fileformat'   : 'FileformatStatusLine',
            \   'filetype'     : 'FiletypeStatusLine',
            \   'fileencoding' : 'FileencodingStatusLine',
            \   'mode'         : 'ModeStatusLine'
            \ },
            \ 'separator'    : { 'left': '', 'right': '' },
            \ 'subseparator' : { 'left': '', 'right': '' }
            \ }

augroup LightLineColorScheme
    autocmd!
    autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
    let g:lightline.colorscheme = 'solarized'
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

function! ReadonlyStatusLine()
    return &readonly ? '⭤' : ''
endfunction

function! FugitiveStatusLine()
    if exists('*fugitive#head') && &ft != 'nerdtree' && &ft != 'agsv'
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! ModeStatusLine()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ &ft == 'agsv' ? 'AgsView' :
                \ &ft == 'agse' ? 'AgsEdit' :
                \ winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! FilenameStatusLine()
    return ('' != ReadonlyStatusLine() ? ReadonlyStatusLine() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \  &ft == 'agsv' ? ags#get_status_string() :
                \  &ft == 'agse' ? '' :
                \  &ft == 'nerdtree' ? '' :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != ModifiedStatusLine() ? ' ' . ModifiedStatusLine() : '')
endfunction

function! AbsolutepathStatusLine()
    return &ft == 'nerdtree' ? 'NERDTree' : expand('%:p')
endfunction

function! ModifiedStatusLine()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! WinnrStatusLine()
    return winnr()
endfunction

function! FileformatStatusLine()
    return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! FiletypeStatusLine()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! FileencodingStatusLine()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
" }}}

" IndentLine {{{
" --------------------------------------------------------------------------------
let g:indentLine_noConcealCursor = 1
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

if &background == 'dark'
    let g:indentLine_color_gui = '#073642'
    let g:indentLine_color_term = 000
else
    let g:indentLine_color_gui = '#eee8d5'
    let g:indentLine_color_term = 254
endif

augroup IndentLineColorScheme
    autocmd!
    autocmd ColorScheme * call s:indentLine_update()
augroup END

function! s:indentLine_update()
    if &background == 'dark'
        let g:indentLine_color_gui = '#073642'
        let g:indentLine_color_term = 000
    else
        let g:indentLine_color_gui = '#eee8d5'
        let g:indentLine_color_term = 254
    endif
    call lightline#highlight()
endfunction

let g:indentLine_color_tty_light = 7
let g:indentLine_color_tty_dark  = 1
let g:indentLine_fileType = [ 'agsv', 'eruby', 'html', 'html.handlebars', 'java', 'javascript', 'json', 'rails', 'ruby', 'scss', 'sh', 'vim', 'yaml' ]
let g:indentLine_fileTypeExclude = [ 'text', 'gitcommit' ]
" }}}

" Solarized (moved to .vimrc) {{{
" --------------------------------------------------------------------------------
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
" }}}

" Git Gutter - https://github.com/airblade/vim-gitgutter {{{
" --------------------------------------------------------------------------------
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified='|'
let g:gitgutter_sign_modified_removed='|'
" }}}

" Vim-Rails - https://github.com/tpope/vim-rail://github.com/tpope/vim-rails {{{
" --------------------------------------------------------------------------------
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 0
" }}}

" Rainbow Parentheses - https://github.com/gabesoft/rainbow_parentheses.vim.git {{{
" --------------------------------------------------------------------------------
let g:rbpt_hi_links = [
            \ 'vimCmdSep',
            \ 'Title',
            \ 'gitCommitUnmerged',
            \ 'Constant',
            \ 'Identifier',
            \ 'Statement',
            \ 'Type',
            \ 'Underlined',
            \ 'Question',
            \ 'vimCmdSep',
            \ 'Title',
            \ 'gitCommitUnmerged',
            \ 'Constant',
            \ 'Identifier',
            \ 'Statement',
            \ 'Type'
            \ ]

 let s:rainbow_whitelist = [
             \ 'css',
             \ 'java',
             \ 'javascript',
             \ 'less',
             \ 'lisp',
             \ 'rails',
             \ 'ruby',
             \ 'scheme',
             \ 'scss',
             \ 'sh',
             \ 'vim'
            \ ]

augroup rainbow_parenthesis
    autocmd!
    autocmd VimEnter * RainbowParentheses!!
    for type in s:rainbow_whitelist
        exe 'autocmd Syntax '.type.' RainbowParentheses'
    endfor
augroup END
" }}}

" SplitJoin {{{
" --------------------------------------------------------------------------------
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gJ :silent SplitjoinJoin<CR>
nnoremap gS :silent SplitjoinSplit<CR>
" }}}

" Clever-f {{{
" --------------------------------------------------------------------------------
nmap <F12> <Plug>(clever-f-reset)
let g:clever_f_repeat_last_char_inputs = ["\<CR>", "\<Tab>"]
let g:clever_f_across_no_line=0
" }}}

" Committia {{{
" --------------------------------------------------------------------------------
let g:committia_open_only_vim_starting = 1
let g:committia_min_window_width = 120
let g:committia_use_singlecolumn = 'fallback'
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    setlocal spell
    setlocal number
    setlocal relativenumber

    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    endif

    imap <buffer> <C-n> <Plug>(committia-scroll-diff-down-half)
    nmap <buffer> <C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer> <C-p> <Plug>(committia-scroll-diff-up-half)
    nmap <buffer> <C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

function! g:committia_hooks.status_open(info)
    setlocal number
    setlocal relativenumber
endfunction

function! g:committia_hooks.diff_open(info)
    setlocal number
    setlocal relativenumber
endfunction
" }}}

" MatchTagAlways {{{
" --------------------------------------------------------------------------------
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
let g:mta_filetypes = {
            \ 'html'            : 1,
            \ 'xhtml'           : 1,
            \ 'xml'             : 1,
            \ 'jinja'           : 1,
            \ 'erb'             : 1,
            \ 'eruby'           : 1,
            \ 'html.handlebars' : 1
            \ }
highlight default link MatchTag Underlined
autocmd BufEnter,BufWinEnter *.hbs,*.erb nmap <buffer> % :MtaJumpToOtherTag<cr>
" }}}

" Vim after object {{{
" --------------------------------------------------------------------------------
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" }}}

" vim:foldmethod=marker:foldlevel=0
