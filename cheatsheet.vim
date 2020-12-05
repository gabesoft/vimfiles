" Vim Cheat Sheet
" ------------------------------------------------------------------------------

" Settings Info: {{{
" Determine which script set a particular option.
"
" To check which script set the file type last
" :verbose set ft ?
"
" To open the default filetype file run
" :e $VIMRUNTIME\filetype.vim
" :e $VIMRUNTIME\ftplugin
"
" To find out which scripts have been loaded
" :scriptnames

" Function Keys: {{{
" ------------------------------------------------------------------------------
" <F1>  fuzzy search help
" <F3>  insert timestamp
" <F4>  insert guid
" <F5>  remove trailing whitespace
" <F6>  intent all lines (can be done with =ae also)
" <F7>  format json file
" <F9>  output all highlight groups
" <F10> cd to the git root directory
" <F11> show the highlight group of the word under cursor
" <F12> remove trailing ^M (preserves cursor position, insert with " <C-V><C-M>)
" }}}

" File Formatting: {{{
" ------------------------------------------------------------------------------
" gg=G or F6 or =ae  : format entire file
" =<motion>          : format according to motion (eg =ip to format a paragraph)
" [count]==          : format <count> lines
" {Visual}=          : format the visual selection
" }}}

" Navigation: {{{
" ------------------------------------------------------------------------------
" :jumps      : see entire jumplist
" <C-o>       : jump backward in the jumplist
" <C-i>       : jump forward in the jumplist
" ''          : jump to previous location
"
" :changes    : see entire changelist
" g;          : jump backward in the changelist
" g,          : jump forward in the changelist
" gd          : jump to variable declaration (Goto Declaration)
" gD          : jump to global variable declaration
" gf          : jump to the file under cursor (Goto File)
"
" [{          : jump to start { in current block
" ]}          : jump to end { in current block
" {           : jump to beginning of current paragraph
" }           : jump to end of current paragraph
" (           : jump to beginning of current sentence
" )           : jump to end of current sentence
" }}}

" Code Navigation: {{{
" ------------------------------------------------------------------------------
" use ctags   : ctags -R . (run in shell - creates a tags file with ctags)
"             : run :set tags=/path/to/tags in vim to source the tags file
" <C-]>       : jump to definition
" <C-T>       : jump back to previous location
" }}}

" Editing Motions: {{{
" ------------------------------------------------------------------------------
" s           : replace a character (insert mode)
" r           : replace a character (command mode)
" R           : enter replace mode
"
" w|W         : move to the beginning of the next word|WORD
" b|B         : move to the beginning of the previous word|WORD
" e|E         : move to the end of the word|WORD
"
" c <motion>  : change according to motion
" c/<pat>/    : change until pat
" c/<pat>/e   : change until end pat
" cw          : change word
" C           : change the rest of the line
"
" d <motion>  : delete according to motion
" d/<pat>/    : delete until pattern
" dw          : delete word
" D           : delete the rest of the line
"
" x           : delete the char under cursor and stay in normal mode
" s           : delete the char under cursor and enter insert mode
" S           : change the entire line
"
" y <motion>  : yank according to motion
" y/<pat>/    : yank until pat
"
" J           : merge current line with the one below
"
" xp          : transpose characters
" }}}

" Pasting: {{{
" ------------------------------------------------------------------------------
" p           : paste content after the character under cursor (or line)
" P           : paste content before the character under cursor (or line)
" C-R-"a      : paste on the command line from register a
" "1pu.u. etc : cycle through the contents of the deletion buffers
" }}}

" Entire Lines: {{{
" ------------------------------------------------------------------------------
" yy          : copy entire line
" dd          : delete entire line
" cc          : change entire line
" }}}

" Undoing Changes: {{{
" ------------------------------------------------------------------------------
" u           : undo last change
" g-          : navigate backward through branch changes
" g+          : navigate forward through branch changes
" }}}

" Marks: {{{
" ------------------------------------------------------------------------------
" ma          : mark a
" 'a          : recall mark a (goes to the beginning of the line)
" `a          : recall mark a (goes to the exact location where the mark was set)
" }}}

" Macros: {{{
" ------------------------------------------------------------------------------
" qa          : start recording macro into register a
" q           : end recording if any in progress
" @a          : run macro recorded from register a
" @@          : run last macro
" }}}

" Capitalizing: {{{
" ------------------------------------------------------------------------------
" gU          : make upper case
" gu          : make lower case
" }}}

" Folding Commands: {{{
" ------------------------------------------------------------------------------
" zf#j        : creates a fold from the cursor down # lines
" zf          : creates a fold for the selected lines (visual mode)
" zf'a        : creates a fold from current cursor position to mark a
" zf/string   : creates a fold from the cursor to string
" zj          : moves the cursor to the next fold
" zk          : moves the cursor to the previous fold
" zo          : opens a fold at the cursor
" zO          : opens all folds at the cursor
" zc          : closes a fold
" zm          : increases the foldlevel by one
" zM          : closes all open folds
" zn          : open all folds
" zN          : reset folds to previous state (reverse of zn)
" zr          : decreases the foldlevel by one
" zR          : decreases the foldlevel to zero -- all folds will be open
" zd          : deletes the fold at the cursor
" zE          : deletes all folds
" [z          : move to start of open fold
" ]z          : move to end of open fold
" }}}

" Word Processor: {{{
" ------------------------------------------------------------------------------
" z=          : spelling suggestions (also cos with vim-unimpaired)
" [s          : previous misspelling
" ]s          : next misspelling
" zg          : add current word to dictionary
" zug         : undo adding current word to dictionary
" :wp         : enter word processing mode
" gqap        : format current paragraph
" gggqG       : format all text in current file
" }}}

" Abbreviations: {{{
" ------------------------------------------------------------------------------
"  ab         : list all abbreviations
"  una <abbr> : remove abbr from the abbreviations list
"  abc        : clear all abbreviations
"  <abbr><C-V>: avoid abbreviation expansion
"  }}}

" Numbers: {{{
" ------------------------------------------------------------------------------
" C-A         : increment the number under cursor
" C-X         : decrement the number under cursor
" }}}

" Statistics: {{{
" g<C-G>      : stats about the selected region (visual mode)
" }}}

" Autocompletion: {{{
" ------------------------------------------------------------------------------
" C-N         : search a matching word forward
" C-P         : search a matching word backward
" C-X C-K     : dictionary completion (a dictionary file needs to be set up)
" C-X C-O     : omni completion
" }}}

" Movement: {{{
" ------------------------------------------------------------------------------
" zt          : move the line with cursor to top
" zz          : move the line with cursor to middle
" zb          : move the line with cursor to bottom
" }}}

" Diff Files: {{{
" ------------------------------------------------------------------------------
" vert diffsplit file.v2 (after opening file.v1) to compare v1 with v2
" ]c          : go to start of next change
" [c          : go to start of previous change
" :diffoff    : end diff mode
" :diffthis   : turn on diff mode (the two files to be diffed should be opened)
" }}}

" Windows: {{{
" ------------------------------------------------------------------------------
" :vsplit     : split vertically
" :split      : split horizontally
" :q          : close current active window
" :only       : close all split windows except the active one

" Window Navigation
" ------------------------------------------------------------------------------
" <C-W> h : leaft
" <C-W> l : right
" <C-W> j : down
" <C-W> k : up
" {nr}-   : go to window number {nr}
"  -      : go to last accessed window
" <C-W> p : go to last accessed window
" <C-W> w : go to next window
" <C-W> W : go to prev window
" <C-W> t : go to top window
" <C-W> b : go to bottom window

" Window Creation
" ------------------------------------------------------------------------------
" <C-W> s : horizontal split
" <C-W> v : vertical split
" <C-W> n : create a new window (same as horizontal split but with a new buffer)
" :new    : create a new window (same as horizontal split but with a new buffer)
" :vne    : create a new window (vertical)

