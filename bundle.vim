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

" JsDoc {{{
" --------------------------------------------------------------------------------
let g:jsdoc_default_mapping = 0
" }}}

" Goyo {{{
" --------------------------------------------------------------------------------
let g:goyo_linenr = 1
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

" Neomru {{{
" --------------------------------------------------------------------------------
let g:neomru#do_validate = 1
let g:neomru#update_interval = 300
let g:neomru#file_mru_limit = 2000
" }}}

" Unite - https://github.com/Shougo/unite.vim {{{
" --------------------------------------------------------------------------------
let g:unite_enable_ignore_case = 1
let g:unite_enable_start_insert = 1
let g:unite_prompt = '» '
let g:unite_source_file_mru_long_limit = 7000
let g:unite_source_file_rec_max_cache_files = 200
let g:unite_source_file_rec_min_cache_files = 100
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 7000
let g:unite_source_rec_unit = 2500
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_cursor_line_time="0.10"

let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

if executable('pt')
    let g:unite_source_rec_async_command = 'pt --nogroup --nocolor -l ""'
    let g:unite_source_rec_command = 'pt --nogroup --nocolor -l ""'
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
elseif executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_source_rec_command = 'ag --nocolor --nogroup --hidden --ignore ".git" --ignore "node_modules" --ignore "tmp" --ignore "bower_components" -g ""'
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

call unite#custom#profile('default',  'context',  { 'cursor_line_highlight' : 'TabLineSel' })
call unite#custom#source('file_mru', 'ignore_pattern', 'COMMIT_EDITMSG')
call unite#custom#source(
            \ 'file,file_mru,neomru/file,file_rec,file_rec/async,file_rec/git,buffer',
            \ 'matchers', [ 'converter_relative_word', 'matcher_project_files', 'matcher_fuzzy' ])
call unite#custom#source(
            \ 'file,file_mru,neomru/file,file_rec,file_rec/async,file_rec/git,buffer',
            \'sorters', [ 'sorter_selecta'])
call unite#custom#source(
            \ 'file,file_mru,neomru/file,file_rec,file_rec/async,file_rec/git,buffer',
            \ 'max_candidates', 50)
call unite#custom#source(
            \ 'file,file_mru,neomru/file,file_rec,file_rec/async,file_rec/git',
            \ 'required_pattern_length', 2)
call unite#custom#source('buffer', 'required_pattern_length', 0)
call unite#custom#source(
            \ 'neomru/file', 'matchers',
            \ ['matcher_project_files', 'matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async', 'required_pattern_length', 1)

call unite#custom#source('history/yank,history/unite,line', 'matchers', [ 'matcher_fuzzy' ])
call unite#custom#source('history/yank,history/unite,line', 'sorters', [ 'sorter_selecta'])
call unite#custom#source('grep', 'matchers', [ 'matcher_fuzzy' ])
call unite#custom#source('grep', 'sorters', [ 'sorter_selecta'])

augroup Unite
    autocmd!
    autocmd FileType unite call s:unite_settings()
    autocmd BufLeave * if &ft ==# 'unite' | :highlight! default link CursorLine CursorLine | endif
augroup END

function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <buffer> <Tab> <Plug>(unite_complete)
    imap <buffer> <C-x> <Plug>(unite_exit)
    nmap <buffer> <C-x> <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    highlight! default link CursorLine TabLineSel
    setlocal number
endfunction

nnoremap <silent><C-l> : <C-u>Unite -no-split -buffer-name=files-async -start-insert -no-resize file_rec/async:!<CR>
nnoremap <silent><C-g> : <C-u>Unite -no-split -buffer-name=files-git   -start-insert -no-resize file_rec/git<CR>
nnoremap <silent><C-f> : <C-u>Unite -no-split -buffer-name=files-new   -start-insert -no-resize -resume file/new<CR>
nnoremap <silent><C-b> : <C-u>Unite -no-split -buffer-name=files-mru   -start-insert -no-resize buffer file_mru<CR>

