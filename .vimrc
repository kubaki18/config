" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
set showmode
set showcmd
set wildmenu
set wildmode=longest:list,full
set lazyredraw
set showmatch
set encoding=utf-8
set t_Co=256


filetype indent on
filetype plugin indent on
set autoindent
set smartindent
set tabstop=2
set shiftwidth=4
set expandtab
set softtabstop=2


colorscheme molokai
syntax enable
set number
set relativenumber
set cursorline
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
"set sidescrolloff=15
set ruler


set hlsearch
set incsearch
set ignorecase
set smartcase
"set spell spelllang=en_us


set undofile
set undodir=~/.vim/.undo//
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set autochdir
"set visualbell
set history=1000
set autoread


set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent


""""ALT SETUP""""
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

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
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ack
nnoremap <M-j> :m.+1<CR>
nnoremap <M-k> :m.-2<CR>==
inoremap <M-j> <Esc>:m.+1<CR>==gi
inoremap <M-k> <Esc>:m.-2<CR>==gi
vnoremap <M-j> :m'>+1<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv

""""YCM""""
nnoremap <leader>f :YcmCompleter FixIt<CR>


""""MUNDO""""
let g:mundo_prefer_python3 = 1
nnoremap <leader>u :MundoToggle<CR>


""""VIMSPECTOR""""
let g:vimspector_enable_mappings = 'HUMAN'


""""CTRLP""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

""""Transparent Background""""
hi Normal guibg=NONE ctermbg=NONE
