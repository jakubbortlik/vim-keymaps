" Vim filetype plugin
" Last Change: 2022-04-14
" Maintainer: Jakub Bortlík <jakub.bortlik@proton.me>

" Prevent duplicate loading
if exists("b:did_vimkeymaps")
    finish
endif
let b:did_vimkeymaps = 1

let g:keymaps = ['', 'czech', 'russian', 'ipa']
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

command! KeymapsList call EchoKeymapsList()
command! KeymapsForward call CycleKeymaps('forward')
command! KeymapsBackward call CycleKeymaps('backward')

nnoremap <silent> cl :KeymapsList<CR>
nnoremap <silent> ckj :KeymapsForward<CR>
nnoremap <silent> ckk :KeymapsBackward<CR>

inoremap <silent> <C-K><C-J> <C-o>:KeymapsForward<CR>
inoremap <silent> <C-K><C-K> <C-o>:KeymapsBackward<CR>

" vim:set ft=vim et sw=4 sts=4:
