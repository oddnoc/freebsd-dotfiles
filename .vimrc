" based on http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=4
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set timeoutlen=2000
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
let mapleader = ","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=120
set list
set listchars=tab:▸\ ,eol:¬
au FocusLost * :wa
nnoremap <leader>w <C-w>v<C-w>l
syntax enable
