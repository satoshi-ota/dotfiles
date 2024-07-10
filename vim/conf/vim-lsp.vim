setlocal signcolumn=no

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_setup= {
            \ 'clangd': {
            \   'cmd': ['clangd', '--enable-config'],
            \ }
            \}
