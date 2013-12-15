setlocal sts=4 sw=4 ts=4
setlocal omnifunc=javacomplete#Complete
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 
"F9 compile java
map <F9> :w<CR>:!clear<CR>:!javac % <CR>
"F10 run java
map <F10> :!clear<CR>:!java %<<CR>

"main abbreviation
ia main public static void main(String[] args) {
