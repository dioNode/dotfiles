" MY AWESOME VIMRC FILE
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set cursorline
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme',{'do':'./install.py'}
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'rrethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"Plug 'ThePrimeagen/vim-be-good'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

noremap <leader>wl :vnew<CR><C-w>r
noremap <leader>wh :vnew<CR>
noremap <leader>wj :new<CR><C-w>r
noremap <leader>wk :new<CR>
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
noremap <Tab><Tab> :NERDTreeToggle<CR>

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" Vim Plug
nnoremap <leader>pin :w <bar> :source $MYVIMRC <bar> :PlugInstall<CR> 
nnoremap <leader>pcl :w <bar> :source $MYVIMRC <bar> :PlugClean<CR>

" Run command
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>

" Lines to save ftext folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
