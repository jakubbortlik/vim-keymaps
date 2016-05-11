custom vim-keymaps
==================
These keymaps make it possible to use a Czech keyboard layout and an IPA layout
in non-normal modes of Vim

They only work with a custom us_intl layout.

To use the Czech and IPA layouts, either use my xkb_symbols_us file and set the
layout variant to "intl", or adjust the mappings to your us_keyboard layout.
Note, that the IPA keymap requires that you have at least three levels on your
keyboard: unshifted, Shift, Alt-Gr (right alt) which produce different symbols in
normal mode

If you use setxkbmap, you can make it work like this:

Download the file xkb_symbols_us, e.g. to ~/Downloads and then
```
$ cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.bak
$ cp ~/Downloads/xkb_symbols_us /usr/share/X11/xkb/symbols/us
```

se your preferred way of installing plugins, e.g. with Vundle add this line to your vimrc:
```
Plugin 'jakubbortlik/vim-keymaps.git'
```

Running ```$ setxkbmap -layout us -variant intl``` in terminal and ```:set
keymap=cs``` or ```:set keymap=ipa```, and hitting <Ctrl-6> in insert,
command-line and search mode lets you insert the desired characters. See ```:h
keymap``` for more info.
