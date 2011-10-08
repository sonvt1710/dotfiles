set sw=4 ts=4 sts=4 et
set cin noai sb spr aw nowrap
set tw=0
set incsearch
set nocompatible
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set sidescroll=5

set wildmenu
set ruler
set laststatus=2
set bs=indent,eol,start

set listchars+=precedes:<,extends:>
set foldmethod=marker
set tags+=/usr/local/share/ctags/qt4
set completeopt-=preview
let c_space_errors=1
let c_no_comment_fold=1
let c_no_if0_fold=1

syntax on
filetype on
filetype indent on
filetype plugin on

highlight comment term=bold cterm=bold ctermfg=4

highlight StatusLine ctermfg=82
highlight StatusLineNC ctermfg=81
highlight VertSplit ctermfg=16

highlight Directory term=bold cterm=bold ctermfg=4

map <F1> <ESC>:make -j4<CR>
map <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Alt-j/k to navigate forward/backward in the tags stack
map <M-J> <C-T>
map <M-K> <C-]>

" Window navigation
nmap th <C-W>h
nmap tl <C-W>l
nmap tj <C-W>j
nmap tk <C-W>k
nmap ts :split<SPACE>
nmap tv :vsplit<SPACE>
nmap tc <C-W>c

" Tab navigation
nmap Th :tabp<CR>
nmap Tl :tabn<CR>
nmap Te :tabe<SPACE>
nmap Tn :tabe .<CR>
nmap Tc :tabc<CR>

nmap TH :tabp<CR>
nmap TL :tabn<CR>
nmap TE :tabe<SPACE>
nmap TN :tabe .<CR>
nmap TC :tabc<CR>

nmap tH :tabp<CR>
nmap tL :tabn<CR>
nmap tE :tabe<SPACE>
nmap tN :tabe .<CR>
nmap tC :tabc<CR>

nmap te :tabe<SPACE>

" Use arrow keys for gj, gk
nmap <Up> gk
nmap <Down> gj

" Use space to find space
" (Note the space after f, F)
nmap <Space> ef 

" Make Y consistent with D (i.e. D : d$ :: Y : y$)
nmap Y y$

" Disable ctrl-C
noremap! <C-C> capslock

" Sane searching
set hlsearch
set incsearch
set smartcase ignorecase
noremap <ESC><ESC> :nohlsearch<CR>

" Use tab for %
nnoremap <tab> %
vnoremap <tab> %

" Omnicomplete shortcut
imap <C-O> <C-X><C-P>

" Command-T goodness
nmap ' :CommandT<CR>
nmap t' :tabnew<CR>:CommandT<CR>
let g:CommandTCancelMap='<Esc>'

" Git shortcuts
nmap gs :!git status -s -b<CR>
nmap gc :!git commit -v<CR>
nmap g. :!git add -p<CR>
nmap g; :!git add -i<CR>
nmap g? :!git diff<CR>
nmap g/ :!git diff --cached<CR>
nmap gv :!git pull --ff --commit<CR>
nmap g^ :!git push<CR>
nmap gp :!git checkout -p<CR>

" Log Vim commands
if has('cmdlog')
    set cmdlogdir=~/.vimlogs/
    " set cmdloginsert
end

call pathogen#infect()

augroup FileTemplates
    autocmd!
    autocmd BufNewFile *.sh TSkeletonSetup prefab/shell.sh
    autocmd BufNewFile [A-Z]*.php TSkeletonSetup prefab/php.class.php
    autocmd BufNewFile [a-z]*.php TSkeletonSetup prefab/php.inc.php
    autocmd BufNewFile *.html TSkeletonSetup prefab/html.html
    autocmd BufNewFile [A-Z]*.js TSkeletonSetup prefab/js.require.js
    autocmd BufNewFile *.h TSkeletonSetup prefab/h.h
augroup END

set exrc secure
