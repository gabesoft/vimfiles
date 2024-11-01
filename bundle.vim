" --------------------------------------------------------------------------------
"
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim plugin settings
" --------------------------------------------------------------------------------

" Incsearch + Anzu + Asterisk {{{
" --------------------------------------------------------------------------------
let g:incsearch#auto_nohlsearch = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  :call <SID>perform_search_n()<CR>
map N  :call <SID>perform_search_N()<CR>
map *  :call <SID>perform_search_star()<CR>
map g* <Plug>(asterisk-g*)<Plug>(incsearch-nohl)
map #  :call <SID>perform_search_sharp()<CR>
map g# <Plug>(asterisk-g#)<Plug>(incsearch-nohl)

function! s:config_fuzzyall(...) abort
    return extend(copy({
                \   'converters': [
                \     incsearch#config#fuzzy#converter(),
                \     incsearch#config#fuzzyspell#converter()
                \   ],
                \ }), get(a:, 1, {}))
endfunction

highlight default link SearchCurrent Cursor

if has("gui_running")
    highlight! link IncSearch Cursor
    highlight! link SearchCurrent Cursor
endif

function! s:perform_search_n()
    call feedkeys("\<Plug>(incsearch-nohl)")
    call feedkeys("\<Plug>(anzu-n-with-echo)")
    call s:perform_search_start()
endfunction

function! s:perform_search_N()
    call feedkeys("\<Plug>(incsearch-nohl)")
    call feedkeys("\<Plug>(anzu-N-with-echo)")
    call s:perform_search_start()
endfunction

function! s:perform_search_star()
    call feedkeys("\<Plug>(asterisk-z*)")
    call feedkeys("\<Plug>(incsearch-nohl)")
    call feedkeys("\<Plug>(anzu-star)")
    call s:perform_search_start()
endfunction

function! s:perform_search_sharp()
    call feedkeys("\<Plug>(asterisk-z#)")
    call feedkeys("\<Plug>(incsearch-nohl)")
    call feedkeys("\<Plug>(anzu-sharp)")
    call s:perform_search_start()
endfunction

function! s:perform_search_start()
    " expand any existing folds
    call feedkeys("zv")

    augroup perform-search
        autocmd!
        autocmd CursorMoved * call s:highlight_current_match()
    augroup END
endfunction

function! s:highlight_current_match_clear()
    if exists("w:current_match_id")
        call matchdelete(w:current_match_id)
        unlet w:current_match_id
    endif
    if exists("w:current_match_id_cursor")
        call matchdelete(w:current_match_id_cursor)
        unlet w:current_match_id_cursor
    endif
endfunction

function! s:highlight_current_match()
    call s:highlight_current_match_clear()
    let [bufnum, line_num, col_num, off] = getpos('.')
    let query = @/
    let query = substitute(query, '^\\<', '', '')
    let query = substitute(query, '\\>$', '', '')
    let pattern = '\m\%#\(\c' . query . '\m\)'
    let w:current_match_id = matchadd("SearchCurrent", pattern, 50)
    let w:current_match_id_cursor = matchadd("Cursor", '\v%#', 51)
    redraw
    augroup perform-search
        autocmd!
        autocmd CursorMoved * call s:highlight_current_match_clear()
    augroup END
endfunction

augroup vim-incsearch
    autocmd!
    autocmd User IncSearchEnter call s:highlight_current_match_clear()
augroup END

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

augroup vim-anzu
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
" }}}

" Bufferize https://github.com/AndrewRadev/bufferize.vim {{{
" --------------------------------------------------------------------------------
nnoremap <leader>me :Bufferize messages<CR>
nnoremap <leader>ma :Bufferize map<CR>
" }}}

" Vim-Sneak {{{
" no longer used
" --------------------------------------------------------------------------------
" let g:sneak#s_next = 1
" let g:sneak#use_ic_scs = 1

" hi link Sneak Search
" hi link SneakLabel Label
" hi link SneakScope Incsearch
" }}}

" Vim-Peekaboo {{{
" no longer used
" --------------------------------------------------------------------------------
" let g:peekaboo_window = 'vertical botright 50new'
" }}}

" cheat.sh-vim {{{
" --------------------------------------------------------------------------------
let g:CheatSheetFt='sh'
let g:CheatSheetStayInOrigBuf=0
" }}}

