fun! togglequickfix#ToggleQuickfix() "{{{
    let nr = winnr("$")
    cwindow
    let nr2 = winnr("$")
    if nr == nr2
        cclose
    endif
endfunction "}}}

fun! togglequickfix#ToggleLocation() "{{{
    let nr = winnr("$")
    lwindow
    let nr2 = winnr("$")
    if nr == nr2
        lclose
    endif
endfunction "}}}

fun! togglequickfix#IsOpened(typ) "{{{
    if a:typ == "qf"
        let ids = getqflist({'winid' : 1})
    else
        " query location list window
        let ids = getloclist(0, {'winid' : 1})
    endif

    return get(ids, "winid", 0) != 0
endfunction "}}}

fun! togglequickfix#Has(typ) "{{{
    if a:typ == "qf"
        let elts = getqflist()
    else
        " query location list window
        let elts = getloclist(0)
    endif

    return len(elts) > 0
endfunction "}}}

" status machine
"       ql
"       v
" xx -> qx -> xl
" ^           |
"  `---------'
let s:sts = {
      \"xx":"qx",
      \"ql":"qx",
      \"qx":"xl",
      \"xl":"xx",
      \}

fun! togglequickfix#Loop() "{{{
    let status = ""
    if togglequickfix#IsOpened("qf")
        let status = "q"
    else
        let status = "x"
    endif

    if togglequickfix#IsOpened("locl")
        let status .= "l"
    else
        let status .= "x"
    endif

    while 1
        let status = s:sts[status]
        if status[0] == 'q'
            if togglequickfix#Has('qf')
                copen
            else
                continue
            endif
        else
            cclose
        endif

        if status[1] == 'l'
            if togglequickfix#Has('locl')
                lopen
            else
                continue
            endif
        else
            lclose
        endif

        break
    endwhile

endfunction "}}}
