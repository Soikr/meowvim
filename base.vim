"
" NATIVE CONFIG
"

"mappings
let mapleader = ' '
inoremap jk <Esc>

"quit
nmap <silent> <C-p> :q<CR>
nmap <silent> <C-m> :update<CR>

"jump back to and forth
noremap <leader>o <C-o>zz
noremap <leader>i <C-i>zz

"trailing
"noremap <C-c> <S-j>

"buffer TODO find new ones
"nmap <C-n> :bnext<CR>
"nmap <C-p> :bprevious<CR>
"nmap <C-y> :bdelete<CR>

"save
set autowrite
set autowriteall

"save undo / redo across sessions
set undofile
set undodir=~/.vim/undo

"splits
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

noremap <silent> <C-h> :call WinMove('h')<CR>
noremap <silent> <C-j> :call WinMove('j')<CR>
noremap <silent> <C-k> :call WinMove('k')<CR>
noremap <silent> <C-l> :call WinMove('l')<CR>

"terminal
tnoremap jk <C-\><C-n>
tnoremap <C-u> <C-\><C-n>:q<CR>

"signcolumn
set timeoutlen=300
set signcolumn=yes

"true colors
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"vim update delay in ms
set updatetime=250

"useful for resizing panes
set mouse=a

"syntax
syntax enable

"is not useful in screenshare
"use :set number to disable
set number relativenumber

set autoread
set encoding=UTF-8
"set foldmethod=syntax

"uses system clipboard
set clipboard=unnamedplus

"disable pre rendering of some things like ```
set conceallevel=0

"default for vim sleuth
set expandtab
set tabstop=2
set shiftwidth=2

"split
set splitbelow
set splitright

"in house fuzzy finder
set path+=**

"searching
set ignorecase
set smartcase
set hlsearch
nmap <Esc> <cmd>nohlsearch<cr>

set cursorline
set laststatus=2
set scrolloff=8
set startofline

"autosave files
augroup save_when_leave
  au BufLeave * silent! wall
augroup END

set hidden
set nobackup
set nowritebackup
set noswapfile
set noshowmode "already in status line

"automatically source .vimrc from project folder
set exrc
set secure

"filetypes
au BufRead,BufNewFile *.nix set filetype=nix
