filetype plugin on
syntax on
set term=xterm-256color
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set nu

set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

set rtp+=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/bundle/nerdtree
let g:buftabline_show=1
set rtp+=~/.vim/bundle/vim-buftabline

:nnoremap <space> :nohl<return>
:nnoremap <C-PageUp> :bprev<return>
:nnoremap <C-PageDown> :bnext<return>

