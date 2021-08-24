if exists('g:loaded_csearch') || &cp
  finish
endif

if !exists('g:csearchprg')
  let g:csearchprg = 'csearch'
endif

if !exists('g:cindexprg')
  let g:cindexprg = 'cindex'
endif

command! -nargs=* -complete=file Cindex   call csearch#Cindex(<f-args>)
command! -nargs=* -complete=file Csearch  call csearch#Csearch(<f-args>)
command! -nargs=* -complete=file Lcsearch call csearch#Lcsearch(<f-args>)

let g:loaded_csearch = 1
" vim:set et sw=2 ts=2 tw=78 fdm=marker
