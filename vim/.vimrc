set nocompatible

" Plugins
call plug#begin()

Plug 'vague-theme/vague.vim'

call plug#end()

" Colors
set termguicolors
colorscheme vague

set clipboard=unnamedplus
set mouse=a

set number
set relativenumber
set scrolloff=10

" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Search
set ignorecase
set hlsearch

let mapleader = " "
nnoremap <esc> :nohlsearch<cr>
