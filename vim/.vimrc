" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup            " do not keep a backup file, use versions instead
set history=100         " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set t_Co=256
set background=dark
colo molokai

"colorscheme badwolf

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 16 || has("gui_running")
  syntax on
  set hlsearch
  au BufReadPost *.twig colorscheme koehler 
  au BufReadPost *.css colorscheme slate 
  au BufReadPost *.js colorscheme vividchalk
  au BufReadPost *.py colorscheme molokai
  au BufReadPost *.html colorscheme molokai
  au BufReadPost *.java colorscheme molokai
  au BufReadPost *.php colorscheme two2tango

endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
  
else
  set autoindent           "always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

""""  about display
"set textwidth=80          "textwidth beyond 80
set wrap                  "warp
set number                "show line numbers
set scrolloff=5           "enable context
set showmatch             "highligh brackets
set sidescroll=10         "scroll horizontally
set whichwrap=b,s,<,>     "specified keys move the cursor
set colorcolumn=80        "visible print margin indicator
set formatoptions+=Mmtn
set list                  "show tab
set listchars=tab:>>,trail:-   "tab=> space= 
set cursorline

""""  about search
set hlsearch              "highlight search
set smartcase
set ignorecase            "ignore character case in search mode

""""  about indent
set smarttab
set smartindent           "smartindent
set linebreak             "linebreak
set expandtab             "use space for tab
set softtabstop=4         "4 spaces transfer 1 tab
set shiftwidth=4          "indent 4 spaces

"""" auto-complete
set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone
"The following three lines map Ctrl+s to save in vi.  You can comment 
"these out, it has nothing to do with syntax highlighting or colors.
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

"mapping
"use jj to change to Normal mode
imap jj <Esc>
"map <Alt-c> copy to clipboard
set <A-c>=c
map <A-c> <ESC>gg"+yGG
"open new tab
set <A-t>=t
map <A-t> :tabnew<CR>
"<Alt-n> next tab
set <A-n>=n
nmap <A-n> gt
"<Alt-p> previous tab
set <A-p>=p
nmap <A-p> gT
"<Alt-f> format the whole file
set <A-f>=f
nmap <A-f> gg=G``
"z{ to fold a block
nmap z{ zfa{
nmap <F7> :%s/\r$//g<CR>:nohl<CR>
"F5 delete trailing blank
nmap <F5> :%s/\s*$//<CR>:nohl<CR>
"F6 delete dupucate blank line
nmap <F6> :g/^\n$/d<CR>

" Abbreviations
iabbrev phx~ Phoenix Ye

""" gvim option
set guioptions-=m         "turn off menu bar
set guioptions-=T         "turn off toolbar
set guioptions-=L         "turn off scroll bar
set guifont=monospace\ 12

" netrw setting
let g:netrw_winsize= 80
let g:netrw_liststyle= 3
" let g:netrw_list_hide= '^[.].*'
" let g:netrw_list_hide= '.*\.swp$'

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" encoding
set encoding=utf-8
set fileencodings=utf-8,gb18030,big5,latin1
