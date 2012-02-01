" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"
"   Originally from:
"   http://robertmelton.com/
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor 
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch) 
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the 
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line 
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match 
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on

    let mapleader = "," " map leader from / to ,
    set history=1000 " longer history
    set title " set terminal title
" }

" Setup pathogen {
" Load modules after nocompatible (required by fugitive)
  call pathogen#infect()
  colorscheme vividchalk
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set autochdir " always switch to the current file directory 
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    set clipboard+=unnamed " share windows clipboard
    set directory=~/.vim/tmp " directory to place swap files in
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers 
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest,full " turn on wild mode huge list
" }

" Vim UI {
    set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you 
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines 
                     " betweens rows
    set list " we do what to show tabs, to ensure we get them 
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing 
    set matchtime=5 " how many tenths of a second to blink 
                     " matching brackets for
    set hlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current 
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in 
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, 
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=2 " auto-indent amount when using cindent, 
                      " >>, << and stuff like that
    set softtabstop=2 " when hitting tab or backspace, how many spaces 
                       "should a tab be (see expandtab)
    set tabstop=2 " real tabs should be 8, and they will show with 
                   " set list on
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default 
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=1   " Autofold class member level
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds 
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function 
                                   " (cleaner than default)
" }

" Plugin Settings {
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars 
                              " inside strings

    " TagList Settings {
        let Tlist_Auto_Open=0 " let the tag list open automagically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill 
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by 
        let Tlist_Use_Right_Window = 1 " split to the right side
                                        " of the screen
        let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                 " read my functions
        " Language Specifics {
            " just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
    " }
" }

" Mappings {
    " ROT13 - fun
    map <F12> ggVGg?

    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>

" }

" Autocommands {
    " Git {
    " Always start on first line
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
    " }
    " Ruby {
        " ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        au BufRead,BufNewFile *.notes set foldlevel=2
        au BufRead,BufNewFile *.notes set foldmethod=indent
        au BufRead,BufNewFile *.notes set foldtext=foldtext()
        au BufRead,BufNewFile *.notes set listchars=tab:\ \ 
        au BufRead,BufNewFile *.notes set noexpandtab
        au BufRead,BufNewFile *.notes set shiftwidth=8
        au BufRead,BufNewFile *.notes set softtabstop=8
        au BufRead,BufNewFile *.notes set tabstop=8
        au BufRead,BufNewFile *.notes set syntax=notes
        au BufRead,BufNewFile *.notes set nocursorcolumn
        au BufRead,BufNewFile *.notes set nocursorline
        au BufRead,BufNewFile *.notes set guifont=Consolas:h12
        au BufRead,BufNewFile *.notes set spell
    " }
    au BufNewFile,BufRead *.ahk setf ahk 
" }

" GUI Settings {
if has("gui_running")
    " Basics {
        colorscheme metacosm " my color scheme (only works in GUI)
        set columns=180 " perfect size for me
        set guifont=Consolas:h10 " My favorite font
        set guioptions=ce 
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=55 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }

    " Font Switching Binds {
        map <F8> <ESC>:set guifont=Consolas:h8<CR>
        map <F9> <ESC>:set guifont=Consolas:h10<CR>
        map <F10> <ESC>:set guifont=Consolas:h12<CR>
        map <F11> <ESC>:set guifont=Consolas:h16<CR>
        map <F12> <ESC>:set guifont=Consolas:h20<CR>
    " }
endif
" }

" Syntastic {
  let g:syntastic_check_on_open=1 " check syntax on open
  let g:syntastic_auto_loc_list=2 " auto open error list and never close automatically
  let g:syntastic_enable_signs=1
  set statusline+=%{SyntasticStatuslineFlag()}
  " TODO: disable on windows
" }
"
" MiniBufferExplorer {
  let g:miniBufExplSplitToBelow = 0
  let g:miniBufExplUseSingleClick = 1
  let g:miniBufExplorerMoreThanOne = 1

" }

" NERDTree {
  autocmd vimenter * NERDTree " auto open
  autocmd VimEnter * wincmd p " move cursor to real buffer
  " auto close if nerdtree OR minibuffer OR nerdtree AND minibuffer is last
  " basically if nerdtree is last window or if only one window remains with
  " nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") |  q | endif
  autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | q | endif
" }

" Key Mappings {
  " , + c close buffer
  nnoremap <Leader>x :bd<CR>

  " Disable array keys for navigations {
    inoremap  <Up>     <NOP>
    inoremap  <Down>   <NOP>
    inoremap  <Left>   <NOP>
    inoremap  <Right>  <NOP>
    noremap   <Up>     <NOP>
    noremap   <Down>   <NOP>
    noremap   <Left>   <NOP>
    noremap   <Right>  <NOP>
  " }

" }

" Code Completion {
  set completeopt=longest,menuone
"  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"  inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"    \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"  inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  let g:SuperTabDefaultCompletionType = "context"
" }

" Multiple windows {
  " remap keys for easier navigation
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" Maximize the window after entering it, be sure to keep the quickfix window
" at the specified height.
au WinEnter * call MaximizeAndResizeQuickfix(8)

" Maximize current window and set the quickfix window to the specified height.
" TODO: make buffer switcher fixed size at the top
" TODO: don't resize nerdtree
" TODO: set window's default height to 0?
function MaximizeAndResizeQuickfix(quickfixHeight)
  " Redraw after executing the function.
  set lazyredraw
  " Ignore WinEnter events for now.
  set ei=WinEnter
  " Maximize current window unless it is a special window.
  " (don't resize buffer switcher or NERDTree)
  " TODO: fix this for nerdtree
  if (getbufvar(winbufnr(winnr()), "&buflisted") != 0)
    wincmd _
  endif
  " If the current window is the quickfix window
  if (getbufvar(winbufnr(winnr()), "&buftype") == "quickfix")
    " Maximize previous window, and resize the quickfix window to the
    " specified height.
    wincmd p
    resize
    wincmd p
    exe "resize " . a:quickfixHeight
  else " if the current window has a hidden buffer (see at the start of this function
    if (getbufvar(winbufnr(winnr()), "&buflisted") == 0)
      " nop
    else
      " Current window isn't the quickfix window, and isn't spec window => loop over all windows to
      " find it (if it exists...)
      let i = 1
      let currBufNr = winbufnr(i)
      while (currBufNr != -1)
        " If the buffer in window i is the quickfix buffer.
        if (getbufvar(currBufNr, "&buftype") == "quickfix")
          " Go to the quickfix window, set height to quickfixHeight, and jump to the previous
          " window.
          exe i . "wincmd w"
          exe "resize " . a:quickfixHeight
          wincmd p
          break
        endif
        let i = i + 1
        let currBufNr = winbufnr(i)
      endwhile
    endif
  endif
  set ei-=WinEnter
  set nolazyredraw
endfunction

" Remap ,m to make and open error window if there are any errors. If there
" weren't any errors, the current window is maximized.
map <silent> ,i :Errors<CR>:call MaximizeIfNotQuickfix()<CR>

" Maximizes the current window if it is not the quickfix window.
function MaximizeIfNotQuickfix()
  if (getbufvar(winbufnr(winnr()), "&buftype") != "quickfix")
    "wincmd _
  endif
endfunction



" }

" Git shortcuts {
  noremap gts :Gstatus<cr>
  noremap gtc :Gcommit<cr>
  noremap gtf :Gcommit -a<cr>
  noremap gtb :Gblame<cr>
  noremap gta :Gwrite<cr>
  noremap gtl :Glog<cr>
  noremap gtd :Gdiff<cr>
" }
