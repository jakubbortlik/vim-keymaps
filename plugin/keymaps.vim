    " Vim filetype plugin
      " Last Change: 2022-04-14
" Maintainer: Jakub Bortlík <jakub.bortlik@proton.me>

" Prevent duplicate loading
if exists("b:did_vimkeymaps")
    finish
endif
let b:did_vimkeymaps = 1

let g:keymaps = get(g:, 'keymaps', ['', 'czech', 'russian', 'ipa'])

let g:active_keymap_index = 0

function! CycleKeymaps(direction)
    let g:last_keymap = len(g:keymaps) - 1
    if a:direction == 'forward'
        let g:active_keymap_index += 1
        if g:active_keymap_index > g:last_keymap
            let g:active_keymap_index = 0
        endif
    elseif a:direction == 'backward'
        let g:active_keymap_index -= 1
        if g:active_keymap_index < 0
            let g:active_keymap_index = g:last_keymap
        endif
    endif
    let &l:keymap=g:keymaps[g:active_keymap_index]
endfunction

function! EchoKeymapsList()
    echo 'Available keymaps: [' . join(g:keymaps, ', ') . ']'
endfunction

function! RecordCmd()
    " let g:last_cmdtype = getcmdtype()
    let g:last_cmdline = getcmdline()
    let g:last_cmdpos = getcmdpos()
endfunction

cmap <expr> <C-K><C-J> getcmdtype()=='/'?"<c-r><c-r>=RecordCmd()[-1]<cr><c-c>:KeymapsForward<cr>/<c-r><c-r>=g:last_cmdline<cr><c-r><c-r>=setcmdpos(g:last_cmdpos)[-1]<cr>":"<c-r><c-r>=RecordCmd()[-1]<cr><c-c>:KeymapsForward<cr>:<c-r><c-r>=g:last_cmdline<cr><c-r><c-r>=setcmdpos(g:last_cmdpos)[-1]<cr>"
cmap <expr> <C-K><C-K> getcmdtype()=='/'?"<c-r><c-r>=RecordCmd()[-1]<cr><c-c>:KeymapsBackward<cr>/<c-r><c-r>=g:last_cmdline<cr><c-r><c-r>=setcmdpos(g:last_cmdpos)[-1]<cr>":"<c-r><c-r>=RecordCmd()[-1]<cr><c-c>:KeymapsBackward<cr>:<c-r><c-r>=g:last_cmdline<cr><c-r><c-r>=setcmdpos(g:last_cmdpos)[-1]<cr>"

command! KeymapsList call EchoKeymapsList()
command! KeymapsForward call CycleKeymaps('forward')
command! KeymapsBackward call CycleKeymaps('backward')

nnoremap <silent> ckl :KeymapsList<CR>
nnoremap <silent> ckj :KeymapsForward<CR>
nnoremap <silent> ckk :KeymapsBackward<CR>

inoremap <silent> <C-K><C-L> <C-o>:KeymapsList<CR>
inoremap <silent> <C-K><C-J> <C-o>:KeymapsForward<CR>
inoremap <silent> <C-K><C-K> <C-o>:KeymapsBackward<CR>

" vim:set ft=vim et sw=2 sts=2:
