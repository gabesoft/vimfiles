" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      utility functions
" --------------------------------------------------------------------------------

" MkDir {{{
" --------------------------------------------------------------------------------
function! MkDir (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir, 'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction
" }}}

" VisualSelection {{{
" --------------------------------------------------------------------------------
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}}

" CursorColorSettings {{{
" --------------------------------------------------------------------------------
function! CursorColorSettings()
  if has("gui")
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver20-iCursor
    set guicursor+=n-v-c:blinkon0
  endif

  highlight Cursor     guifg=yellow guibg=red
  highlight iCursor    guifg=white  guibg=red
  highlight NonText    guifg=#4A4A59
  highlight SpecialKey guifg=#4A4A59
  highlight SpellBad   term=reverse ctermbg=1 gui=underline guisp=Red

  hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

  set showcmd
endfunction
" }}}

" CopyMatches {{{
" --------------------------------------------------------------------------------
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

command! -register CopyMatches call CopyMatches(<q-reg>)
" }}}

" TrimWhitespace {{{
" --------------------------------------------------------------------------------
function! TrimWhitespace()
    let cursorPos = getpos(".")
    let lastSearch = @/
    :silent! %s#\($\n\s*\)\+\%$##
    :silent! %s/\s\+$//
    call setpos(".", cursorPos)
    let @/=lastSearch
endfunction
" }}}

" CompressEmptyLines {{{
" --------------------------------------------------------------------------------
function! CompressEmptyLines()
  let cursorPos = getpos(".")
  let lastSearch = @/
  :silent! %v/./,/./-j
  call setpos(".", cursorPos)
  let @/=lastSearch
endfunction
" }}}

" CreateJsFunctionFolds {{{
" --------------------------------------------------------------------------------
function! CreateJsFunctionFolds()
  :silent normal! zE
  :silent %g/^\s\{,}function.*{$/normal!$zf%
  :silent %g/^\s\{,}\(\w\+\s\{,}:\s\{,}\)\?function.*{$/normal!$zf%
endfunction
" }}}

" CreateVimFunctionFolds {{{
" --------------------------------------------------------------------------------
function! CreateVimFunctionFolds()
  :silent normal! zE
  :silent %g/^function!\s/normal!$zf/^endfunction$/e
endfunction
" }}}

" Read first line of the given file if it exists {{{
" --------------------------------------------------------------------------------
function! ReadFirstLine(file)
  if filereadable(a:file)
    return get(readfile(a:file), 0)
  else
    return ''
  endif
endfunction
" }}}

" Sort Words (horizontally) {{{
" --------------------------------------------------------------------------------
function! SortWords()
    " Get the visual mark points
    let StartPosition = getpos("'<")
    let EndPosition = getpos("'>")

    if StartPosition[0] != EndPosition[0]
        echoerr "Range spans multiple buffers"
    elseif StartPosition[1] != EndPosition[1]
        " This is a multiple line range, probably easiest to work line wise

        for LineNum in range(StartPosition[1], EndPosition[1])
            call setline(LineNum, join(sort(split(getline('.'), ' ')), " "))
        endfor
    else
        " Single line range, sort words
        let CurrentLine = getline(StartPosition[1])

        " Split the line into the prefix, the selected bit and the suffix

        " The start bit
        if StartPosition[2] > 1
            let StartOfLine = CurrentLine[:StartPosition[2]-2]
        else
            let StartOfLine = ""
        endif
        " The end bit
        if EndPosition[2] < len(CurrentLine)
            let EndOfLine = CurrentLine[EndPosition[2]:]
        else
            let EndOfLine = ""
        endif
        " The middle bit
        let BitToSort = CurrentLine[StartPosition[2]-1:EndPosition[2]-1]

        " Move spaces at the start of the section to variable StartOfLine
        while BitToSort[0] == ' '
            let BitToSort = BitToSort[1:]
            let StartOfLine .= ' '
        endwhile
        " Move spaces at the end of the section to variable EndOfLine
        while BitToSort[len(BitToSort)-1] == ' '
            let BitToSort = BitToSort[:len(BitToSort)-2]
            let EndOfLine = ' ' . EndOfLine
        endwhile

        " Sort the middle bit
        let Sorted = join(sort(split(BitToSort, ' ')), ' ')
        " Reform the line
        let NewLine = StartOfLine . Sorted . EndOfLine
        " Write it out
        call setline(StartPosition[1], NewLine)
    endif
endfunction

command! -nargs=0 -range SortWords call SortWords()
" }}}

" Html tidy {{{
" Html tidy source: https://github.com/w3c/tidy-html5
" --------------------------------------------------------------------------------
function! HtmlTidy ()
  silent :%!tidy --indent "yes" --indent-spaces "4" --indent-attributes "no" --show-errors 100 --show-warnings "no" --quiet "yes" --wrap 0 --wrap-sections "yes" --wrap-script-literals "yes"
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
