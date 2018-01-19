fu! s:load(module)
  exec 'source ' fnameescape(expand('~/.vim/modules/' . a:module . '.vim'))
endfu

call s:load('bundles')


if has('nvim')
  call s:load('ncompletion')
else
  call s:load('completion')
endif

call s:load('options')
call s:load('autocmds')
call s:load('statusline')
call s:load('unite')

call s:load('plugins')
call s:load('mappings')

call s:load('helpers')
call s:load('misc')

call s:load('colors')
call s:load('smartinput')



if has('gui_running')
  set background=light
  colorscheme solarized
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Pomicons\ Book
endif

if filereadable(expand(".vimrc.local"))
  source .vimrc.local
endif

let NERDTreeMapOpenInTab='<Leader>nt'

" function! JumpToCSS()
"   let id_pos = searchpos("id", "nb", line('.'))[1]
"   let class_pos = searchpos("class", "nb", line('.'))[1]

"   if class_pos > 0 || id_pos > 0
"     if class_pos < id_pos
"       execute ":vim '#".expand('<cword>')."' **/*.css"
"     elseif class_pos > id_pos
"       execute ":vim '.".expand('<cword>')."' **/*.css"
"     endif
"   endif
" endfunction

" nnoremap <F9> :call JumpToCSS()<CR>
" let g:webdevicons_enable_ctrlp = 1
