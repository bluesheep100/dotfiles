if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Enter the current decade
set nocompatible

" Map leader key to comma(,)
let g:mapleader = ','

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

" Show commands as they're typed
set showcmd

" Make searches recursive
set path+=**

" Display all matching files in a menu when tab completing
set wildmenu

" Disable saving swap files
set nobackup

" Disable automatic commenting on newline AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
autocmd FileType * setlocal formatoptions-=cro

" Enable ctags
command! MakeTags !ctags -R .

" XDG Base Directory settings
set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/ReplaceWithRegister'

call plug#end()

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

