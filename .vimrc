"++ PLUGINS+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/seoul256.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
call plug#end()

"++ COLOUR SCHEME+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
silent! colorscheme seoul256
set background=light
filetype plugin indent on
set laststatus=2
syntax enable
highlight Folded ctermbg=lightgrey
highlight SpecialKey ctermfg=grey
if (has("termguicolors"))
 set termguicolors
endif

"++ CTRL-P++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if executable('rg')
  set grepprg=rg\ --color-never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

"++ NERD TREE+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=40

"++ BASE OPTIONS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set backspace=2
set colorcolumn=98,120
set encoding=utf-8
set lazyredraw
set list
set listchars=tab:→-,extends:›,precedes:‹,trail:·
set mouse=a
set number
set numberwidth=4
set relativenumber
set ruler
set showbreak=↪
set tags=./tags;
set ttyfast

"++ LINE BREAK++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

"++ IDENTATION++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set foldmethod=syntax
set nofoldenable

"++ "JAVASCRIPT+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd Filetype javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"++ MAPPINGS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Move arround panels with Ctrl+HJKL
noremap <C-H> <C-W><Left>
noremap <C-K> <C-W><Up>
noremap <C-J> <C-W><Down>
noremap <C-L> <C-W><Right>
" Toggles
noremap <F2> :set invrelativenumber<CR>
noremap <F3> :set invnumber<CR>
noremap <C-]> g<C-]>
noremap <C-b> :NERDTreeToggle<CR>
noremap <F12> :setlocal foldenable!<CR>
" Copy path to clipboard
nnoremap <Leader>yc :let @+=expand('%:p')<CR>
nnoremap <Leader>yp :let @+=expand('%:p') . ':' . line(".")<CR>
" Show me those buffers
nnoremap <leader>b :ls<cr>:b<space>
