" MY AWESOME VIM SETTINGS

"PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
"Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rrethy/vim-illuminate'

call plug#end()

"MAPPING
let mapleader = "\<Space>"
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>ov :tabnew $MYVIMRC<CR>
nnoremap <leader>oe :!explorer.exe .<CR>
"Go to tab by number
noremap <C-n> :tabnew<Space> 
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Split pane mapping
noremap <leader>wl :vnew<CR><C-w>r
noremap <leader>wh :vnew<CR>
noremap <leader>wj :new<CR><C-w>r
noremap <leader>wk :new<CR>
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
"General
noremap <Tab><Tab> :NERDTreeToggle<CR>
noremap <C-a> <Esc>ggVG
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
noremap <leader>pin :w <bar> :source $MYVIMRC <bar> :PlugInstall<CR>
noremap <leader>pcl :w <bar> :source $MYVIMRC <bar> :PlugClean<CR>

"COMMANDS
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>
command! MakeTags !ctags -R .

"SETTINGS
set nocompatible
filetype on
filetype plugin on
"set mouse=a
" Remove sound
set visualbell

"DISPLAY
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:airline#extensions#tabline#enabled = 1
colorscheme solarized

set cursorline
set number
set relativenumber

if &term =~ '256color'
	    " Disable Background Color Erase (BCE) so that color schemes
	    " work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif

