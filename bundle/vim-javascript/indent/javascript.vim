" ------------------------------------------------------------------------------
" Vim indent file
" ---------------
" Language:     javascript
" Maintainer:   Gabriel Adomnicai <gabesoft@gmail.com>
" Last Change:  2012-03-31
" ------------------------------------------------------------------------------

" Standard Declarations:
" ------------------------------------------------------------------------------

" only load this file when no other was loaded
" --------------------------------------------
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Set the global log variable 1 = logging enabled, 0 = logging disabled
"let g:js_indent_log = 1
if !exists("g:js_indent_log")
  let g:js_indent_log = 0
endif

" set the function that will do the indenting
" -------------------------------------------
setlocal indentexpr=GetJsIndent()
setlocal indentkeys+==},=),=],0=*/,0=/*,0=\,,0=;,*<Return>

" only define the function once
" -----------------------------
if exists("*GetJsIndent")
  finish
endif

" Variables:
" ------------------------------------------------------------------------------
let s:space      = 1
"let s:tab       = &sw " TODO: uncomment and remove line below
let s:tab        = 4   "       make sure that it works with 2 & 4
let s:synComment = '\(Comment\|String\|Regexp\)'
let s:cache      = {}
let s:lineCache  = {}
let s:time       = []

" Functions:
" ------------------------------------------------------------------------------

" outputs a dictionary to log (one line for each key-value pair)
" --------------------------------------------------------------
function! s:LogDict(dict)
  for [key, val] in items(a:dict) | call s:Log(key, val) | endfor
endfunction

" outputs a message to log (JSI = javascript indent)
" --------------------------------------------------
function! s:Log(...)
  if g:js_indent_log
    echohl Visual | echomsg "JSI: " string(a:000) | echohl None
  endif
endfunction

" compares two lists by their first element
" -----------------------------------------
function! s:CompareListsByFirst(e1, e2)
  let v1 = a:e1[0]
  let v2 = a:e2[0]
  return v1 == v2 ? 0 : v1 > v2 ? 1 : -1
endfunction

" stores a key value pair in cache
" --------------------------------
function! s:Put(key, value, lnum)
  if a:lnum != v:lnum
    let s:cache[a:key] = a:value
  else
    let s:lineCache[a:key] = a:value
  endif
endfunction

" gets a value from cache
" -----------------------
function! s:Get(key)
  let value = get(s:cache, a:key)
  if string(value) == string(0)
    let value = get(s:lineCache, a:key)
    if string(value) == string(0)
      return [0, 0]
    else
      return [1, value]
    endif
  else
    return [1, value]
  endif
endfunction

" masks comments, strings, regexes, etc
" -------------------------------------
function! s:Mask(line)
  let line  = a:line
  let cchar = ' '     " comment replacement
  let nchar = '#'     " non-comment replacement
  let crepl = '\=substitute(submatch(0), ".", "' . cchar . '", "g")'
  let nrepl = '\=substitute(submatch(0), ".", "' . nchar . '", "g")'

  " replace non ascii characters
  let line = substitute(line, '[^\x00-\x7f]', nrepl, 'g')

  " replace escapes
  let line = substitute(line, '\\''', nrepl, 'g')
  let line = substitute(line, '\\"', nrepl, 'g')
  let line = substitute(line, '\\/', nrepl, 'g')

  " replace comments, strings, regexes, and brackets
  let patterns = [
  \ { 'patt': '\m//.*$',                                        'repl' : crepl },
  \ { 'patt': '\m/\*.\{-}\*/',                                  'repl' : crepl },
  \ { 'patt': '\m''.\{-}''',                                    'repl' : nrepl },
  \ { 'patt': '\m".\{-}"',                                      'repl' : nrepl },
  \ { 'patt': '\m/[^/]\+//\@!',                                 'repl' : nrepl },
  \ { 'patt': '\m\(([^)(''"]*)\|\[[^\][''"]*\]\|{[^}{''"]*}\)', 'repl' : nrepl }
  \ ]

  while 1
    let copies  = copy(patterns)
    let matches = map(copies, '[match(line, v:val.patt), v:val]')

    call filter(matches, 'v:val[0] != -1')

    if !len(matches) | break | endif

    call sort(matches, 's:CompareListsByFirst')

    let match = matches[0][1]
    let line  = substitute(line, match.patt, match.repl, '')
  endwhile

  return line
