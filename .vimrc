set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'flass/vim-colorschemes'

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Vundle ends here, rest of the configuration goes here

let mapleader = ","
syntax enable
colorscheme slate
set background=dark

"" Mappings {{{
"
"" Insert mode mappings {{{
"inoremap <C-l> <space>=><space>
"inoremap <C-s> <Esc>:w<CR>a
"inoremap <C-p> binding.pry
"" }}}
"
"" Normal mode mappings {{{
"nnoremap <C-s> :w<CR>
"nnoremap <leader>ev :vs $MYVIMRC<CR>
"nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>

" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew ~/.vimrc<CR>

map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-K> <C-W>k
map <C-L> <C-W>l

"nnoremap <leader>a :Ack
"nnoremap <leader>d :bd<CR>
"nnoremap <leader>w :w<CR>
"nnoremap <leader><cr> :noh<CR>
"nnoremap <leader>l :ls<CR>:b
"nnoremap <leader>t :CtrlP<CR>
"nnoremap n nzz
"nnoremap N Nzz
"" }}}
"
"" Visual mode mappings {{{
"vnoremap < <gv
"vnoremap > >gv

" Execute dot in the selection
vnoremap . :norm.<CR>
" }}}

" }}}

" General settings {{{
set t_Co=256
set autoindent
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Monaco:h16
set guioptions-=Be
set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
" set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set number
set shell=/bin/bash
set showmatch
set smartcase
set smartindent
set term=screen-256color
set ts=4 sts=4 sw=2 expandtab
set visualbell
set winheight=999
set winheight=5
set winminheight=5
"set winwidth=84
" }}}

" Autocommands {{{

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set filetype=markdown textwidth=79
au Bufread,BufNewFile *.markdown set textwidth=79

" }}}

" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

" }}}

" Specific configurations {{{
let g:molokai_original = 1
" }}}

" vim: foldmethod=marker foldmarker={{{,}}}

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Pathogen plugin manager
execute pathogen#infect()
