" --------------------------------------------------------------------------------
" maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" purpose:      code alignment functions
" --------------------------------------------------------------------------------

" AlignJsFields  {{{
" --------------------------------------------------------------------------------
" aligns the javascript object fields
" {                    {
"   field_a: 3,    ->    field_a   : 3,
"   field_two: 4         field_two : 4
" }                    }
" --------------------------------------------------------------------------------
function! AlignJsFields ()
    let FIELD_LINE = '\m^\(.\{-}\)\s*\:\s*\(.*\)$'

    let line_pat = s:GetLinePattern('\m^\s*\(,\s\)\?')
    let bounds   = s:GetBounds(line_pat)
    let lines    = []

    for linetext in getline(bounds['first'], bounds['last'])
        let fields = matchlist(linetext, FIELD_LINE)
        call add(lines, fields[1:2])
    endfor

    let nonempty = filter(copy(lines), '!empty(v:val)')
    let max_lval = max(map(copy(nonempty), 'strlen(v:val[0])')) + 1
    let linenum  = bounds['first']

    for line in lines
        if !empty(line)
            let newline = printf("%-*s: %s", max_lval, line[0], line[1])
            call setline(linenum, newline)
        endif
        let linenum += 1
    endfor
endfunction
" }}}

" AlignAssignments  {{{
" --------------------------------------------------------------------------------
" aligns variable assignments
" let a = 3          let a   = 3
" let ab = 4    ->   let ab  = 4
" let abc = 5        let abc = 5
" --------------------------------------------------------------------------------
function! AlignAssignments ()
    " Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)\s*\(.*\)$'

    " Locate block of code to be considered (same indentation, no blanks)
    let line_pat = s:GetLinePattern('\m^\s*\(var\s\|,\s\)\?')
    let bounds   = s:GetBounds(line_pat)

    " Decompose lines at assignment operators...
    let lines = []
    for linetext in getline(bounds['first'], bounds['last'])
        let fields = matchlist(linetext, ASSIGN_LINE)
        call add(lines, fields[1:3])
    endfor

    " Determine maximal lengths of lvalue and operator...
    let op_lines = filter(copy(lines),'!empty(v:val)')
    let max_lval = max(map(copy(op_lines), 'strlen(v:val[0])')) + 1
    let max_op   = max(map(copy(op_lines), 'strlen(v:val[1])'))

    " Recompose lines with operators at the maximum length...
    let linenum = bounds['first']
    for line in lines
        if !empty(line)
            let newline
            \    = printf("%-*s%*s %s", max_lval, line[0], max_op, line[1], line[2])
            call setline(linenum, newline)
        endif
        let linenum += 1
    endfor
endfunction
" }}}

" Spaces {{{
" --------------------------------------------------------------------------------
function! s:Spaces(count)
  let list = range(a:count)
  call map(list, '" "')
  return join(list, '')
endfunction
" }}}

" GetAlignPattern {{{
" --------------------------------------------------------------------------------
function! s:GetAlignPattern(len)
  if a:len > 3
    let p1 = s:Spaces(a:len)
    let p2 = s:Spaces(a:len - 2) . ', '
    let p3 = s:Spaces(a:len - 4) . 'var '
    return '\%(' . p1 . '\|' . p2 . '\|' . p3 .'\)'
  elseif a:len > 1
    let p1 = s:Spaces(a:len)
    let p2 = s:Spaces(a:len - 2) . ', '
    return '\%(' . p1 . '\|' . p2 . '\)'
  else
    return s:Spaces(a:len)
  endif
endfunction
" }}}

" GetLinePattern {{{
" --------------------------------------------------------------------------------
" returns a pattern that matches related lines of code
" based on the given pattern
" --------------------------------------------------------------------------------
function! s:GetLinePattern(match_pat)
    let curr_match = matchstr(getline('.'), a:match_pat)
    let match_len  = len(curr_match)
    let curr_pat   = s:GetAlignPattern(match_len)
    return '^' . curr_pat . '\S'
endfunction
" }}}

" GetBounds {{{
" --------------------------------------------------------------------------------
" returns the first and last lines of the block of code
" that matches the given pattern
" --------------------------------------------------------------------------------
function! s:GetBounds(pat)
    let firstline = search('^\%('. a:pat . '\)\@!','bnW') + 1
    let lastline  = search('^\%('. a:pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif
    return { 'first': firstline, 'last': lastline }
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
