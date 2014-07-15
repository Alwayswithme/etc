setlocal softtabstop=4 sw=4
setlocal colorcolumn=80        "visible print margin indicator
setlocal omnifunc=javacomplete#Complete
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 
"F9 compile java
map <F9> :w<CR>:!clear<CR>:!javac % <CR>
"F10 run java
map <F10> :!clear<CR>:!java %<<CR>

"abbreviation
iab str String
iab vlt volatile
iab pu public
iab pr private
iab vd void
iab pt protected
iab imt import
iab ims implements
iab pkg package
iab exs extends
iab lli LinkedList
iab ali ArrayList
iab hma HashMap
iab sync synchronized
iab fl final
iab fnl finally

iab Sop System.out.println
iab aor @author Phoenix Yip
iab Orr @Override
iab Dpc @Deprecated

"mapping
inoremap main public static void main(String[] args) {<CR>}<Esc>ko
inoremap pcla public class {<CR>}<Esc>k$i
inoremap pabs public abstract class {<CR>}<Esc>k$i
inoremap pint public interface {<CR>}<Esc>k$i
inoremap penu public enum {<CR>}<Esc>k$i
inoremap fe( for () {<CR>}<Esc>?()<CR>a
inoremap fr( for () {<CR>}<Esc>?()<CR>a
inoremap cs{ class {<CR>}<Esc>k$i
inoremap pv{ public void {<CR>}<Esc>k$i
inoremap psf public static final 
inoremap ps public static 
inoremap tryIn try {<CR>} catch(InterruptedException e) {<CR>}<Esc>2k$o
inoremap prf private final 
inoremap Otostr @Override<CR>public String toString() {<CR>return 
inoremap Orun @Override<CR>public void run() {<CR>
inoremap bk; break;<CR>
"fold
"set foldcolumn=2

"indent
set cindent
set completeopt=longest,menuone

set expandtab
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
