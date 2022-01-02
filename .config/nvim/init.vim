if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Enter the current decade
set nocompatible

" Absolute and relative line numbers
set relativenumber
set number

" Tabulation
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Case insensitive search, disable error bell
set ignorecase
set nohlsearch
set smartcase
set noerrorbells

" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Colorscheme
Plug 'drewtempelmeyer/palenight.vim'

" Text object actions
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" Utility
Plug 'nacro90/numb.nvim'
Plug 'markonm/traces.vim'
Plug 'noahfrederick/vim-laravel'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Massive highlighting pack
Plug 'sheerun/vim-polyglot'

call plug#end()

syntax enable
filetype plugin indent on

" Initialize numb.nvim (line peeker)
lua require('numb').setup()

let g:php_version_id = 80009

" Map leader key to comma(,)
let g:mapleader = ','

" Show commands as they're typed
set showcmd

" Make searches recursive
set path+=**

" Display all matching files in a menu when tab completing
set wildmenu

" Disable saving swap files
set nobackup

" Disable automatic commenting on newline AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
autocmd FileType * setlocal formatoptions-=cro

" Return to last edit position when opening files
autocmd BufReadPost * :normal! '"zz

" Enable ctags
command! MakeTags !ctags -R .

" XDG Base Directory settings
set viminfo='10,:0,<0,@0,f0,n~/.config/nvim/.viminfo

" Colorscheme
colorscheme palenight

"""""""""""""""""""""""""""""""
"       Splitting rules       "
"""""""""""""""""""""""""""""""

" Default split locations
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make resizing splits a little friendlier
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-W>H
map <Leader>tk <C-w>t<C-W>K

"""""""""""""""""""""""""""""""
"           Keymaps           "
"""""""""""""""""""""""""""""""

nnoremap <S-Enter> o<Esc>k
nnoremap <C-Enter> O<Esc>j

nmap <C-p> <Plug>MarkdownPreviewToggle
nmap <C-s> :!sent %<CR>