" Window Closing
" ------------------------------------------------------------------------------
" <C-W> q : close the current window
" <C-W> o : close all windows except the current one

" Window Moving
" <C-W> r : rotate windows down/right  within a column/row of windows
" <C-W> R : rotate windows up/left within a column/row of windows
" <C-W> x : exchange the current window with the next one
" <C-W> K : move the current window to the far top
" <C-W> J : move the current window to the far bottom
" <C-W> H : move the current window to the far left
" <C-W> L : move the current window to the far right
" {nr}_   : swap current window with the window number {nr}

" Window Resizing
" ------------------------------------------------------------------------------
" <C-W> =   : make all windows equal
" <C-W> -   : decrease current heigth by 1/N
" <C-W> _   : maximize current window in heigth
" <C-W> |   : maximize current window in width
" z{nr}<CR> : set current heigth to {NR}
" <Up>      : adjust current heigth vertically
" <Down>    : adjust current heigth vertically
" <Left>    : adjust current heigth horizontally
" <Rigt>    : adjust current heigth horizontally
" }}}

" Text Objects: {{{
" related blogs:
" - https://codeinthehole.com/tips/vim-text-objects/
" - https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
" editing command structure:
" <number><command:change/delete/yank/select><text-object or motion>
" text-object:
" - a<object>: outer object (including surrounding whitespace or brackets)
" - i<object>: inner object
" ------------------------------------------------------------------------------
" w : word
" W : WORD
" s : sentence
" p : paragraph
" " : double quoted string
" ' : single quoted string
" ` : backticked string
" ) : parenthesized region (also '(' or 'b')
" ] : bracketed region (also '[' or 'r')
" } : braced region (also '{' or 'B')
" > : single tag region (also '<' or a)
" t : html/xml tag
" l : line (via kana/vim-textobj-line)
" e : entire buffer (via kana/vim-textobj-entire)
" i : an indented block (via kana/vim-textobj-indent)
" c : an comment block (via glts/vim-textobj-comment)
" }}}

" Ex Editor Commands: {{{
" multiple can be separated by |
" ------------------------------------------------------------------------------
" :% g|v/re/d|s|m|j|t
" - g all lines matching regex
" - v all lines not matching regex
" - d delete, s substitute, m move, j join, t copy
"   - m and t expect an address where to move/copy the selected lines
"   - ex m$, t4
" - line addresses:
"   - % = all
"   - . = current
"   - $ = last
"   - 1 = first
"   - x,y = from x to y
"   - .-2 = 2 lines above current
" examples:
" :% g/foo/d
"   - delete all lines containing 'foo'
" :% g/^foo/m$
"   - move all lines that start with 'foo' to the end of the file
" :% g/foo/s/bar/zz/g
"   - substitute 'zz' for 'bar' in all lines containing 'foo'
"
" :r  <fname> : insert the contents of a file named at the current line
" :r! <cmd>   : insert the contents of a shell command at the current line

" q:          : command history (press enter to exit or select command)
" q/          : search history
"
" execute a vim command from the current buffer
" ------------------------------------------------------------------------------
" - copy the command and run :@"
"
" regexes
" ------------------------------------------------------------------------------
" replace patterns of form word1, word2 with word2, word1
" %s/\(\w\+\),\(\s\+\)\?\(\w\+\)/\3, \1/gc

" macros
" ------------------------------------------------------------------------------
"0A jj80a-kb jji//jj077lhdwj0
":runtime ~/vkb.vim/indent /kbkb/javascript.vim,ek6
" }}}

