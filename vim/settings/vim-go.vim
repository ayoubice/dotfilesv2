" use the pkg name when we create a new file.
let g:go_template_use_pkg = 1

" use the snakecase when we add tags.
let g:go_addtags_transform = 'snakecase'

" key maps
au FileType go nmap <leader> :GoVet<CR>
nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
            nmap <buffer> gr <plug>(lsp-references)
                nmap <buffer> gi <plug>(lsp-implementation)
                    nmap <buffer> gt <plug>(lsp-type-definition)
                        nmap <buffer> <leader>rn <plug>(lsp-rename)
                            nmap <buffer> [g <plug>(lsp-previous-diagnostic)
                                nmap <buffer> ]g <plug>(lsp-next-diagnostic)
                                    nmap <buffer> K <plug>(lsp-hover)

" Use popup windows for Go Doc
let g:go_doc_popup_window = 1
