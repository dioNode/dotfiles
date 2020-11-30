 "_____  _             _      __      ___                    
 "|  __ \(_)           ( )     \ \    / (_)                   
 "| |  | |_  ___  _ __ |/ ___   \ \  / / _ _ __ ___  _ __ ___ 
 "| |  | | |/ _ \| '_ \  / __|   \ \/ / | | '_ ` _ \| '__/ __|
 "| |__| | | (_) | | | | \__ \    \  /  | | | | | | | | | (__ 
 "|_____/|_|\___/|_| |_| |___/     \/   |_|_| |_| |_|_|  \___|

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'valloric/youcompleteme',{'do':'./install.py'}
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'rrethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim' " Ranger dependance for neovim
Plug 'francoiscabrol/ranger.vim' " Ranger
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'taketwo/vim-ros'
Plug 'majutsushi/tagbar'
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()

" Vim Plug
nnoremap <leader>pin :w <bar> :source $MYVIMRC <bar> :PlugInstall<CR> 
nnoremap <leader>pcl :w <bar> :source $MYVIMRC <bar> :PlugClean<CR>

" Settings
syntax on
filetype plugin indent on
"set clipboard+=unnamedplus
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
set directory=~/.vim/tmp
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set paste
let mapleader = " "
let g:node_host_prog = '.nvm/versions/node/v12.17.0/bin/neovim-node-host' 
" let g:ctrlp_use_caching = 0

" Commands
"autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>
" Automatic Recompiling
"autocmd BufWritePost config.h,config.def.h !sudo make install
map <Leader>tt :new term://zsh<CR><C-w>J

"Commenting
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Prettier
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
colorscheme gruvbox
set background=dark
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Version control
"nmap <leader>gs :G<CR>
"nmap <leader>gf :diffget //3<CR>
"nmap <leader>gj :diffget //2<CR>
"nnoremap <leader>gcom :Gcommit<CR>
"nnoremap <leader>gpl :Gpull<CR>
"nnoremap <leader>gpu :Gpush<CR>
" Git Gutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitgutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0


" Movement
nnoremap <silent> <esc><esc> :nohlsearch<CR>
"if executable('rg')
    "let g:rg_derive_root='true'
"endif
nnoremap <C-f> <Esc><Esc>:BLines!<CR>
"nnoremap <c-p> :FZF<CR>
nnoremap <c-p> :call fzf#vim#files('.', fzf#vim#with_preview('right'))<CR>
nnoremap <C-g> <Esc><Esc>:BCommits!<CR>
nnoremap <leader>f :Ranger<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
noremap <leader>wl :vnew<CR><C-w>L
noremap <leader>wh :vnew<CR>
noremap <leader>wj :new<CR><C-w>J
noremap <leader>wk :new<CR>
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"nnoremap <leader>ps :Rg<SPACE>
command! -bang -nargs=* -complete=file Rg call fzf#vim#grep('rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"' . <q-args>, 1, fzf#vim#with_preview(), <bang>0)
noremap <Tab><Tab> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Latex
autocmd bufRead,BufNewFile *.tex set filetype=tex
nmap <F12> :LLPStartPreview<cr>
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

" Folding
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" Snippets
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

" Spell checking
map <leader>s :setlocal spell! spelllang=en_au<CR>

" Flutter
let dart_html_in_strong=v:true
let g:flutter_hot_reload_on_save=1