" Vim-Startify {{{
" --------------------------------------------------------------------------------
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 20
let g:startify_session_dir = '~/.vim/session'
let g:startify_custom_indices = [ 'a', 'c', 'd', 'f', 'g', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_custom_header = [
            \ '                ___                       ___      ',
            \ '               /\__\          ___        /\__\     ',
            \ '              /:/  /         /\  \      /::|  |    ',
            \ '             /:/  /          \:\  \    /:|:|  |    ',
            \ '            /:/__/  ___      /::\__\  /:/|:|__|__  ',
            \ '            |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ',
            \ '            |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ',
            \ '            |:|__/:/  /  \::/__/           /:/  /  ',
            \ '             \::::/__/    \:\__\          /:/  /   ',
            \ '              ~~~~         \/__/         /:/  /    ',
            \ '                                         \/__/     ',
            \ ]
" }}}

" FZF {{{
" --------------------------------------------------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Title'],
  \ 'fg+':     ['fg', 'Error', 'Special', 'Normal'],
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

" Use case insensitive search for Files and GFiles
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['-i']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['-i']}, <bang>0)

nnoremap <silent><Leader>ff :Files<CR>
nnoremap <silent><Leader>fg :GFiles<CR>
nnoremap <silent><Leader>fb :Buffers<CR>
nnoremap <silent><Leader>fl :BLines<CR>
nnoremap <silent><Leader>fr :Rg<CR>
nnoremap <silent><Leader>fu :History<CR>
nnoremap <silent><Leader>fh :History:<CR>
nnoremap <silent><Leader>fc :Commands<CR>
nnoremap <silent><Leader>fo :BCommits<CR>
nnoremap <silent><Leader>fm :Maps<CR>
nnoremap <silent><Leader>ft :Filetypes<CR>
nnoremap <silent><Leader>fw :Windows<CR>
nnoremap <F1> :Helptags<CR>
" }}}

" Prettier {{{
" --------------------------------------------------------------------------------
" let g:prettier#exec_cmd_path = 'node_modules/prettier'

" Prettier misbehaves in several ways
" - it clears all marks in all files
" - it fills the default register with 'x', see https://github.com/prettier/vim-prettier/issues/244
" function! RunPrettier()
"     " Save the session to preserve any existing marks
"     let w:winview = winsaveview()

"     silent Prettier

"     if exists('w:winview')
"         call winrestview(w:winview)
"     endif
" endfunction

" nmap <leader>py :call RunPrettier()<CR>
" }}}

" NERDTree {{{
" --------------------------------------------------------------------------------
let NERDTreeIgnore = ['\.pyc$', '\.rbc$', '\~$']
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 40
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeAutoDeleteBuffer=1
let g:NERDCustomDelimiters = { 'dustjs': { 'left': '{!', 'right': '!}' } }

" The default menu mapping is 'm' which interferes with setting marks
let g:NERDTreeMapMenu = 'D'

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>
" }}}

" Dirvish https://github.com/justinmk/vim-dirvish {{{
" When using the fish shell the commands should be run with ':sh %' instead of ':!%'
" --------------------------------------------------------------------------------
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
" }}}

" Vim-Javascript {{{
" --------------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_ngdoc = 0
" }}}

" EasyMotion {{{
" --------------------------------------------------------------------------------
let g:EasyMotion_keys = 'etuhonaspgcrlmkwjvqzbxyf'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
let g:EasyMotion_do_mapping = 0

map <leader>b <plug>(easymotion-b)
map <leader>w <plug>(easymotion-w)
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)
map f <plug>(easymotion-fl)
map F <plug>(easymotion-Fl)
map t <plug>(easymotion-tl)
map T <plug>(easymotion-Tl)

" }}}

" Fugitive - https://github.com/tpope/vim-fugitive {{{
" add to status line: set statusline+=%{fugitive#statusline()}
" F10: cd to the git root directory
" --------------------------------------------------------------------------------
nnoremap <F10> :Gcd<CR>:pwd<CR>
" }}}

" Rhubarb {{{
" --------------------------------------------------------------------------------
let g:github_enterprise_urls = ['https://slack-github.com']
"  }}}

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

" YouCompleteMe/TabNine {{{
" --------------------------------------------------------------------------------
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_key_detailed_diagnostics = ''
" let g:ycm_auto_hover = ''
" let g:ycm_semantic_triggers =  {
"             \ 'css'  : ['    ', '@', ':',  ': ', '!'],
"             \ 'scss' : ['    ', '@', ':',  ': ', '!']
"             \ }

" nmap <leader>d <plug>(YCMHover)
" }}}

" Deoplete + TabNine {{{
" --------------------------------------------------------------------------------
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#var('tabnine', {
" \ 'line_limit': 1500,
" \ 'max_num_results': 20,
" \ })

" Complete via tab
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}

