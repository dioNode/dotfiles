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
" set paste

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
"Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme',{'do':'./install.py'}
Plug 'mbbill/undotree'
"Plug 'scrooloose/nerdtree'
Plug 'rrethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim' " Ranger dependance for neovim
Plug 'francoiscabrol/ranger.vim' " Ranger

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
" let g:netrw_browse_split=2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25
" 
" let g:ctrlp_use_caching = 0

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
" noremap <Tab><Tab> :NERDTreeToggle<CR>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
nnoremap <leader>f :Ranger<CR>

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" Vim Plug
nnoremap <leader>pin :w <bar> :source $MYVIMRC <bar> :PlugInstall<CR> 
nnoremap <leader>pcl :w <bar> :source $MYVIMRC <bar> :PlugClean<CR>

" Run command
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>

" Lines to save ftext folding
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" ================================="
"               FZF                "
" ================================="
nnoremap <C-f> <Esc><Esc>:BLines!<CR>
"nnoremap <c-p> :FZF<CR>
nnoremap <c-p> :call fzf#vim#files('.', fzf#vim#with_preview('right'))<CR>
nnoremap <C-g> <Esc><Esc>:BCommits!<CR>

" ================================="
"           UltiSnips              "
" ================================="
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:tex_flavor = "latex"
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>es :UltiSnipsEdit<CR>