nnoremap <silent><C-j> : <C-u>Unite -no-split -buffer-name=line     -start-insert -no-resize line:forward:wrap<CR>
nnoremap <silent><C-h> : <C-u>Unite -no-split -buffer-name=history  -start-insert -no-resize history/yank<CR>
nnoremap <silent><C-k> : <C-u>Unite -no-split -buffer-name=mappings -start-insert -no-resize mapping<CR>
nnoremap <silent><C-t> : <C-u>Unite -no-split -buffer-name=tmux     -start-insert -no-resize tmuxcomplete<CR>
nnoremap <silent><F1>  : <C-u>Unite -no-split -buffer-name=help     -start-insert -no-resize help<CR>
nnoremap <CR>          : <C-u>Unite -no-split -buffer-name=command  -start-insert -no-resize history/command command<CR>
" }}}

" vim-smartchr {{{
" --------------------------------------------------------------------------------
autocmd FileType vim
            \ inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' =~ ', ' == ', ' ==# ') |
            \ inoremap <buffer> <expr> ! smartchr#loop('!', ' != ') |
            \ inoremap <buffer> <expr> . smartchr#one_of('.', ' . ', '...') |
            \ inoremap <buffer> <expr> + smartchr#one_of('+', ' + ') |
            \ inoremap <buffer> <expr> - smartchr#one_of('-', ' - ') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ', ',')

autocmd FileType scss
            \ inoremap <buffer> <expr> : smartchr#one_of(': ',  ':') |
            \ inoremap <buffer> <expr> & smartchr#loop('&:', '&.', '&', '&&') |
            \ inoremap <buffer> <expr> + smartchr#one_of('+',  ' + ') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ',  ',') |
            \ inoremap <buffer> <expr> { smartchr#one_of(' {}<Esc>i<CR><CR><Esc>kS',  '{') |
            \ inoremap <buffer> <expr> - smartchr#one_of('-',  ' - ')

autocmd FileType javascript
            \ inoremap <buffer> <expr> = smartchr#loop(' = ', ' === ', ' == ', '=') |
            \ inoremap <buffer> <expr> ! smartchr#loop('!', ' !== ', ' != ') |
            \ inoremap <buffer> <expr> <bar> smartchr#one_of(' \|\| ', ' \| ', '\|') |
            \ inoremap <buffer> <expr> + smartchr#one_of(' + ', '+') |
            \ inoremap <buffer> <expr> - smartchr#one_of('-', ' - ') |
            \ inoremap <buffer> <expr> ? smartchr#one_of(' ? ', '?') |
            \ inoremap <buffer> <expr> : smartchr#one_of(' : ', ':') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ', ',') |
            \ inoremap <buffer> <expr> & smartchr#one_of(' && ', ' & ', '&')

autocmd FileType ruby,rails
            \ inoremap <buffer> <expr> = smartchr#loop(' = ', ' => ', ' == ', '=') |
            \ inoremap <buffer> <expr> ! smartchr#loop('!', ' != ') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ', ',')

autocmd FileType eruby,erb
            \ inoremap <buffer> <expr> > smartchr#loop('>', '%>') |
            \ inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=') |
            \ inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' => ', ' == ') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ', ',')

autocmd FileType java
            \ inoremap <buffer> <expr> + smartchr#one_of(' + ', '++', ' += ', '+') |
            \ inoremap <buffer> <expr> < smartchr#one_of(' < ', ' <= ',  ' << ', '<') |
            \ inoremap <buffer> <expr> > smartchr#one_of(' > ', ' >= ', ' >> ', '>') |
            \ inoremap <buffer> <expr> - smartchr#one_of(' - ', '-1', ' -= ', '--', '-') |
            \ inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', '=') |
            \ inoremap <buffer> <expr> <bar> smartchr#one_of(' \|\| ', ' \| ', '\|') |
            \ inoremap <buffer> <expr> & smartchr#one_of(' && ', ' & ', '&') |
            \ inoremap <buffer> <expr> ! smartchr#one_of('!', ' != ') |
            \ inoremap <buffer> <expr> % smartchr#one_of(' % ', '%') |
            \ inoremap <buffer> <expr> / smartchr#one_of(' / ', '/') |
            \ inoremap <buffer> <expr> * smartchr#one_of(' * ', '*') |
            \ inoremap <buffer> <expr> , smartchr#one_of(', ', ',')
" }}}

" accelerated-jk {{{
" --------------------------------------------------------------------------------
nmap <silent>j <Plug>(accelerated_jk_gj)
nmap gj j
nmap <silent>k <Plug>(accelerated_jk_gk)
nmap gk k
" }}}

