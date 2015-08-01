# Toggle Quickfix Window

`quickfix` is a special buffer for viewing errors and warnings from command
`:make` or matching lines from vim plugin [grep][grep].

This plugin provides one simple key binding to toggle quickfix window
instead of using the redundant command `:copen` and `:close`.

##  Installation

Installing with [pathogen.vim](https://github.com/tpope/vim-pathogen)
 is recommended. Copy and paste:

```sh
cd ~/.vim/bundle
git clone git://github.com/drmingdrmer/vim-toggle-quickfix.git
```

Or just copy all of the files in to `~/.vim`.

## Key Binding

To use `Ctrl-g Ctrl-o` to toggle quickfix window,
add these following lines into your `.vimrc`:

```
nmap <C-g><C-o> <Plug>window:quickfix:toggle
```

[grep]: https://github.com/vim-scripts/grep.vim.git
