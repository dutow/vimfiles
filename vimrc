set nocompatible
filetype off

if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/Vundle.vim/
  let VIMDIR="~/vimfiles/"
  set guifont=Consolas:h12
else
  set rtp+=~/.vim/bundle/Vundle.vim
  let VIMDIR="~/.vim/"
  call vundle#begin()
endif

let BUNDLEDIR=VIMDIR . "/bundle"
call vundle#begin(BUNDLEDIR)
  
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'sjl/gundo.vim'

" Plugin 'jalcine/cmake.vim'
Plugin 'tpope/vim-dispatch'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'valloric/youcompleteme'
Plugin 'kana/vim-operator-user'
Plugin 'Shougo/vimproc.vim'
Plugin 'rhysd/vim-clang-format'

Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'

Plugin 'majutsushi/tagbar'

Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme solarized

set noexrc " don't use .gvimrc etc
let mapleader ="\<Space>"
set history=1000
set title
set colorcolumn=120
set magic
set backup
execute "set backupdir=" . VIMDIR ."backup/"
execute "set directory=" . VIMDIR ."tmp/"
set clipboard=unnamed
set fileformats=unix,dos,mac
set hidden
set iskeyword+=_,$,@,%,#
set mouse=a
set noerrorbells
set novisualbell
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start

set cursorcolumn
set cursorline
set incsearch
set hlsearch
set ruler
set number
set numberwidth=5
set showcmd
set nowrap

set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab smarttab

" Fugitiv {
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gb :Git branch<Space>
" }

" Gundo {
    nnoremap <F5> :GundoToggle<CR>
    let g:gundo_right = 1
" }

" NERDTree {
  nnoremap <F4> :NERDTreeTabsToggle<CR>
  let NERDTreeShowHidden=1
" }

" Key Mappings {
  " Reindent file by pressing F7
  map <F7> mzgg=G`z<CR>

  " Disable array keys for navigations {
    inoremap  <Up>     <NOP>
    inoremap  <Down>   <NOP>
    inoremap  <Left>   <NOP>
    inoremap  <Right>  <NOP>
    noremap   <Up>     <NOP>
    noremap   <Down>   <NOP>
    "noremap   <Left>   <NOP>
    "noremap   <Right>  <NOP>
  " }

" }
"
" C++ {
  autocmd FileType c ClangFormatAutoEnable
  autocmd FileType cpp ClangFormatAutoEnable
  set makeprg=ninja
" }

" Quick Stuff {

" Quick save and close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Using the system dashboard
vmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>P "+P
vmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>p "+p

" }