" Ctrlp - https://github.com/kien/ctrlp.vim {{{
" --------------------------------------------------------------------------------
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$' }
let g:ctrlp_user_command =[ '.git', 'cd %s && git ls-files . -co --exclude-standard | sort | uniq', 'ag %s -l --nocolor --hidden -g ""' ]
let g:ctrlp_use_caching = 0
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

" Butane - https://github.com/Soares/butane.vim {{{
" --------------------------------------------------------------------------------
noremap <leader>bc :Bclose<CR>
" }}}

" CopyPath - https://github.com/vim-scripts/copypath.vim {{{
" --------------------------------------------------------------------------------
let g:copypath_copy_to_unnamed_register = 1
nnoremap <Leader>cp :CopyPath<CR>
nnoremap <Leader>cf :CopyFileName<CR>
" }}}

" EasyMotion - https://github.com/Lokaltog/vim-easymotion {{{
" --------------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz,.ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
" }}}

" Fugitive - https://github.com/tpope/vim-fugitive {{{
" add to status line: set statusline+=%{fugitive#statusline()}
" --------------------------------------------------------------------------------
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

" FuzzyFinder - https://github.com/vim-scripts/FuzzyFinder {{{
" --------------------------------------------------------------------------------
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap <Leader>ff :FufFile<CR>
" }}}