" Indentation: {{{
" ------------------------------------------------------------------------------
" re-indent = indent according to the indentation rules
"
" >>   indent line by shiftwidth spaces
" <<   de-indent line by shiftwidth spaces
" 5>>  indent 5 lines
" 5==  re-indent 5 lines
"
" >%   increase indent of a braced or bracketed block (place cursor on brace first)
" =%   reindent a braced or bracketed block (cursor on brace)
" <%   decrease indent of a braced or bracketed block (cursor on brace)
" ]p   paste text, aligning indentation with surroundings
"
" =i{  re-indent the 'inner block', i.e. the contents of the block
" =a{  re-indent 'a block', i.e. block and containing braces
" =2a{ re-indent '2 blocks', i.e. this block and containing block
" =6   re-indent from cursor to line 6
"
" >i{  increase inner block indent
" <i{  decrease inner block indent
" }}}

" Plugins: {{{
" ------------------------------------------------------------------------------
" EasyMotion
" <EasyMotion_lader_key>w       : word motion
" <EasyMotion_lader_key>W       : W motion
" <EasyMotion_lader_key>t       : t motion
" <EasyMotion_lader_key>T       : T motion
" <EasyMotion_lader_key>f       : f motion
" <EasyMotion_lader_key>F       : F motion
" <EasyMotion_lader_key>b       : b motion
" <EasyMotion_lader_key>B       : B motion
" <EasyMotion_lader_key>e       : e motion
" <EasyMotion_lader_key>E       : E motion
" <EasyMotion_lader_key>ge      : ge motion
" <EasyMotion_lader_key>gE      : gE motion
" <EasyMotion_lader_key>j       : j motion
" <EasyMotion_lader_key>k       : k motion
" <EasyMotion_lader_key>n       : n motion
" <EasyMotion_lader_key>N       : N motion

" UltiSnips
" <C-J>         : trigger snippet & navigate forward
" <C-K>         : navigate backward
" <C-Q>       : list snippets

" NERDCommenter
" <LEADER>cc    : comment line
" <LEADER>cu    : uncomment line
" <LEADER>ci    : toggle comment
" <LEADER>cA    : append comment at the end and go to insert mode

" NERDTree
" <LEADER>nt    : nerd tree toggle
" <LEADER>nf    : nerd tree find
" <LEADER>nc    : nerd tree close

" Ctrlp
" <LEADER>t     : run Ctrlp
" <C-F>         : navigate modes forward
" <C-B>         : navigate modes backward

" FuzzyFinder
" <LEADER>fb    : find buffers
" <LEADER>ff    : find files

" Surround
" cs<d1><d2>    : change delimiter d1 to d2 (ie cs"')
" ds<d1>        : remove delimiter d1 (ie ds")
" ysiw<d1>      : wrap word in delimiter d1
" yss<d1>       : wrap entire line in delimiter d1
" S<d1>         : wrap visual selection in delimiter d1 (visual mode)

" ExpandRegion
" + expand
" _ shrink

" Slime
" To use link screen in a shell window
" > screen -S <name>
" > run repl
" --------------------------------------------------------------------------------
" C-c, C-c  - send selection to buffer (VISUAL MODE)
" C-c, v    - reconfigure options      (NORMAL MODE)

" Scratch
" Open a scratch buffer
" --------------------------------------------------------------------------------
" :Scratch  - open the scratch buffer
" :Sscratch - open the scratch buffer in a split window

" VimVerticalMove
" Vertical move keeping the cursor on the same column
" --------------------------------------------------------------------------------
" :Scratch  - open the scratch buffer
" <LEADER>[     : move up
" <LEADER>]     : move down

" Ag
" Search in files using the_silver_searcher
" --------------------------------------------------------------------------------
" Invoke :Ag [options] {pattern} [{directory}]
"
" e    : open file and close the quickfix window
" o    : open (same as enter)
" go   : preview file (open but maintain focus on ag.vim results)
" t    : open in new tab
" T    : open in new tab silently
" h    : open in horizontal split
" H    : open in horizontal split silently
" v    : open in vertical split
" gv   : open in vertical split silently
" q    : close the quickfix window

" Search
" --------------------------------------------------------------------------------
" ggn  : go to the first match
" G$N  : go to the last match
" }}}


" vim:foldmethod=marker:foldlevel=0
