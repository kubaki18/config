call plug#begin()
Plug 'neovim/nvim-lspconfig'
"Plug 'dracula/vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'simrat39/rust-tools.nvim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'

Plug 'preservim/nerdcommenter'
"Plug 'tpope/vim-commentary'

Plug 'mbbill/undotree'

"Plug 'sakhnik/nvim-gdb', {'do': ':!./install.sh'}
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'rcarriga/nvim-notify'

Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
"Plug 'jesseduffield/lazygit'
Plug 'nvim-telescope/telescope.nvim'    
call plug#end()
set encoding=UTF-8

"lua require('init')
source $HOME/.config/nvim/lua/init.lua


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
if has("termguicolors")
    set termguicolors
endif
colorscheme jellybeans


""""MAPPINGS""""
let mapleader=" "
let maplocalleader=","
nnoremap <localleader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <localleader>ev :tabnew $MYVIMRC<CR> :vsp ~/.config/nvim/lua/init.lua<CR>
nnoremap <localleader>ez :vsp ~/.zshrc<CR>
nnoremap <localleader>sv :source $MYVIMRC<CR>
nnoremap <localleader>ms :mksession!<CR>
nnoremap <leader>w :wa<CR>
nnoremap <M-j> :m.+1<CR>
nnoremap <M-k> :m.-2<CR>==
inoremap <M-j> <Esc>:m.+1<CR>==gi
inoremap <M-k> <Esc>:m.-2<CR>==gi
vnoremap <M-j> :m'>+1<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv
tnoremap <Esc> <C-\><C-n>
" Go to tab by number
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


""""COC""""
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-cmake', 'coc-jedi', 'coc-yaml', 'coc-sql', 'coc-snippets', 'coc-sh', 'coc-docker', 'coc-htmldjango']
source $HOME/.config/nvim/plug-config/coc.vim
nmap <leader>qf <Plug>(coc-fix-current)


""""UNDOTREE""""
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1

""""NERDCOMMENTER""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
