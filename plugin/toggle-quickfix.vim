if exists("g:__QUICKFIX_TOGGLE_jfklds__")
    finish
endif
let g:__QUICKFIX_TOGGLE_jfklds__ = 1

fun! s:QuickfixToggle() "{{{

    let nr = winnr("$")
    cwindow
    let nr2 = winnr("$")
    if nr == nr2
        cclose
    endif

endfunction "}}}

nnoremap <silent> <Plug>window:quickfix:toggle :call <SID>QuickfixToggle()<CR>
