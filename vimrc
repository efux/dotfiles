" .VIMRC
" ==========================================

set nocompatible
set history=5000
set showcmd
set noswapfile

" Visual appearance
syntax on
let g:Powerline_colorscheme = 'solarized256'
set relativenumber
set hlsearch
set nowrap

execute pathogen#infect()
filetype plugin on
filetype plugin indent on
set laststatus=2

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
set ignorecase
set smartcase


set wildmenu
set wildignore=*.o,*.class

" Key mappings
nnoremap <silent> <F6> :noh<CR><Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>a
imap § <esc>

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
