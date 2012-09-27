" Help {
" Maps Ctrl+F1 into inline help
" Requires apache and lynx and php manual
" TODO: add support for classes and class member functions

  function! OpenPhpHelp()
    let l:w = substitute(expand("<cword>"), '_', '-', 'g')

    " always use same window
    let winnr = bufwinnr('^PHPhelp')
    if ( winnr >= 0 )
      execute winnr . 'wincmd w'
      call setbufvar(winbufnr(winnr()), "&modifiable", 1)
      execute 'normal ggdG'
    else
      new PHPhelp
      call setbufvar(winbufnr(winnr()), "&mod", 0)
      call setbufvar(winbufnr(winnr()), "&bufhidden", 'delete')
      call setbufvar(winbufnr(winnr()), "&modifiable", 0)
      call setbufvar(winbufnr(winnr()), "&buftype", 'nofile')
    endif
    call setbufvar(winbufnr(winnr()), "&modifiable", 1)
    execute "r!lynx -dump http://localhost/phpman/function.".l:w.".html \| cat"
    call setbufvar(winbufnr(winnr()), "&mod", 0)
    call setbufvar(winbufnr(winnr()), "&modifiable", 0)
    unlet l:w
  endfunction

  nnoremap <leader>h :call OpenPhpHelp()<CR>:1<CR>

" }
