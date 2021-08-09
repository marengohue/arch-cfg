set nocompatible
filetype off
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Rest of the plugins
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'rust-lang/rust.vim'
call vundle#end()            " required

filetype plugin indent on    " required

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

" Enable line numbers
set number

" Start NERDTree when Vim is started without file arguments, close NERDTREE as last window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Configure NERDTree

let NERDTreeShowHidden=1