" Grep - https://github.com/vim-scripts/grep.vim" {{{
" --------------------------------------------------------------------------------
nnoremap <Leader>sf :Rgrep<CR>
nnoremap <Leader>sb :Bgrep<CR>
" }}}

" YouCompleteMe {{{
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

" Slime {{{
" To use link screen in a shell window
" > screen -S <name>
" > run repl
" --------------------------------------------------------------------------------
" C-c, C-c  - send selection to buffer (VISUAL MODE)
" C-c, v    - reconfigure options      (NORMAL MODE)
let g:slime_no_mappings = 1
" }}}

" Gundo {{{
" Displays the undo tree
" --------------------------------------------------------------------------------
" ,u        - toggle undo tree
nnoremap <Leader>u :GundoToggle<CR>
" }}}

" Ags (The Silver Searcher) {{{
" --------------------------------------------------------------------------------
let g:ags_edit_show_line_numbers = 1
let g:ags_no_stats = 1
let g:ags_stats_max_ln = 10000

command! -nargs=? -complete=file Todo execute "Ags" 'TODO\|FIXME\|XXX' <f-args>
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
set fillchars+=stl:\ ,stlnc:\

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
            \ 'colorscheme': 'solarized_' . &background,
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
            \ 'separator'    : { 'left': '⮀', 'right': '⮂' },
            \ 'subseparator' : { 'left': '⮁', 'right': '⮃' }
            \ }

augroup LightLineColorScheme
    autocmd!
    autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
    let g:lightline.colorscheme = 'solarized_' . &background
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
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ &ft == 'agsv' ? 'AgsView' :
                \ &ft == 'agse' ? 'AgsEdit' :
                \ winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! FilenameStatusLine()
    return ('' != ReadonlyStatusLine() ? ReadonlyStatusLine() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
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

" Tern {{{
" Install the tern server:
"   - cd bundle/tern_for_vim
"   - npm install
" Commands
" - TernDef    : Jump to the definition of the thing under the cursor.
" - TernType   : Find the type of the thing under the cursor.
" - TernDoc    : Look up the documentation of something.
" - TernRefs   : Show all references to the variable or property under the cursor.
" - TernRename : Rename the variable under the cursor.
" --------------------------------------------------------------------------------
let g:tern_show_argument_hints='no'
let g:tern_show_signature_in_pum=1
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
    autocmd VimEnter * RainbowParenthesesToggle
    for type in s:rainbow_whitelist
        exe 'autocmd Syntax '.type.' RainbowParenthesesLoadRound'
        exe 'autocmd Syntax '.type.' RainbowParenthesesLoadSquare'
        exe 'autocmd Syntax '.type.' RainbowParenthesesLoadBraces'
    endfor
augroup END
" }}}

" Delimitmate -https://github.com/Raimondi/delimitMate.git {{{
" --------------------------------------------------------------------------------
let delimitMate_autoclose = 1
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

" VimShell {{{
" --------------------------------------------------------------------------------
let g:vimshell_enable_transient_user_prompt = 1
let g:vimshell_force_overwrite_statusline = 0
let g:vimshell_interactive_update_time = 400
let g:vimshell_max_command_history = 100000 " default is 1000
let g:vimshell_prompt =  '$ '
let g:vimshell_scrollback_limit = 4000
let g:vimshell_split_command = 'split'
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'

autocmd FileType vimshell call s:vimshell_settings()

function! s:vimshell_settings()
    let g:vimshell_external_history_path = expand('~/.bash_history')

    let g:vimshell_execute_file_list = {}
    let g:vimshell_execute_file_list['zip'] = 'zipinfo'
    let g:vimshell_execute_file_list['rb'] = 'ruby'
    let g:vimshell_execute_file_list['pl'] = 'perl'
    let g:vimshell_execute_file_list['py'] = 'python'

    call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
    call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
    call vimshell#set_execute_file('bmp, jpg, png, gif',  'gexe eog')
    call vimshell#set_execute_file('mp3, m4a, ogg',  'gexe amarok')
    call vimshell#set_execute_file('tgz, gz',  'gzcat')
    call vimshell#set_execute_file('tbz, bz2',  'bzcat')

    inoremap <buffer><expr>'  pumvisible() ? "\<C-y>" : "'"

    imap <buffer><C-h>  <Plug>(vimshell_another_delete_backward_char)
    imap <buffer><C-k>  <Plug>(vimshell_zsh_complete)
    imap <buffer><C-g>  <Plug>(vimshell_history_neocomplete)

    nmap <buffer> j <Plug>(vimshell_next_prompt)
    nmap <buffer> k <Plug>(vimshell_previous_prompt)
    xmap <buffer> y <Plug>(operator-concealedyank)

    call vimshell#altercmd#define('u', 'cdup')
    call vimshell#altercmd#define('g', 'git')
    call vimshell#altercmd#define('i', 'iexe')
    call vimshell#altercmd#define('t', 'texe')
    call vimshell#set_alias('l.', 'ls -d .*')
    call vimshell#set_alias('gvim', 'gexe gvim')
    call vimshell#set_galias('L', 'ls -l')
    call vimshell#set_alias('.', 'source')

    call vimshell#set_alias('j', ':Unite -buffer-name=files
                \ -default-action=lcd -no-split -input=$$args directory_mru')
endfunction

autocmd FileType int-* call s:vimshell_iexe()
function! s:vimshell_iexe()
    nmap <buffer> j <Plug>(vimshell_int_next_prompt)
    nmap <buffer> k <Plug>(vimshell_int_previous_prompt)
endfunction

autocmd FileType term-* call s:terminal_settings()
function! s:terminal_settings()
    inoremap <silent><buffer><expr> <Plug>(vimshell_term_send_semicolon)
                \ vimshell#term_mappings#send_key(';')
    inoremap <silent><buffer><expr> j<Space>
                \ vimshell#term_mappings#send_key('j')

    iunmap <buffer> <Esc><Esc>
    imap <buffer> <Esc> <Plug>(vimshell_term_send_escape)
endfunction

let g:vimshell_escape_colors = [
            \ "#262626", "#ff3333", "#5f8700", "#b58900", "#268bd2", "#cc0066", "#2aa198", "#cccccc",
            \ "#003333", "#cc3300", "#4e4e4e", "#666666", "#999999", "#5f5faf", "#999999", "#ffffff"
            \ ]
" }}}

" Switch {{{
" --------------------------------------------------------------------------------
let g:switch_mapping = "<leader>-"
let s:switch_defs = {
            \ 'js_eq': [ '===', '!=='],
            \ 'js_item_comma': {
            \   '^\(\s\{-}\), \(.*\)': '\1  \2',
            \   '^\(\s\{-}\)\s\s\([^, ].*\)': '\1, \2'
            \ }
            \ }
autocmd FileType javascript let b:switch_custom_definitions =
            \ [
            \ s:switch_defs.js_eq,
            \ s:switch_defs.js_item_comma
            \ ]

" }}}

" Tmux-Complete {{{
" --------------------------------------------------------------------------------
let g:tmuxcomplete#trigger = 'omnifunc'
" }}}

" Quicktask {{{
" --------------------------------------------------------------------------------
let g:quicktask_no_mappings = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
