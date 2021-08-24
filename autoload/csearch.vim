let s:cmdline = ''

function! csearch#Cindex(...)
  let args = copy(a:000)
  call map(args, 'shellescape(v:val)')
  execute '!' . g:cindexprg . ' ' . join(args, ' ')
endfunction

function! s:DoSearch(searchCmd, browseCmd, args)
  " If no patern is given search for the word under cursor.
  let grepargs = shellescape(get(a:args, 0, expand('<cword>')))
  let filepattern = get(a:args, 1, '')
  if !empty(filepattern)
    let grepargs = '-f ' . shellescape(filepattern) . ' ' . grepargs 
  endif
  let ic = &ignorecase ? ' -i ' : ''

  let s:cmdline = g:csearchprg . ' -n ' . ic . grepargs
  set grepformat='%f:%l:%m'
  execute 'silent' a:searchCmd 'system(s:cmdline)'
  execute 'botright' a:browseCmd
endfunction

function! csearch#Csearch(...)
  call s:DoSearch('cgetexpr', 'copen', a:000)
endfunction

function! csearch#Lcsearch(...)
  call s:DoSearch('lgetexpr', 'lopen', a:000)
endfunction

" vim:set et sw=2 ts=2 tw=78 fdm=marker
