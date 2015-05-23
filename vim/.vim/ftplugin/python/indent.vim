function! Header()
    call append(0,"#!/bin/python")
    call append(1,"#")
    call append(2,"# Author     :  Ye Jinchang")
    call append(3,"# Date       :  ".strftime("%Y-%m-%d %H:%M:%S"))
    let title = expand("%:t:r")
    let title = substitute(title, "-", " ", "g")
    call append(4,"# Title      :  " . title)
    call append(5,"")
endf

map <F4> :call Header() <cr>

setlocal sts=4 sw=4 ts=4
set expandtab
set textwidth=80
set colorcolumn=80