endfunction

" returns the line at the specified number
" ----------------------------------------
function! s:GetLine(lnum)
  let key = 'line' . string(a:lnum)
  let [cached, line] = s:Get(key)

  if !cached
    let  line = s:Mask(getline(a:lnum))
    call s:Put(key, line, a:lnum)
  endif

  return line
endfunction

" returns true if a line matches any of the specified patterns
" ------------------------------------------------------------
function! s:MatchAny(line, patterns)
  let mat = 0
  for pat in a:patterns
    let mat = mat || (a:line =~ pat)
  endfor
  return mat
endfunction

" returns true if a line matches the given pattern
" ----------------------------------------------
function! s:Match(line, pattern)
  return s:MatchAny(a:line, [a:pattern])
endfunction

" returns true if a line matches all of the specified patterns
" ------------------------------------------------------------
function! s:MatchAll(line, patterns)
  let mat = 1
  for pat in a:patterns
    let mat = mat && (a:line =~ pat)
  endfor
  return mat
endfunction

" returns the index of the last match of the pattern or -1 if
" there's no match
" -----------------------------------------------------------
function! s:MatchLast(line, pattern)
  let cnt =  1
  let idx = -1
  let tmp = match(a:line, a:pattern)

  while tmp != -1
    let cnt  = cnt + 1
    let idx  = tmp
    let tmp  = match(a:line, a:pattern, 0, cnt)
  endwhile

  return idx
endfunction

" determines if the given position is inside a comment
" ----------------------------------------------------
function! s:InComment(lnum, cnum)
  return synIDattr(synID(a:lnum, a:cnum, 0), 'name') =~? s:synComment
endfunction

" determines if a given line is in a block comment
" ------------------------------------------------
function! s:InBlockComment(lnum)
  let lnum = a:lnum
  let line = getline(lnum)
  let patt = '\m^\s*//.*$'

  let st = 1
  let en = strlen(line)

  return !s:Match(line, patt) && s:InComment(lnum, st) && s:InComment(lnum, en)
endfunction

" determines if a given line is the start of a block comment
" ----------------------------------------------------------
function! s:BlockCommentStart(line)
  return s:Match(a:line, '\m^\s*/\*.*$')
endfunction

" determines if a given line is the end of a block comment
" ----------------------------------------------------------
function! s:BlockCommentEnd(line)
  return s:Match(a:line, '\m^.*\*/\s*\(//.*\)\?$')
endfunction

" finds the line with the open bracket for the specified bracket pair
" -------------------------------------------------------------------
function! s:FindPair(lnum, openpos, openbr, closebr)
  let currpos  = getpos('.')

  call cursor(a:lnum, a:openpos + 1)

  let lnum = searchpair(a:openbr, '', a:closebr, 'bW',
             \ 'synIDattr(synID(line("."), col("."), 0), "name") =~? s:synComment')

  call cursor(currpos)

  return lnum
endfunction

" finds the line with the matching open bracket given a close bracket and a
" starting position
" -------------------------------------------------------------------------
function! s:FindOpenBracket(lnum, pos, closeBracket)
  let brackets = {
  \   '}' : [  '{',  '}' ],
  \   ')' : [  '(',  ')' ],
  \   ']' : [ '\[', '\]' ]
  \ }

  let openbr  = brackets[a:closeBracket][0]
  let closebr = brackets[a:closeBracket][1]

  return s:FindPair(a:lnum, a:pos, openbr, closebr)
endfunction

" returns the last unclosed open bracket and its position on the given line
" -------------------------------------------------------------------------
function! s:LastOpenBracket(line)
  let patt    = '\m[([{]'
  let cnum    = s:MatchLast(a:line, patt)
  let bracket = matchstr(a:line, patt, cnum)
  return [cnum, bracket]
endfunction

" returns the last unopened close bracket and its position on the given line
" --------------------------------------------------------------------------
function! s:LastCloseBracket(line)
  let patt    = '\m[})\]]'
  let cnum    = s:MatchLast(a:line, patt)
  let bracket = matchstr(a:line, patt, cnum)
  return [cnum, bracket]
endfunction

