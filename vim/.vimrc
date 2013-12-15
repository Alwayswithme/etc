" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
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
  autocmd FileType text setlocal textwidth=78

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

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set guioptions-=m         "turn off menu bar
set guioptions-=T         "turn off toolbar
set guioptions-=L         "turn off scroll bar
set t_Co=256              "enable 256 color
if has("gui_running")
    colorscheme badwolf
else
    colorscheme badwolf
endif

set number                "show line numbers
set so=5                 "enable context

set tabstop=4             "tab = 4, 
set shiftwidth=4          "indent 4 spaces
set softtabstop=4         "4 spaces transfer 1 tab
set expandtab             "use space for tab
set showmatch             "highligh brackets
set nobackup              "no backup files

set wrapmargin=6
set laststatus=2          "status show file name
set ruler
set smartcase             
set ignorecase            "ignore character case in search mode
set completeopt=menu
"set autochdir             "change directory of the file

"about indent
set smartindent           "smartindent
set autoindent            "autoindent
set linebreak             "linebreak
set cindent               "indent like C


"about search
set hlsearch              "highlight search
set incsearch             "sync search
set list                  "show tab 
set listchars=tab:>>,trail:-   "tab=> space= 
set smarttab

"about display
"set textwidth=80          "textwidth beyond 80
set wrap                  "warp
set sidescroll=10         "scroll horizontally
set whichwrap=b,s,<,>     "specified keys move the cursor
set colorcolumn=96        "visible right margin indicator
set formatoptions+=Mmtn

nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

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
"<Alt-w> write to save file
set <A-w>=w
nmap <A-w> :w
"<Alt-f> format the whole file
set <A-f>=f
nmap <A-f> gg=G
set nobackup

" Abbreviations
iabbrev phx Phoenix Yip
