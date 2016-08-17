set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'sjl/gundo.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'valloric/youcompleteme'
Plugin 'kana/vim-operator-user'
Plugin 'Shougo/vimproc.vim'
Plugin 'rhysd/vim-clang-format'

Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'

Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme solarized

set noexrc " don't use .gvimrc etc
let mapleader =","
set history=1000
set title
set colorcolumn=120
set magic
set backup
set backupdir=~/.vim/backup
set clipboard=unnamed
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
set hidden
set iskeyword+=_,$,@,%,#
set mouse=a
set noerrorbells
set novisualbell
set wildmenu
set wildmode=list:longest,full

set cursorcolumn
set cursorline
set incsearch
set hlsearch
set ruler
set number
set numberwidth=5
set showcmd
set nowrap

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
" }