" if the given line contains a non-starting close bracket it is returned along
" with its position
" ----------------------------------------------------------------------------
function! s:LastCloseBracketNS(line)
  let empty = '\m^\s*'
  let patt  = '\m[)}\]]'
  let pos1  = matchend(a:line, empty)
  let pos2  = s:MatchLast(a:line, patt)
  return pos2 > pos1 ? [pos2, matchstr(a:line, patt, pos2)] : [-1, '']
endfunction

" if the given line starts with an unopened close bracket it is returned along
" with its position (only empty space may precede the bracket)
" ----------------------------------------------------------------------------
function! s:StartsWithCloseBracket(line)
  let empty   = '\m^\s*'
  let patt    = '\m^[)}\]]'
  let pos1    = matchend(a:line, empty)
  let pos2    = match(a:line, patt, pos1)
  let bracket = matchstr(a:line, patt, pos2)
  return [pos2, bracket]
endfunction

" if the given line starts with an open bracket it is returned along with its
" position (only empty space may precede the bracket)
" ---------------------------------------------------------------------------
function! s:StartsWithOpenBracket(line)
  let empty   = '\m^\s*'
  let patt    = '\m^[({[]'
  let pos1    = matchend(a:line, empty)
  let pos2    = match(a:line, patt, pos1)
  let bracket = matchstr(a:line, patt, pos2)
  return [pos2, bracket]
endfunction

" if the given line ends with an open bracket it is returned along with its
" position
" -------------------------------------------------------------------------
function! s:EndsWithOpenBracket(line)
  let pat1 = '\m[({[]'
  let pat2 = pat1 . '\s*$'
  let pos = match(a:line, pat2)
  return pos != -1 ? [pos, matchstr(a:line, pat1, pos)] : [-1, '']
endfunction

" if the given line ends with a close bracket it is returned along with its
" position
" -------------------------------------------------------------------------
function! s:EndsWithCloseBracket(line)
  let pat1 = '\m[)}\]]'
  let pat2 = pat1 . '\s*$'
  let pos = match(a:line, pat2)
  return pos != -1 ? [pos, matchstr(a:line, pat1, pos)] : [-1, '']
endfunction

" returns true if the given line ends with a semicolon
" ----------------------------------------------------
function! s:EndsWithSemi(line)
  return s:Match(a:line, '\m;\s*$')
endfunction

" returns true if the given line contains only empty space
" --------------------------------------------------------
function! s:Empty(line)
  return s:Match(a:line, '\m^\s*$')
endfunction

" returns true if the given line ends with a comma
" ------------------------------------------------
function! s:EndsWithComma(line)
  return s:Match(a:line, '\m,\s*$')
endfunction

" returns true if the given line ends with a comma
" ------------------------------------------------
function! s:StartsWithComma(line)
  return s:Match(a:line, '\m^\s*,')
endfunction

" returns true if the given line starts with a comma followed by a non-space
" character
" --------------------------------------------------------------------------
function! s:StartsWithCommaSp0(line)
  return s:Match(a:line, '\m^\s*,\S\+')
endfunction

" returns true if the given line starts with a comma followed by a space, then
" a non-space character
" ----------------------------------------------------------------------------
function! s:StartsWithCommaSp1(line)
  return s:Match(a:line, '\m^\s*,\s\S\+')
endfunction

" returns true if the given line starts with a dot
" ------------------------------------------------
function! s:StartsWithDot(line)
  return s:Match(a:line, '\m^\s*\.\S\+')
endfunction

" returns true if the given line is a single line var expression
" --------------------------------------------------------------
function! s:VarLine(line)
  return s:EndsWithSemi(a:line) && s:Match(a:line, '\m\s*var\>')
endfunction

" returns true if the given line is an unclosed var expression
" ------------------------------------------------------------
function! s:OpenVar(line)
  return !s:EndsWithSemi(a:line) && s:Match(a:line, '\m\s*var\>')
endfunction

" returns true if the given line is a control start line
" ------------------------------------------------------
function! s:ControlStart(line)
  if s:EndsWithSemi(a:line) | return 0 | endif
  if s:EndsWithOpenBracket(a:line)[0] != -1 | return 0 | endif

  return s:MatchAny(a:line, [
  \   '\m\<if\>\s*\S*\s*$',
  \   '\m\<for\>\s*\S*\s*$',
  \   '\m\<with\>',
  \   '\m\<while\>\s*\S*\s*$',
  \   '\m\<try\>',
  \   '\m\<do\>'
  \ ])
