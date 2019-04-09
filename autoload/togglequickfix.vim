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
        let id = getqflist({'winid' : 1}).winid
    else
        " query location list window
        let id = getloclist(0, {'winid' : 1}).winid
    endif

    return id != 0
endfunction "}}}

fun! togglequickfix#Loop() "{{{
    "       ql
    "       v
    " xx -> qx -> xl
    " ^           |
    "  `---------'
    if togglequickfix#IsOpened("qf")
        if togglequickfix#IsOpened("locl")
            lclose
        else
            cclose
            lwindow
        endif
    else
        if togglequickfix#IsOpened("locl")
            lclose
        else
            cwindow
        endif
    endif
endfunction "}}}
