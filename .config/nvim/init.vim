" Relative and absolute line numbers
set relativenumber
set number

" Tabulation
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Case insensitive search, disable error bell
set ignorecase
set smartcase
set noerrorbells

" XDG Base Directory settings
set undodir=$XDG_DATA_HOME/nvim/undo
set directory=$XDG_DATA_HOME/nvim/swap
set viewdir=$XDG_DATA_HOME/nvim/view
set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo
set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" Set Vim to share clipboard with the system
set clipboard=unnamedplus

" Reset terminal cursor when leaving Vim
au VimLeave * set guicursor=a:ver5-blinkon0

colorscheme elflord