endfunction

" returns true if the given line is a control middle line
" -------------------------------------------------------
function! s:ControlMid(line)
  if s:EndsWithSemi(a:line) | return 0 | endif
  if s:EndsWithOpenBracket(a:line)[0] != -1 | return 0 | endif
  return s:Match(a:line, '\m\<else\>\|\<catch\>\|\<finally\>')
endfunction

" returns true if the given line is a control end line
" ----------------------------------------------------
function! s:ControlEnd(line)
  return s:MatchAll(a:line, ['\m\<while\>', '\m;\s*$'])
endfunction

" returns true if the given line is a switch statement
" ----------------------------------------------------
function! s:Switch(line)
  return s:Match(a:line, '\m\<switch\>.*{\s*$')
endfunction

" returns true if the given line is a switch middle statement
" -----------------------------------------------------------
function! s:SwitchMid(line)
  return s:Match(a:line, '\m^.*\(\<case\>.*\|\<default\>\s*\):\s*$')
endfunction

" returns true if the given line contains a single break statement
" ----------------------------------------------------------------
function! s:SwitchBreak(line)
  return s:Match(a:line, '\m^\s*\<break\>\s*;\s*$')
endfunction

" returns true if the given line starts with a question mark
" ----------------------------------------------------------
function! s:StartsWithQuestion(line)
  return s:Match(a:line, '\m^\s*?')
endfunction

" returns true if the given line starts with a colon
" --------------------------------------------------
function! s:StartsWithColon(line)
  return s:Match(a:line, '\m^\s*:')
endfunction

" returns true if the line ends with a math operator
" --------------------------------------------------
function! s:EndsWithOperator(line)
  return s:Match(a:line, '\m\(+\|-\|\*\|/\|&\||\)\{1}\s*$')
endfunction

" get the indent of the line with the specified number adjusting forward
" according to the contents of the current and previous lines
" ----------------------------------------------------------------------
function! s:IndentFwd(indent, line, pline)
  let pline  = a:pline
  let indent = a:indent

  if s:tab != 4  | return indent | endif

  if s:StartsWithComma(a:line) && !s:StartsWithDot(a:pline) | return indent | endif
  if s:StartsWithDot(a:line) && !s:StartsWithComma(a:pline) | return indent | endif

  if s:StartsWithCommaSp1(pline)
    let indent = indent + 2 * s:space
  elseif s:StartsWithCommaSp0(pline)
    let indent = indent + 1 * s:space
  elseif s:StartsWithDot(pline)
    let indent = indent + 1 * s:space
  endif

  return indent
endfunction

" get the indent of the line with the specified number adjusting backward
" according to the contents of the current and previous lines
" -----------------------------------------------------------------------
function! s:IndentBak(indent, line, pline)
  let line   = a:line
  let indent = a:indent

  if s:tab != 4  | return indent | endif

  if s:StartsWithComma(a:pline) && !s:StartsWithDot(a:line) | return indent | endif
  if s:StartsWithDot(a:pline) && !s:StartsWithComma(a:line) | return indent | endif

  if s:StartsWithCommaSp1(line)
    let indent = indent - 2 * s:space
  elseif s:StartsWithCommaSp0(line)
    let indent = indent - 1 * s:space
  elseif s:StartsWithDot(line)
    let indent = indent - 1 * s:space
  endif

  return max([0, indent])
endfunction

" adds a tab to the given indent
" ------------------------------
function! s:AddTab(indent, line, pline)
  return s:IndentBak(a:indent + s:tab, a:line, a:pline)
endfunction

" subtracts a tab from the given indent
" -------------------------------------
function! s:SubTab(indent, line, pline)
  return s:IndentFwd(a:indent - s:tab, a:line, a:pline)
endfunction

" adds a space to the given indent
" --------------------------------
function! s:AddSpace(indent, line)
  return a:indent + s:space
endfunction

" subtracts a space from the given indent
" ---------------------------------------
function! s:SubSpace(indent, line)
  return max([0, a:indent - s:space])
endfunction

