let g:denops#deno = '/home/satoshi/.deno/bin/deno'

" Customize global settings
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', ['around', 'buffer'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': '[AROUND]'},
      \ 'buffer': {'mark': '[BUFFER]'},
      \ 'vim-lsp': {
      \   'matchers': ['matcher_head'],
      \   'mark': '[LSP]',
      \ },
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ 'buffer': {
      \   'requireSameFiletype': v:false,
      \   'limitBytes': 5000000,
      \   'fromAltBuf': v:true,
      \   'forceCollect': v:true,
      \ },
      \ })

" Mappings
inoremap <C-j>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-k>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-l>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" Use ddc.
call ddc#enable()
