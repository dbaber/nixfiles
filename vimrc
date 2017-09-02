" File: .vimrc - Vim startup file
" Author: Daniel Baber
" Date: : Sat Aug 25 01:19:58 CDT 2007
" Last Change:: Mon Mar 28 08:49:00 CST 2011

set nocompatible    " Forget about vi compatibility
set ruler           " Display line and column no. for current cursor position
set showmode        " Show current editor mode
"set wrapmargin=120  " Set the screen's right margin
"set expandtab       " Convert tabs to spaces
set textwidth=120  " Set the screen's text width
set noexpandtab     " Use real tabs
set tabstop=4       " Set tabstop to 4 spaces
set shiftwidth=4    " Autoindent at 4 spaces
set autoindent      " Auto-indent when new line opened
set smartindent     " Turn on smrt indent
set undolevels=5000 " Set level of undo comman
"set paste           " Enable INSERT paste mode
" Setup mode line with filename, line no, column no, and position in the file
set modeline
set ls=2
"set autowrite       " Autowrite file changes?
set number          " Display line number, useful for porgamming
set showmatch       " Highlight matching parens, brackets, braces, etc
"set shell=/bin/bash shellcmdflag=-ic " Set the shell to an interactive bash shell so we get aliases, etc.
set background=dark " Set the colors for a dark background

syntax on           " Turn on synatx highlighting
filetype plugin indent on " Turn other nice features on

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Abbreviations - Common typos
ab teh the
ab fro for

" These two maps enable you to press space to move cursor down a screen,
" and press backspace to move up a screen.
map <space> <c-f>
map <backspace> <c-b>

" You can use - to jump between windows
map - <c-w>w

" Map ESC to jj
imap jj <esc>

" Toggle INSERT (paste) mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Mappings/key bindings for fix-tables
"au BufNewFile,BufRead *.www set ft=flexwiki equalprg=~/src/blackjack/script/fix-tables
"au BufNewFile,BufRead *.www set ft=stwiki equalprg=~/src/blackjack/script/fix-tables
"au BufNewFile,BufRead *.www map <c-J> mq=ip`q

" Format JSON
"map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
"autocmd FileType json set equalprg=/usr/bin/json_reformat
autocmd FileType json set makeprg=~/bin/jsonval\ %
autocmd FileType json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#
autocmd FileType json set expandtab

autocmd FileType sql set expandtab

" Have vim use the X clipboard - aschrab
":if $DISPLAY != ""
"	set mouse=a
"	set clipboard=unnamed,autoselect,exclude:cons\|linux
":endif

" Key mappings for moving lines around - snolte
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Highlight trailing white space in command mode
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Trim trailing white space before write
autocmd FileType vimrc,perl,c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" Perl key bindings
"map <F5> :setlocal makeprg=perl\ -c\ %\|make<CR>
"map <F6> :setlocal makeprg=perl\ %\|make<CR>
:au Filetype perl nmap ,c :!perl -Ilib -c %<CR>:!podchecker %<CR>:!perlcritic --profile `git rev-parse --show-toplevel`/perlcriticrc %<CR>
:au Filetype perl nmap ,r :!perl -Ilib %<CR>

" Tidy selected lines (or entire file) with ,t:
"nnoremap <silent> ,t :%!perltidy -q<CR>
"vnoremap <silent> ,t :!perltidy -q<CR>
":au Filetype perl nnoremap ,t mf:%!perltidy -q<CR>:%!podtidy<CR>:w<CR>`fzz
":au Filetype perl vnoremap ,t mf:!perltidy -q<CR>:w<CR>`fzz
:au Filetype perl nnoremap ,t :let t = winsaveview()<CR>:%!perltidy -q<CR>:%!podtidy<CR>:w<CR>:call winrestview(t)<CR>
:au Filetype perl vnoremap ,t <esc>:'<,'>!perltidy -q <CR>:w<CR>

" Run prove/bj-prove on the current buffer
":au Filetype perl,stwiki nmap ,bjp :!./script/bj-prove -v %<CR>
":au Filetype perl,stwiki nmap ,p :!ADDRESSPLUS_APIKEY=WS36-TCQ1-DOA2 prove -lv %<CR>
:au Filetype perl,stwiki map ,p :w<CR>:!script -c 'HARNESS_ACTIVE=1 prove -lvmfo %' /tmp/last-prove.txt<CR>:!less -R -F +G /tmp/last-prove.txt<CR>
:au Filetype perl,stwiki map ,lp :!less -R /tmp/last-prove.txt<CR>

:au Filetype xml nmap ,v :!xmllint --relaxng ~/src/cadillac/lib/Cadillac/Devel/Doc/internal/schema.rng %<CR>

" Wrap git comments to 72 chracters
au FileType gitcommit set tw=72

" Python key bindings
:au Filetype python nnoremap ,t :let t = winsaveview()<CR>:%!autopep8 -<CR>:w<CR>:call winrestview(t)<CR>
:au Filetype python vnoremap ,t <esc>:'<,'>!autopep8 -<CR>:w<CR>
:au Filetype python nmap ,c :!flake8 --config `git rev-parse --show-toplevel`/tox.ini --statistics --count %<CR>

" create pastie
nnoremap ,pb :!curl -s -F data=@% http://pastie.it.corp/ \| xclip -selection clipboard; xclip -selection clipboard -o<CR>
vnoremap ,pb <esc>:'<,'>:w !curl -s -F data=@- http://pastie.it.corp/ \| xclip -selection clipboard; xclip -selection clipboard -o<CR>

" Comment/uncomment blocks
vnoremap ,cb :s/^/#/gi<CR>:noh<CR>
vnoremap ,ub :s/^#//gi<CR>:noh<CR>
