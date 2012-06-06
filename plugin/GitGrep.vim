" Adds git grep functionality to vim:
" :G pattern
" <leader>g with the word below the cursor

" :G pattern {
  function GitGrep(...)
    let l:what = ''
    for i in a:000
      let l:what = l:what . ' ' . i
    endfor

    " always use same window
    let winnr = bufwinnr('^GitGrep')
    if ( winnr >= 0 )
      execute winnr . 'wincmd w'
      call setbufvar(winbufnr(winnr()), "&modifiable", 1)
      execute 'normal ggdG'
    else
      new GitGrep
      call setbufvar(winbufnr(winnr()), "&mod", 0)
      call setbufvar(winbufnr(winnr()), "&bufhidden", 'delete')
      call setbufvar(winbufnr(winnr()), "&modifiable", 0)
      call setbufvar(winbufnr(winnr()), "&buftype", 'nofile')
    endif
    call setbufvar(winbufnr(winnr()), "&modifiable", 1)
    execute "r!git grep -n ".l:what." \| cat"
    call setbufvar(winbufnr(winnr()), "&mod", 0)
    call setbufvar(winbufnr(winnr()), "&modifiable", 0)
    unlet l:what

  endfunction

  command -nargs=? G call GitGrep(<f-args>)
" }

" leader+g {
  func GitGrepWord()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'))
  endf

  nmap <leader>g :call GitGrepWord()<CR>
" }
