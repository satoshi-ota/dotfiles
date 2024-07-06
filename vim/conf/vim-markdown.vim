let g:vim_markdown_folding_disabled=1
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_new_list_item_indent=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <C-o> :PrevimOpen<CR>
autocmd FileType c,cpp setlocal commentstring=//\ %s

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" let g:clang_format#detect_style_file=1
" autocmd FileType c,cpp ClangFormatAutoEnable
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
