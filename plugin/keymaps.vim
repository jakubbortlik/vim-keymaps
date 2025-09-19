" Vim filetype plugin
" Last Change: 2022-04-14
" Maintainer: Jakub Bortlik <jakub.bortlik@proton.me>

" Prevent duplicate loading
if exists('b:did_vimkeymaps')
    finish
endif
let b:did_vimkeymaps = 1

let g:keymaps = get(g:, 'keymaps', ['', 'czech', 'russian', 'ipa'])

let g:active_keymap_index = 0

function! CycleKeymaps(direction)
    let g:last_keymap = len(g:keymaps) - 1
    if a:direction ==# 'forward'
        let g:active_keymap_index += 1
        if g:active_keymap_index > g:last_keymap
            let g:active_keymap_index = 0
        endif
    elseif a:direction ==# 'backward'
        let g:active_keymap_index -= 1
        if g:active_keymap_index < 0
            let g:active_keymap_index = g:last_keymap
        endif
    endif
    let &l:keymap=g:keymaps[g:active_keymap_index]
    try
        call luaeval('require("lualine").refresh({force=true, scope="window"})')
    catch
        " Don't fail if lualine is not intalled
    endtry
endfunction

function! EchoKeymapsList()
    echo 'Available keymaps: [' . join(g:keymaps, ', ') . ']'
endfunction

cmap <expr> <C-K><C-J> execute('KeymapsForward')
cmap <expr> <C-K><C-K> execute('KeymapsBackward')

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
