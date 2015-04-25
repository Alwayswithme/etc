setlocal et sts=2 sw=2 ts=2
function! Header()
    call append(0,"--")
    call append(1,"-- Author     :  Ye Jinchang")
    call append(2,"-- Date       :  ".strftime("%Y-%m-%d %H:%M:%S"))
    let title = expand("%:t:r")
    let title = substitute(title, "-", " ", "g")
    call append(3,"-- Title      :  " . title)
    call append(4,"--")
endf

map <F4> :call Header() <cr>