" finds the topmost line where an expression enclosed in brackets starts given
" the line number and position of its close bracket
" ----------------------------------------------------------------------------
function! s:FindBracketStart(lnum, data)
  let pos     = a:data[0]
  let bracket = a:data[1]

  if pos == -1 | return -1 | endif

  let key = 'br' . string(a:lnum) . string(pos) . string(bracket)
  let [cached, lnum] = s:Get(key)
  if  cached | return lnum | endif

  let snum = s:FindOpenBracket(a:lnum, pos, bracket)
  let line = s:GetLine(snum)

  if s:StartsWithCloseBracket(line)[0] == -1
    let [spos, sbracket] = s:LastCloseBracket(line)
    if spos != -1
      let snum = s:FindOpenBracket(snum, spos, sbracket)
    endif
  endif

  call s:Put(key, snum, a:lnum)
  return snum
endfunction

" finds the line where a multi line var expression starts given the line
" number of its last statement
" ----------------------------------------------------------------------
function! s:FindVarStart(lnum, line)
  if s:OpenVar(a:line) | return a:lnum | endif

  let indent = s:IndentFwd(indent(a:lnum), '', a:line)
  let lnum   = -1
  let indx   = a:lnum

  while indx > 0
    let line = s:GetLine(indx)
    let curr = s:IndentFwd(indent(indx), '', line)

    if curr >= indent
      let snum = s:FindBracketStart(indx, s:LastCloseBracket(line))
      if snum != -1
        let line = s:GetLine(snum)

        if s:OpenVar(line)
          let lnum = snum
          break
        endif

        if indx == a:lnum
          let indent = s:IndentFwd(indent(snum), '', line)
        endif

        let indx = indx != snum ? snum : prevnonblank(indx - 1)
      elseif (indx == a:lnum) || (!s:EndsWithSemi(line) && !s:OpenVar(line))
        let indx = prevnonblank(indx - 1)
      else
        break
      endif
    elseif s:OpenVar(line) && s:EndsWithOpenBracket(line)[0] == -1
      let lnum = indx
      break
    else
      break
    endif
  endwhile

  return lnum
endfunction

" finds the line where a dot chain expression starts given the line number of
" its last element
" ---------------------------------------------------------------------------
function! s:FindDotChainStart(lnum, line)

  if !s:StartsWithDot(a:line) && s:StartsWithCloseBracket(a:line)[0] == -1 | return -1 | endif

  let indent = s:IndentFwd(indent(a:lnum), '', a:line)
  let lnum   = -1
  let indx   = a:lnum

  while indx > 0
    let line = s:GetLine(indx)
    let curr = s:IndentFwd(indent(indx), '', line)

    if curr >= indent
      let snum = s:FindBracketStart(indx, s:LastCloseBracket(line))
      if  snum != -1
        let line = s:GetLine(snum)
        if s:StartsWithDot(line)
          let indx = indx != snum ? snum : prevnonblank(indx - 1)
        else
          break
        endif
      else
        let indx = prevnonblank(indx - 1)
      endif
    elseif s:Empty(line)
      let indx = prevnonblank(indx - 1)
    elseif !s:StartsWithDot(line) && s:EndsWithOpenBracket(line)[0] == -1
      let snum = s:FindBracketStart(indx, s:LastCloseBracket(line))
      if  snum != -1
        let lnum = snum
        break
      endif

      let snum = s:FindVarStart(indx, line)
      if snum != -1
        let lnum = snum
        break
      endif

      let lnum = indx
      break
    else
      break
    endif
  endwhile

  return lnum
endfunction

" finds the beginning line of a multi line ternary expression
" -----------------------------------------------------------
function! s:FindTernaryStart(lnum, line)
  if !s:StartsWithColon(a:line) | return -1 | endif

  let indent = s:IndentFwd(indent(a:lnum), '', a:line)
  let lnum   = -1
  let indx   = a:lnum

  while indx > 0
    let line = s:GetLine(indx)
    let curr = s:IndentFwd(indent(indx), '', line)

    if curr == indent
      if s:StartsWithQuestion(line) || s:StartsWithColon(line) || s:Empty(line)
        let indx = prevnonblank(indx - 1)
      else
        break
      endif
    else
      let snum = s:FindVarStart(indx, line)
      let lnum = snum != -1 ? snum : indx
      break
    endif
  endwhile

  return lnum
