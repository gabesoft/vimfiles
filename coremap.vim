" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim core key mappings
" --------------------------------------------------------------------------------

" visual shifting (does not exit visual mode) {{{
" --------------------------------------------------------------------------------
xnoremap < <gv
xnoremap > >gv
" }}}

" \ replaces , (since , is the leader) {{{
" --------------------------------------------------------------------------------
noremap \ ,
" }}}

" allow the . to execute once for each line of a visual selection {{{
" --------------------------------------------------------------------------------
xnoremap . :normal .<CR>
" }}}

" visual commands {{{
" --------------------------------------------------------------------------------
xnoremap $ $h
" }}}

" find merge conflict markers {{{
" --------------------------------------------------------------------------------
nmap <Leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" close all buffers and quit vim {{{
" --------------------------------------------------------------------------------
nmap ZZ :xa<CR>
" }}}

" buffer operations {{{
" --------------------------------------------------------------------------------
noremap <C-Tab> :bnext<CR>
noremap <S-C-Tab> :bprev<CR>
noremap <Leader>bl :ls<CR>
noremap <Leader>bt :b#<CR>
noremap <Leader>bn :bnext<CR>
noremap <Leader>bp :bprev<CR>
noremap <Leader>bd :bd<CR>
noremap <Leader>bw :w<CR>
" }}}

" indentation {{{
" --------------------------------------------------------------------------------
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
" }}}

" clipboard {{{
" --------------------------------------------------------------------------------
if has('clipboard')
    xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
endif
" }}}

" Map <Leader>fs to display all lines with keyword under cursor and ask which one to jump to {{{
" --------------------------------------------------------------------------------
nmap <Leader>fs [I:let nr = input("Which one: ")<bar>exe "normal " . nr ."[\t"<CR>
" }}}

" make Y consistent with C and D {{{
" --------------------------------------------------------------------------------
nnoremap Y y$
" }}}

" highlight last inserted text {{{
" --------------------------------------------------------------------------------
nnoremap gV `[v`]
" }}}

" moving lines {{{
" <ALT-j> move line or selected block down
" <ALT-k> move line or selected block up
" --------------------------------------------------------------------------------
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <ESC>:m+<CR>==gi
inoremap <A-k> <ESC>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" mac terminal specific
if OSX() && !has('gui_running')
    nnoremap j :m+<CR>==
    nnoremap k :m-2<CR>==
endif
" }}}

" prevent accidental undo in insert mode {{{
" --------------------------------------------------------------------------------
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
" }}}

" transpose characters insert mode {{{
" --------------------------------------------------------------------------------
inoremap <C-T> <ESC>hxpa
" }}}

" use <C-J> to split a line (<S-J> joins a line) {{{
" --------------------------------------------------------------------------------
nnoremap <NL> i<CR><ESC>
" }}}

" F3: insert timestamp {{{
" --------------------------------------------------------------------------------
nnoremap <F3> a<C-R>=strftime("%m/%d/%Y %I:%M %p")<CR><Esc>
inoremap <F3> <C-R>=strftime("%m/%d/%Y %I:%M %p")<CR>
" }}}

" F4: insert guid {{{
nnoremap <F4> a<C-R>=substitute(system("uuidgen"), '.$', '', 'g')<CR>
inoremap <F4> <C-R>=substitute(system("uuidgen"), '.$', '', 'g')<CR>
" }}}

" F5: remove trailing whitespace and empty lines (preserves cursor position) {{{
" --------------------------------------------------------------------------------
nnoremap <F5> :call TrimWhitespace()<CR>
" }}}

" F6: intent all lines (preserves cursor position) {{{
" --------------------------------------------------------------------------------
nnoremap <F6> v<ESC>gg=Ggvzz<ESC>
inoremap <F6> <ESC>gg=G``zz
vnoremap <F6> <ESC>gg=Ggvzz
" }}}

" F7: format json file {{{
" --------------------------------------------------------------------------------
nnoremap <F7> :%!python -m json.tool<CR>''zz<CR>
" }}}

" F9: cd to the git root directory {{{
" --------------------------------------------------------------------------------
" see bundle.vim
"}}}

" F10: compress empty lines (open folds before executing) {{{
" --------------------------------------------------------------------------------
nnoremap <F10> :call CompressEmptyLines()<CR>
" }}}

" F11: info about the highlight group for the word under cursor {{{
" --------------------------------------------------------------------------------
"nnoremap <F11> :echom "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <F11> <Plug>HiLinkTrace
" }}}

" F12: remove trailing ^M (preserves cursor position, insert with <C-V><C-M>) {{{
" --------------------------------------------------------------------------------
" nnoremap <F12> mzHmt:%s/<C-V><cr>//ge<cr>'tzt'z:delmarks zt<CR>
" }}}

" toggle folds in normal mode {{{
" -  space : toggle current fold
" - ,space : toggle all folds
" --------------------------------------------------------------------------------
"nnoremap <space> zA
"nnoremap <Leader><space> zi
" }}}

" horizontal scrolling {{{
" --------------------------------------------------------------------------------
map zl zL
map zh zH
" }}}

" command line {{{
" --------------------------------------------------------------------------------
cnoremap <C-A> <Home>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-y> <C-r>*
" }}}

" vim:foldmethod=marker:foldlevel=0
