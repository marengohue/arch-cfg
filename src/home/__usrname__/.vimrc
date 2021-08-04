" gvim package is required for X-clipboard support
set clipboard=unnamedplus

" TABS -> 4 Spaces when editing 
set expandtab
set tabstop=4
set shiftwidth=4

" Install powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Last status = 2 to make the status bar appear even when a single doc is open
set laststatus=2
set showtabline=2

