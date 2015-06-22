command! -nargs=1 MoveToWindow call twm#moveToWindow(<q-args>)
command! -nargs=1 SwapToWindow call twm#swapToWindow(<q-args>)

nnoremap - :<C-U>execute 'MoveToWindow ' . v:count<CR>
nnoremap _ :<C-U>execute 'SwapToWindow ' . v:count<CR>

noremap <RIGHT> 3<C-W>>
noremap <LEFT>  3<C-W><
noremap <UP>    3<C-W>-
noremap <DOWN>  3<C-W>+

nnoremap <leader>h :topleft vsplit<CR>
nnoremap <leader>l :botright vsplit<CR>
nnoremap <leader>j :botright split<CR>
nnoremap <leader>k :topleft split<CR>
