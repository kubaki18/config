call plug#begin()
"Plug 'dracula/vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
set encoding=UTF-8

call plug#end()


""""LOOKS & FEELING""""
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent


""""MAPPINGS""""
let mapleader=","
"nnoremap <space> za
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ms :mksession<CR>
nnoremap <M-j> :m.+1<CR>
nnoremap <M-k> :m.-2<CR>==
inoremap <M-j> <Esc>:m.+1<CR>==gi
inoremap <M-k> <Esc>:m.-2<CR>==gi
vnoremap <M-j> :m'>+1<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv


""""NERDTREE""""
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


""""COC""""
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-cmake', 'coc-jedi', 'coc-yaml', 'coc-sql', 'coc-snippets', 'coc-sh', 'coc-docker', 'coc-htmldjango']
source $HOME/.config/nvim/plug-config/coc.vim


""""UNDOTREE""""
nnoremap <leader>u :UndotreeToggle<CR>
