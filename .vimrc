" Options

set hlsearch
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=5

" Mappings

"" Disabled

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <C-R> <Nop>

"" Natural noh
nnoremap <Esc> :noh<Enter>

"" Leader mappings

let mapleader = "\\"

""" Handling vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<Enter>
nnoremap <leader>sv :source $MYVIMRC<Enter>

""" Display registers
nnoremap <leader>r :reg<Enter>

""" Toggle relative line number
nnoremap <leader>re :set rnu!<Enter>

""" Undo undo
nnoremap <leader>u <C-R>

""" Sort selected lines
vnoremap <leader>s :sort<Enter>


" Plugins

packadd! matchit

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
call plug#end()
