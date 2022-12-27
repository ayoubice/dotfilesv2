" use the pkg name when we create a new file.
let g:go_template_use_pkg = 1

" use the snakecase when we add tags.
let g:go_addtags_transform = 'snakecase'

" key maps
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap gd <plug>(go-def)
autocmd FileType go nmap gr <plug>(go-referrers)
autocmd FileType go nmap gi <plug>(go-implements)
autocmd FileType go nmap gt <plug>(go-def-type)

" nmap <buffer> gs <plug>(lsp-document-symbol-search)
" nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
" nmap <buffer> <leader>rn <plug>(lsp-rename)
" nmap <buffer> [g <plug>(lsp-previous-diagnostic)
" nmap <buffer> ]g <plug>(lsp-next-diagnostic)
" nmap <buffer> K <plug>(lsp-hover)

" Use popup windows for Go Doc
let g:go_doc_popup_window = 1

" Reuse buffer when navigating to definitions
let g:go_def_reuse_buffer = 1
