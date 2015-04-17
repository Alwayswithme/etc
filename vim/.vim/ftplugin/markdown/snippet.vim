function! NewPost()
    call setline(0,"---")
    call append(0,"---")
    call append(1,"layout       :  post")
    " use part of filename be title
    let title = strpart(expand("%:t:r"), 11)
    let title = substitute(title, "-", " ", "g")
    call append(2,"title        :  \"" . title . '"')
    call append(3,"date         :  ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(4,"categories   :  jekyll update")
    call append(5,"---")
endf

map <F4> :call NewPost() <cr>
