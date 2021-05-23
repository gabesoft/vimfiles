" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      vim core key mappings
" --------------------------------------------------------------------------------

" visual shifting (does not exit visual mode) {{{
" --------------------------------------------------------------------------------
xnoremap < <gv
xnoremap > >gv
" }}}

" join lines {{{
" --------------------------------------------------------------------------------
nnoremap gJ Jx
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
" nmap <Leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" Prevent default behavior for some keys {{{
" --------------------------------------------------------------------------------
"  Manual key
nnoremap K <nop>
vnoremap K <nop>
" }}}

" close all buffers and quit vim {{{
" --------------------------------------------------------------------------------
nmap <Leader>xa :xa<CR>
" }}}

" Keep the cursor position after indentation {{{
" https://vi.stackexchange.com/a/12372/23625
" --------------------------------------------------------------------------------
nnoremap = m'=
onoremap <expr> ap v:operator =~ '=' ? 'ap``' : 'ap'
onoremap <expr> ip v:operator =~ '=' ? 'ip``' : 'ip'
onoremap <expr> a} v:operator =~ '=' ? 'a}``' : 'a}'
onoremap <expr> i} v:operator =~ '=' ? 'i}``' : 'i}'
onoremap <expr> aB v:operator =~ '=' ? 'aB``' : 'aB'
onoremap <expr> iB v:operator =~ '=' ? 'iB``' : 'iB'
onoremap <expr> a] v:operator =~ '=' ? 'a]``' : 'a]'
onoremap <expr> i] v:operator =~ '=' ? 'i]``' : 'i]'
" }}}

" Indent entire buffer using formatprg {{{
" --------------------------------------------------------------------------------
function! PreserveCursor(command)
    let view = winsaveview()
    execute a:command
    call winrestview(view)
endfunction

nmap <Leader>py :call PreserveCursor("normal gggqG")<CR>
" }}}

" buffer operations {{{
" --------------------------------------------------------------------------------
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

" make Y consistent with C and D {{{
" --------------------------------------------------------------------------------
nnoremap Y y$
" }}}

" highlight last inserted text {{{
" --------------------------------------------------------------------------------
nnoremap gV `[v`]
" }}}

" moving lines {{{
" <CTRL-ALT-j> move line or selected block down
" <CTRL-ALT-k> move line or selected block up
" Can also be done via vim-unimpaired [e and ]e but
" the selection is not preserved in that case.
" --------------------------------------------------------------------------------
nnoremap <C-A-j> :m+<CR>==
nnoremap <C-A-k> :m-2<CR>==
inoremap <C-A-j> <ESC>:m+<CR>==gi
inoremap <C-A-k> <ESC>:m-2<CR>==gi
vnoremap <C-A-j> :m'>+<CR>gv=gv
vnoremap <C-A-k> :m-2<CR>gv=gv
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

" F1: fuzzy help (defined in bundle.vim) {{{
" --------------------------------------------------------------------------------
" nnoremap <F1> :Helptags<CR>
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

" F9: output all highlight groups {{{
" --------------------------------------------------------------------------------
" nnoremap <F9> :so $VIMRUNTIME/syntax/hitest.vim<CR>
" }}}

" F10: cd to the git root directory (defined in bundle.vim) {{{
" --------------------------------------------------------------------------------
" nnoremap <F10> :Gcd<CR>:pwd<CR>
"}}}

" F11: info about the highlight group for the word under cursor {{{
" --------------------------------------------------------------------------------
map <F11> <Plug>HiLinkTrace
" }}}

" F12: remove trailing ^M (preserves cursor position, insert with <C-V><C-M>) {{{
" --------------------------------------------------------------------------------
" nnoremap <F12> mzHmt:%s/<C-V><cr>//ge<cr>'tzt'z:delmarks zt<CR>
" }}}

"horizontal scrolling {{{
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

" Copy the path or name of the current buffer to unnamedplus {{{
" --------------------------------------------------------------------------------
"  copy path
nnoremap <Leader>cp :let @+=expand("%:p")<CR>
" copy file name
nnoremap <Leader>cf :let @+=expand("%:t")<CR>
" }}}

" Additional text objects mappings that navigate to the relevant region first {{{
" --------------------------------------------------------------------------------
"  <motion>f<c> would go to the next <c> and perform the motion
"  <motion>F<c> would go to the previous <c> and perform the motion
"  for example dif( would delete the contents of the next () pair

" Commented out in favor of function text objects
" onoremap af :<C-U>call <SID>NextTextObject('a', 'f')<CR>
" xnoremap af :<C-U>call <SID>NextTextObject('a', 'f')<CR>
" onoremap if :<C-U>call <SID>NextTextObject('i', 'f')<CR>
" xnoremap if :<C-U>call <SID>NextTextObject('i', 'f')<CR>
" onoremap aF :<C-U>call <SID>NextTextObject('a', 'F')<CR>
" xnoremap aF :<C-U>call <SID>NextTextObject('a', 'F')<CR>
" onoremap iF :<C-U>call <SID>NextTextObject('i', 'F')<CR>
" xnoremap iF :<C-U>call <SID>NextTextObject('i', 'F')<CR>

function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())

    if c ==# "b"
        let c = "("
    elseif c ==# "B"
        let c = "{"
    elseif c ==# "a"
        let c = "<"
    elseif c ==# "r"
        let c = "["
    endif

    exe "normal! ".a:dir.c."v".a:motion.c
endfunction

"  }}}

" vim:foldmethod=marker:foldlevel=0
