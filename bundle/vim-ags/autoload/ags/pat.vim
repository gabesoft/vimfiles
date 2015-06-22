" Types of patterns
"   - file path
"   - line number
"   - column number
"   - search result
"   - search result highlighted

let s:end         = '[0m[K'
let s:col         = ':\d\{-1,}:'
let s:fileStart   = '[1;31m'
let s:file        = s:fileStart . '\(.\{-1,}\)' . s:end
let s:lineStart   = '[1;30m'
let s:lineEnd     = s:end . '-'
let s:lineColEnd  = s:end . s:col
let s:resultStart = '[32;40m'
let s:hlDelim     = '[#m'

function! s:esc(pat)
    return substitute(a:pat, '\[', '\\[', 'g')
endfunction

function! s:val(name)
    return has_key(s:, a:name) ? s:[a:name] : a:name
endfunction

function! s:valEsc(name)
    return has_key(s:, a:name) ? s:esc(s:[a:name]) : a:name
endfunction

function! ags#pat#matchCount(expr, pat, index)
    if strlen(a:expr) == 0 | return 0 | endif

    let cnt = 0
    let idx = a:index

    while match(a:expr, a:pat, idx) > -1 && idx < strlen(a:expr)
        let cnt = cnt + 1
        let idx = match(a:expr, a:pat, idx) + strlen(matchstr(a:expr, a:pat, idx))
    endw

    return cnt
endfunction

function! ags#pat#mkpat(...)
    let key = ''

    for p in a:000
        let key .= has_key(s:, p) ? s:[p] : p
    endfor

    if strlen(key) == 0 | return '' | endif

    let pat = key
    let pat = substitute(pat, ':\([a-zA-Z]\{-1,}\):', '\=s:val(submatch(1))', 'g')
    let pat = substitute(pat, ':\\\([a-zA-Z]\{-1,}\):', '\=s:valEsc(submatch(1))', 'g')

    return pat
endfunction

function! ags#pat#sub(expr, pat, sub)
    return substitute(a:expr, ags#pat#mkpat(a:pat), ags#pat#mkpat(a:sub), '')
endfunction

function! ags#pat#gsub(expr, pat, sub)
    return substitute(a:expr, ags#pat#mkpat(a:pat), ags#pat#mkpat(a:sub), 'g')
endfunction
