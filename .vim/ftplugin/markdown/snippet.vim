function NewPost()
    call setline(0,"---")
    call append(0,"---")
    call append(1,"layout       :  post")
    call append(2,"title        :  ".expand("%<"))
    call append(3,"date         :  ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(4,"categories   :  jekyll update")
    call append(5,"---")
endf

map <F4> :call NewPost() <cr>