endfunction

" finds the line that begins a continuation expression
" ----------------------------------------------------
function! s:FindContinuationStart(lnum, line)
  let indent = s:IndentFwd(indent(a:lnum), '', a:line)
  let lnum   = -1
  let indx   = a:lnum

  while indx > 0
    let line = s:GetLine(indx)
    if s:EndsWithOperator(line)
      let lnum = indx
      let indx = prevnonblank(indx - 1)
    elseif indx == a:lnum || s:Empty(line)
      let indx = prevnonblank(indx - 1)
    else
      break
    endif
  endwhile

  return lnum
endfunction

" finds the beginning line of a switch statement
" ----------------------------------------------
function! s:FindSwitchStart(lnum, line)
  if s:Switch(a:line) | return a:lnum | endif

  let indent = s:IndentFwd(indent(a:lnum), '', a:line)
  let lnum   = -1
  let indx   = a:lnum

  while indx > 0
    let line = s:GetLine(indx)
    let curr = s:IndentFwd(indent(indx), '', line)

    if curr >= indent
      let indx = prevnonblank(indx - 1)
    elseif s:Switch(line)
      let lnum = indx
      break
    else
      let indx = prevnonblank(indx - 1)
    endif
  endwhile

  return lnum
endfunction

function! s:ApplyCommentRule(indent, data)
  let l1     = a:data['l1']
  let l1num  = a:data['l1num']
  let indent = a:indent

  if s:BlockCommentStart(l1)
    return s:AddSpace(indent, l1)
  elseif s:BlockCommentEnd(l1)
    return s:SubSpace(indent, l1)
  elseif s:InBlockComment(l1num)
    return indent
  endif

  return -1
endfunction

function! s:ApplyBracketRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let indent = a:indent

  let snum = s:FindBracketStart(l0num, s:StartsWithCloseBracket(l0))
  if snum != -1
    let line = s:GetLine(snum)
    return s:IndentFwd(indent(snum), l0, line)
  endif

  let [pos, bracket] = s:LastOpenBracket(l1)
  if pos != -1
    let snum = s:FindBracketStart(l1num, s:LastCloseBracket(l1))
    let line = l1
    if snum != -1
      let line   = s:GetLine(snum)
      let indent = s:IndentFwd(indent(snum), l0, line)
    endif
    return s:AddTab(indent, l0, l1)
  endif

  let snum = s:FindBracketStart(l1num, s:LastCloseBracketNS(l1))
  if snum != -1
    let line   = s:GetLine(snum)
    return s:IndentFwd(indent(snum), l0, line)
  endif

  return -1
endfunction

function! s:ApplyVarRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l2     = a:data['l2']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let indent = a:indent

  if s:StartsWithDot(l0) | return -1 | endif

  let snum = s:FindBracketStart(l0num, s:StartsWithCloseBracket(l0))
  if  snum != -1
    let line = s:GetLine(snum)
    if  s:OpenVar(line)
      let indent = s:IndentFwd(indent(snum), l0, line)
      return s:AddTab(indent, l0, l1)
    else
      return -1
    endif
  endif

  if s:OpenVar(l1)
    let indent = s:AddTab(indent, l0, l1)

    let [pos, bracket] = s:LastOpenBracket(l1)
    if pos != -1
      return s:AddTab(indent, l0, l1)
    endif

    if s:StartsWithQuestion(l0)
      return s:AddTab(indent, l0, l1)
    endif

    if s:EndsWithOperator(l1)
      return s:AddTab(indent, l0, l1)
    endif

    return indent
  endif

  if s:EndsWithSemi(l1)
    let snum = s:FindVarStart(l1num, l1)
    if  snum != -1 | return indent(snum) | endif
  endif

  if s:EndsWithOpenBracket(l1)[0] != -1
    let snum = s:FindBracketStart(l1num, s:LastCloseBracket(l1))
    if  snum != -1
      let line = s:GetLine(snum)
      if s:OpenVar(line)
        return s:AddTab(indent, l0, l1)
      endif
    endif
  endif

  let snum = s:FindBracketStart(l1num, s:LastCloseBracketNS(l1))
  if  snum != -1
    let line = s:GetLine(snum)

    if !s:OpenVar(line) | return -1 | endif

    if s:EndsWithSemi(line)
      return s:IndentFwd(indent(snum), l0, line)
    else
      return s:AddTab(indent(snum), l0, line)
    endif
  endif

  if s:StartsWithColon(l1) && s:EndsWithOpenBracket(l1)[0] == -1
    let snum = s:FindTernaryStart(l1num, l1)
    if  snum != -1
      let line = s:GetLine(snum)
      if s:OpenVar(line)
        if s:EndsWithSemi(l1)
          return indent(snum)
        else
          return s:AddTab(indent(snum), l0, l1)
        endif
      endif
    endif
  endif

  if s:EndsWithOperator(l2) && !s:EndsWithOperator(l1)
    let snum = s:FindContinuationStart(l1num, l1)
    if snum != -1
      let line = s:GetLine(snum)
      if s:OpenVar(line)
        return s:AddTab(indent(snum), l0, l1)
      elseif s:StartsWithComma(line)
        return indent(snum)
      endif
    endif
  endif

  if s:Empty(l0) && s:StartsWithComma(l1) && s:EndsWithOpenBracket(l1)[0] == -1
    let snum = s:FindVarStart(l1num, l1)
    if snum != -1 | return indent | endif
  endif

  return -1
