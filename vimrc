" .VIMRC
" ==========================================

set nocompatible
filetype off

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" load plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'mtth/scratch.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/snipMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nvie/vim-pyunit'

call vundle#end()
filetype plugin indent on

set history=5000
set showcmd
set noswapfile

" Visual appearance
syntax on
set background=dark
let g:Powerline_colorscheme = 'solarized256'
set relativenumber
set hlsearch
set wrap

set backspace=indent,eol,start

" SnipMate
let g:snips_author = 'Etienne Fux'

set autoread
set noesckeys

" Auto reload the vimrc when changing ~/.vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc
" autocmd! bufwritepost *.cpp call RegenerateTags()
" autocmd! bufwritepost *.h call RegenerateTags()

" Buffers can be moved to the background without saving
set hidden
set autoindent
set smartcase


set wildmenu
set wildignore=*.o,*.class

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Key mappings
nnoremap <silent> <F6> :noh<CR><Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>a
imap § <esc>
" pytest
noremap <F2> :call PyUnitRunAllTests()<CR>

" Remap enter to insert a new line below/above and return to normal mode
nmap <CR> o<Esc>k$

" Some code completions for faster random content
iab lorem Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.
iab llorem Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
iab lllorem Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

" Disable errors
set noerrorbells
set novisualbell

set showmatch
set showmode

" OmniComplete
set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
" nnoremap <F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR><CR><CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
set completeopt=menuone,menu,longest,preview

function! RegenerateTags()
	exec ':silent !ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .'
	redraw!
endfunction

" NetBeans
" set expandtab
" set smarttab
" set tabstop=4
" set shiftwidth=4
