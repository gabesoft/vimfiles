function! haml#sortProps()
    let pos = getpos('.')
    let br  = search("{", 'bcnW')

    if br == 0 | return | endif
    if match(getline(br), '{\s\{}$') == -1 | return | endif

    let nr  = br
    let fst = -1
    let lst = -1
    let pat = '^\s\{}[a-zA-Z\-]\{}:.\{};\s\{}$'

    while nr <= line('$')
        if match(getline(nr), pat) != -1
            let fst = nr
            break
        endif
        let nr = nr + 1
    endw

    while nr <= line('$')
        if match(getline(nr), pat) == -1
            let lst = nr - 1
            break
        endif
        let nr = nr + 1
    endw

    if fst != -1 && lst != -1 && fst <= lst
        exec fst . ',' . lst . 'sort /^\s\{}\%(-[^-]\{-}-\)\=\zs[^:]\{}\ze:/ r'
    endif

    call setpos('.', pos)
endfunction