" Vim-Over - https://github.com/osyo-manga/vim-over {{{
" --------------------------------------------------------------------------------
let g:over_enable_auto_nohlsearch = 1
let g:over_enable_cmd_window = 1
let g:over#command_line#search#enable_incsearch = 1
let g:over#command_line#search#enable_move_cursor = 0
let g:over#command_line#substitute#replace_pattern_visually = 1

nnoremap <Leader>sr :OverCommandLine<CR> %s/\<<C-R>=expand('<cword>')<CR>\>//g<Left><Left>
nnoremap <Leader>ss :OverCommandLine<CR> %s/
nnoremap <Leader>su :OverCommandLine<CR> %S/
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
  \ '--ignore-file'    : ['.ignore',''],
  \ '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],
  \ }

command! -nargs=? -complete=file Todo execute "Ags" 'TODO\|FIXME\|XXX\|HACK' <f-args>
nnoremap <Leader>as :<C-U>let cmd="Ags " . expand('<cword>') <bar> call histadd("cmd", cmd) <bar> execute cmd<CR>
vnoremap <Leader>as y:Ags<Space><C-R>='"' . escape(@", '"%#*?()[]{}.-') . '"'<CR><CR>
nnoremap <Leader>/ :Ags<Space>
nnoremap <Leader>ac :Ags --context 5<Space>
nnoremap <Leader>at :Ags --glob '*.<type>'<Space>
nnoremap <Leader>aq :AgsQuit<CR>
" }}}

" Vim-Operator-Flashy https://github.com/haya14busa/vim-operator-flashy {{{
" --------------------------------------------------------------------------------
let g:operator#flashy#flash_time = 200

" Keep in sink with OnColorSchemeChange
highlight! link Flashy Cursor

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
" }}}

" Abolish {{{
" --------------------------------------------------------------------------------
let g:abolish_save_file = expand($VIMHOME) . '/after/plugin/abolish.vim'
" }}}

" UltiSnips - https://github.com/SirVer/ultisnips/tree/master/UltiSnips {{{
" Edit   :UltiSnipsEdit
" Reload :call UltiSnips#RefreshSnippets()
" List   :call UltiSnips#ListSnippets()
"--------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = '<C-J>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsListSnippets = '<C-Q>'
let g:UltiSnipsSnippetsDir = expand($VIMHOME) . '/snips'
let g:UltiSnipsSnippetDirectories = [ expand($VIMHOME) . '/snips' ]
" }}}

" ArgTextObj - https://github.com/vim-scripts/argtextobj.vim {{{
" --------------------------------------------------------------------------------
let g:argumentobject_force_toplevel = 0
" }}}

" Tabularize {{{
" TODO maybe replace with https://github.com/junegunn/vim-easy-align
" --------------------------------------------------------------------------------
nmap <Leader>t= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>t= :Tabularize /^[^=]*\zs=<CR>gv
nmap <Leader>tE :Tabularize /^[^=]*\zs=/r0c0l0<CR>
vmap <Leader>tE :Tabularize /^[^=]*\zs=/r0c0l0<CR>gv
nmap <Leader>t: :Tabularize /^[^:]*\zs:<CR>
vmap <Leader>t: :Tabularize /^[^:]*\zs:<CR>gv
nmap <Leader>tC :Tabularize /^[^:]*\zs:/r0c0l0<CR>
vmap <Leader>tC :Tabularize /^[^:]*\zs:/r0c0l0<CR>gv
nmap <Leader>t/ :Tabularize /,\zs<CR>
vmap <Leader>t/ :Tabularize /,\zs<CR>gv
" }}}

" Nord {{{
" --------------------------------------------------------------------------------
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
if has("gui_running")
    let g:nord_italic_comments = 1
endif
" }}}

" Seoul 256 {{{
" --------------------------------------------------------------------------------
let g:seoul256_background = 235
let g:seoul256_light_background = 255
" }}}

" Lightline {{{
" --------------------------------------------------------------------------------
set noshowmode
set fillchars+=stl:\ ,stlnc:\ ,vert:\ 

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

function! s:get_lightline_colorscheme()
    let current_scheme = get(g:, 'colors_name', 'solarized')
    if current_scheme =~ "solarized" || !has("gui_running")
        if &background ==# 'light'
            return 'solarized_light'
        else
            return 'solarized_dark'
        endif
    else
        return current_scheme
    endif
endfunction

let g:lightline = {
            \ 'colorscheme': s:get_lightline_colorscheme(),
            \ 'mode_map': {
            \     'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
            \     'c': 'C', 's': 'S', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'T'
            \     },
            \ 'component': {
            \   'lineinfo': '%3l:%-2v',
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'anzu' ], [ 'readonly' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'winnum' ], [ 'relativepath' ]  ]
            \ },
            \ 'component_function' : {
            \   'modified'     : 'ModifiedStatusLine',
            \   'readonly'     : 'ReadonlyStatusLine',
            \   'fugitive'     : 'FugitiveStatusLine',
            \   'filename'     : 'FilenameStatusLine',
            \   'absolutepath' : 'AbsolutepathStatusLine',
            \   'relativepath' : 'RelativePathStatusLine',
            \   'filenameorrelativepath' : 'FilenameOrRelativePathStatusLine',
            \   'winnum'       : 'WinnrStatusLine',
            \   'fileformat'   : 'FileformatStatusLine',
            \   'filetype'     : 'FiletypeStatusLine',
            \   'fileencoding' : 'FileencodingStatusLine',
            \   'mode'         : 'ModeStatusLine',
            \   'anzu'         : 'anzu#search_status'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

augroup LightLineColorScheme
    autocmd!
    autocmd ColorScheme * call s:lightline_update()
    autocmd VimEnter * call s:lightline_update()
augroup END

function! s:lightline_update()
    if !exists('g:loaded_lightline')
        return
    endif
    try
        let g:lightline.colorscheme = s:get_lightline_colorscheme()
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    catch
    endtry
endfunction

function! ReadonlyStatusLine()
    if &readonly == 1
        return 'read-only'
    elseif &modifiable == 0
        return 'not-modifiable'
    else
        return ''
    endif
endfunction

function! FugitiveStatusLine()
    if exists('*fugitive#head') && (&ft == 'gitcommit' || &ft == 'fugitive')
        return FugitiveHead()
    endif
    return ''
endfunction

function! ModeStatusLine()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ &ft == 'agsv' ? 'AgsView' :
                \ &ft == 'agse' ? 'AgsEdit' :
                \ winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! RelativePathStatusLine()
    return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \  &ft == 'agsv' ? ags#get_status_string() :
                \  &ft == 'agse' ? ags#get_status_string() :
                \  &ft == 'nerdtree' ? NERDTreeRootPath() :
                \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
                \ ('' != ModifiedStatusLine() ? ' ' . ModifiedStatusLine() : '')
endfunction

function! FilenameStatusLine()
    return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \  &ft == 'agsv' ? ags#get_status_string() :
                \  &ft == 'agse' ? '' :
                \  &ft == 'nerdtree' ? NERDTreeRootName() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != ModifiedStatusLine() ? ' ' . ModifiedStatusLine() : '')
