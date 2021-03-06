" I'm tired of reloading my vimrc file
command! Resource execute "source ~/.vimrc"

"++ PLUGINS+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim') && empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !ln -s $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
call plug#end()

"++ COLOUR SCHEME+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
silent! colorscheme dracula
silent! set termguicolors
filetype plugin indent on
set laststatus=2
syntax enable
highlight Folded ctermbg=lightgrey
highlight SpecialKey ctermfg=grey

"++ CTRL-P++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if executable('rg')
  set grepprg=rg
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

"++ NERD TREE+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=40

"++ BASE OPTIONS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set backspace=2
set clipboard=unnamedplus
set colorcolumn=98,120
set encoding=utf-8
silent! set inccommand=split
set lazyredraw
set ignorecase
set smartcase
set list
set listchars=tab:>-,extends:›,precedes:‹,trail:·
set mouse=a
set nobackup
set nowritebackup
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

"++ JAVASCRIPT++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd Filetype javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"++ MAPPINGS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Leader key
let mapleader=" "
" Smash escape
inoremap jk <Esc>
inoremap kj <Esc>
" Move arround panels with Ctrl+HJKL
noremap <C-H> <C-W><Left>
noremap <C-K> <C-W><Up>
noremap <C-J> <C-W><Down>
noremap <C-L> <C-W><Right>
" Better jumping around tags
noremap <C-]> g<C-]>
" Toggles
noremap <C-r> :NERDTreeToggle<CR>
noremap <F2> :set invrelativenumber<CR>
noremap <F3> :set invnumber<CR>
noremap <F12> :setlocal foldenable!<CR>
" Copy path to clipboard
nnoremap <leader>yc :let @+=expand('%:p')<CR>
nnoremap <leader>yp :let @+=expand('%:p') . ':' . line(".")<CR>
" Show me syntax information
map <leader>syn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Better searching
nnoremap <leader>/ :global//#<Left><Left>
