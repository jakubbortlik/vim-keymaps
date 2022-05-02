Custom vim-keymaps
==================
These keymaps make it possible to use a Czech keyboard layout and an IPA layout
in non-normal modes of Vim. Apart from that, it provieds a modified version of
the russian-jcukenwin keymap.

Mappings 
========

The plugin provides the following normal-mode mappings:

`ckj` - Cycle the keymaps forward
`ckk` - Cycle the keymaps backward
`ckl` - Show list of keymaps

The plugin provides the following insert-mode mappings - hold the Control key
and press two more keys after each other:

`<C-k-j>` - Cycle the keymaps forward
`<C-k-k>` - Cycle the keymaps backward
`<C-k-l>` - Show list of keymaps

The Czech and IPA keymaps work properly (i.e., allow the usage of AltGr+key)
with a custom us_intl layout (try running ```$ setxkbmap -layout us -variant
intl```).

The Russian keymap works properly if the Alt+Shift keys can be pressed together
to modify a key (i.e., Alt+Shift don't have sideeffects like switching the
keyboard layout on the OS side).

Usage on GNU/Linux
==================

To use the Czech and IPA layouts, either use my xkb_symbols_us file and set the
layout variant to "intl", or adjust the mappings to your us_keyboard layout.
Note, that the IPA keymap requires that you have at least three levels on your
keyboard: unshifted, Shift, Alt-Gr (right alt) which produce different symbols
in normal mode

If you use setxkbmap, you can make it work like this:

Download the file xkb_symbols_us, e.g. to ~/Downloads and then
```
$ cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.bak
$ cp ~/Downloads/xkb_symbols_us /usr/share/X11/xkb/symbols/us
```

se your preferred way of installing plugins, e.g. with Plug add this line to your vimrc:
```
Plug 'jakubbortlik/vim-keymaps.git'
```

See ```:h keymaps``` for more info.
