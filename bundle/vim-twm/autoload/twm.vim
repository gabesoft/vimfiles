function! s:winnr(nr)
    let nr  = a:nr > 0 ? a:nr : winnr('#')
    let max = winnr('$')
    return nr > max ? max : nr
endfunction

function! s:winMove(key, create)
  let t:curwin = winnr()
  exec "silent wincmd ".a:key
  if (t:curwin == winnr() && a:create) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "silent wincmd ".a:key
  endif
endfunction

function! twm#moveToWindow(nr)
    exec s:winnr(a:nr) . 'wincmd w'
endfunction

function! twm#swapToWindow(nr)
    let awinnr = winnr()
    let bwinnr = s:winnr(a:nr)

    let abufnr = bufnr('%')
    exe bwinnr . 'wincmd w'
    let bbufnr = bufnr('%')

    exe 'hide buf' abufnr
    exe awinnr . 'wincmd w'
    exe 'hide buf' bbufnr
    exe bwinnr . 'wincmd w'
endfunction