endfunction

function! NERDTreeRootPath()
    return exists('b:NERDTree') ? b:NERDTree.root.path.str() : ''
endfunction

function! NERDTreeRootName()
    return exists('b:NERDTree') ? fnamemodify(b:NERDTree.root.path.str(), ':t') : ''
endfunction

function! FilenameOrRelativePathStatusLine()
    return winwidth(0) > 100 ? RelativePathStatusLine() : FilenameStatusLine()
endfunction

function! AbsolutepathStatusLine()
    return &ft == 'nerdtree' ? 'NERDTree' : expand('%:p')
endfunction

function! ModifiedStatusLine()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : ''
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
let g:indentLine_concealcursor = ''
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|']

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
let g:indentLine_fileType = [ 'agsv', 'eruby', 'html', 'html.handlebars', 'java', 'javascript', 'json', 'less', 'nix', 'python', 'rails', 'ruby', 'scss', 'sh', 'templatehtml', 'vim', 'yaml', 'pyrex' ]
let g:indentLine_fileTypeExclude = [ 'text', 'gitcommit', 'agsv', 'agse' ]
" }}}

" Solarized (moved to .vimrc) {{{
" --------------------------------------------------------------------------------
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
" }}}

" NeoSolarized {{{
" --------------------------------------------------------------------------------
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "high"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "high"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
" }}}

" Vim-Rails - https://github.com/tpope/vim-rail://github.com/tpope/vim-rails {{{
" --------------------------------------------------------------------------------
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 0
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

" JSON Syntax {{{
" --------------------------------------------------------------------------------
let g:vim_json_conceal = 0
let g:vim_json_warnings = 0
" }}}

" Typescript mappings {{{
" <C-]>      <Plug>(TsuquyomiDefinition)
" <C-W>]     <Plug>(TsuquyomiSplitDefinition)
" <C-W><C-]> <Plug>(TsuquyomiSplitDefinition)
" <C-t>      <Plug>(TsuquyomiGoBack)
" <C-^>      <Plug>(TsuquyomiReferences)
" --------------------------------------------------------------------------------
autocmd Filetype typescript,typescriptreact nnoremap <buffer> gd :TsuDefinition<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
