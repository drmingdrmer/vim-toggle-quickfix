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