endfunction

function! s:ApplyDotRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let indent = a:indent

  if s:StartsWithCloseBracket(l0)[0] != -1 || s:SwitchMid(l0) | return -1 | endif

  if s:StartsWithDot(l0)
    let [opos, obracket] = s:LastOpenBracket(l1)
    let [cpos, cbracket] = s:StartsWithCloseBracket(l1)

    if !s:StartsWithDot(l1) && !s:OpenVar(l1) && !s:Empty(l1) && opos == -1 && cpos == -1
      return s:AddTab(indent, l0, l1)
    elseif s:Empty(l1)
      return indent
    elseif s:OpenVar(l1)
      let indent = s:AddTab(indent, l0, l1)
      let indent = s:AddTab(indent, '', l1)
      return indent
    elseif opos != -1
      let [cpos, cbracket] = s:LastCloseBracket(l1)

      if cpos < pos && cpos != -1
        let snum   = s:FindOpenBracket(l1num, cpos, cbracket)
        let indent = s:IndentFwd(indent(snum), l0, s:GetLine(snum))
      endif

      if s:OpenVar(l1)
        let indent = s:AddTab(indent, l0, l1)
        let indent = s:AddTab(indent, '', l1)
        return indent
      else
        return s:AddTab(indent, '', l1)
      endif
    endif

  elseif s:EndsWithSemi(l1)
    let snum = s:FindDotChainStart(l1num, l1)
    if  snum != -1 | return indent(snum) | endif

  elseif s:EndsWithOpenBracket(l1)[0] == -1 && !s:Empty(l0)
    let snum = s:FindDotChainStart(l1num, l1)
    if snum != -1
      let line = s:GetLine(snum)
      if s:OpenVar(line)
        return s:AddTab(indent(snum), l0, l1)
      else
        return indent(snum)
      endif
    endif
  endif

  return -1
endfunction

function! s:ApplySingleControlRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l2     = a:data['l2']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let l2num  = a:data['l2num']
  let indent = a:indent

  if s:StartsWithOpenBracket(l0)[0] != -1 | return -1 | endif

  let br1 = s:StartsWithCloseBracket(l1)
  let br2 = s:EndsWithCloseBracket(l1)
  if br1[0] == br2[0] && br1[0] != -1
    return -1
  endif

  if s:ControlStart(l1) || s:ControlMid(l1)
    return s:AddTab(indent, l0, l1)
  endif

  if s:ControlStart(l2) || s:ControlMid(l2)
    return s:SubTab(indent, l0, l1)
  endif

  return -1
endfunction

function! s:ApplySwitchRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let indent = a:indent

  if s:SwitchMid(l0)
    let snum = s:FindSwitchStart(l1num, l1)
    if snum != -1 && snum != l1num
      let indent = indent(snum)
      return s:AddTab(indent, l0, l1)
    endif
  endif

  if s:SwitchMid(l1)
    return s:AddTab(indent, l0, l1)
  endif

  if s:SwitchBreak(l1)
    return s:SubTab(indent, l0, l1)
  endif

  return -1
