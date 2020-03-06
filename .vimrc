call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Hotkeys
map <C-n> :NERDTreeToggle<CR>
filetype on
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>


let g:airline#extensions#tabline#enabled = 1

" Display
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set cursorline
set relativenumber

" Remove sound
set visualbell