endfunction

function! s:ApplyContinuationRules(indent, data)
  let l0     = a:data['l0']
  let l1     = a:data['l1']
  let l2     = a:data['l2']
  let l0num  = a:data['l0num']
  let l1num  = a:data['l1num']
  let l2num  = a:data['l2num']
  let indent = a:indent

  if s:StartsWithQuestion(l0)
    return s:AddTab(indent, l0, l1)
  elseif s:StartsWithColon(l1)
    return s:SubTab(indent, l0, l1)
  endif

  if (s:EndsWithOperator(l0) || s:EndsWithOperator(l1)) && !s:BlockCommentStart(l0)
    let snum = s:FindContinuationStart(l1num, l1)
    if  snum == l1num
      return s:AddTab(indent, l0, l1)
    endif
  endif

  if s:EndsWithOperator(l2) && !s:EndsWithOperator(l1) && !s:BlockCommentEnd(l2)
    let snum = s:FindContinuationStart(l1num, l1)
    if  snum != -1
      return s:SubTab(indent, l0, l1)
    endif
  endif

  return -1
endfunction

function! s:ApplyCommaRules(indent, data)
  let data  = a:data
  let l1num = data['l1num']
  let l0    = data['l0']
  let l1    = data['l1']

  if s:Empty(l0) && s:StartsWithComma(l1) && s:EndsWithOpenBracket(l1)[0] == -1
    return s:IndentFwd(indent(l1num), l0, l1)
  endif

  return -1
endfunction

function! s:ApplyTernaryRules(indent, data)
  let data  = a:data
  let l1num = data['l1num']
  let l1    = data['l1']

  if !s:EndsWithSemi(l1) | return -1 | endif

  let bnum = s:FindBracketStart(l1num, s:LastCloseBracket(l1))
  if bnum != -1
    let line = s:GetLine(bnum)
  else
    let bnum = l1num
    let line = l1
  endif

  let snum = s:FindTernaryStart(bnum, line)
  if snum != -1
    return indent(snum)
  endif

  return -1
endfunction

function! s:CalculateIndent(data)
  let data = a:data

  let l0num = data['l0num']
  let l1num = data['l1num']
  let l2num = data['l2num']

  let l0 = data['l0']
  let l1 = data['l1']
  let l2 = data['l2']

  let pindent = s:IndentFwd(indent(l1num), l0, l1)

  let indent = s:ApplyCommentRule(pindent, data)
  "call s:Log('R-comment', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyVarRules(pindent, data)
  "call s:Log('R-var    ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyDotRules(pindent, data)
  "call s:Log('R-dot    ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyBracketRules(pindent, data)
  "call s:Log('R-bracket', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyContinuationRules(pindent, data)
  "call s:Log('R-cont   ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplySingleControlRules(pindent, data)
  "call s:Log('R-block  ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplySwitchRules(pindent, data)
  "call s:Log('R-switch  ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyCommaRules(pindent, data)
  "call s:Log('R-comma  ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  let indent = s:ApplyTernaryRules(pindent, data)
  "call s:Log('R-ternary  ', indent, l0num, l0)
  if indent != -1 | return indent | endif

  return s:IndentBak(indent(l1num), l0, l1)
endfunction

" Indenter:
" ------------------------------------------------------------------------------
function! GetJsIndent()
  let l0num = v:lnum                          " current line number
  let l1num = prevnonblank(l0num - 1)         " previous non-blank line number
  let l2num = prevnonblank(l1num - 1)         " second previous non-blank line number

  if v:lnum == 1
    let s:time  = reltime()
    let s:cache = {}
    call s:Log('INIT', s:time, s:cache)
  endif

  if l1num == 0 | return 0 | endif

  let s:lineCache = {}

  let data = {
  \ 'l0num' : l0num,
  \ 'l1num' : l1num,
  \ 'l2num' : l2num,
  \ 'l0'    : s:GetLine(l0num),
  \ 'l1'    : s:GetLine(l1num),
  \ 'l2'    : s:GetLine(l2num)
  \ }

  let indent = s:CalculateIndent(data)

  call s:Log('DURATION', len(s:cache), reltimestr(reltime(s:time)))

  if v:lnum == line('$')
    let s:cache = {}
  endif

  return indent
endfunction
