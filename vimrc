"
" VIM-PLUG
"

""" Automatic installation """
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" VIM Plugins """
call plug#begin()

" fzf - command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" PLantUML - UML diagrams as code
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'

" Slimv - Lisp in Vim
Plug 'kovisoft/slimv'

" Cucumber syntax for VIM - BDD
Plug 'tpope/vim-cucumber'

" Elixir
Plug 'elixir-editors/vim-elixir'

" VIM LSP
Plug 'prabirshrestha/vim-lsp'

" Perl
Plug 'vim-perl/vim-perl'

" TODO: Make a fork of this as I do have it modified
" VIM Swagger Preview
Plug 'xavierchow/vim-swagger-preview'

" Terraform
Plug 'hashivim/vim-terraform'

" Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'smbl64/vim-black-macchiato'

" Commentary
Plug 'tpope/vim-commentary'

call plug#end()

"
" Basic Settings
"
let mapleader = "," " map leader to comma
set timeoutlen=500  " Set timeout length to 500 ms"
set nocompatible    " Forget about vi compatibility
set ruler           " Display line and column no. for current cursor position
set showmode        " Show current editor mode
"set wrapmargin=120  " Set the screen's right margin
"set expandtab       " Convert tabs to spaces
set textwidth=120   " Set the screen's text width
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
set hlsearch

" Fix diff colors in Vim to be like the CLI diffs
function! MyHighlights() abort
    highlight diffAdded ctermfg=2 guifg=#67c12c
    highlight diffRemoved ctermfg=1 guifg=#b82e19
endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme default
" END Fix diff colors in Vim to be like the CLI diffsff


let perl_sub_signatures = 1
syntax on                 " Turn on synatx highlighting
filetype plugin indent on " Turn other nice features on

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Dracula Vim colors: See https://github.com/dracula/vim/blob/master/INSTALL.md
" Dracula Vim colors: https://draculatheme.com/vim
"packadd! dracula
"syntax enable
"colorscheme dracula

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Abbreviations - Common typos/shortcuts
ab teh the
ab fro for
ab appre appraiser
ab appra appraisal
ab apraisal appraisal
ab appriasal appraisal
ab tv type_value
ab atv appraisal_type_value

" These two maps enable you to press space to move cursor down a screen,
" and press backspace to move up a screen.
map <space> <c-f>
map <backspace> <c-b>
map <leader>h :noh<CR>

" You can use - to jump between windows
map - <c-w>w

" Map ESC to jj
inoremap jj <esc>

" Other esc mapping but they drive me nuts
" esc in insert & visual mode
"inoremap jj <esc>
"vnoremap jj <esc>

" esc in command mode
"cnoremap jj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C

" Toggle INSERT (paste) mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Mappings/key bindings for fix-tables
au BufNewFile,BufRead *.www set ft=flexwiki equalprg=~/src/blackjack/script/fix-tables
au BufNewFile,BufRead *.www set ft=stwiki equalprg=~/src/blackjack/script/fix-tables
au BufNewFile,BufRead *.www map <c-J> mq=ip`q

" Format JSON
"map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
"autocmd FileType json set equalprg=/usr/bin/json_reformat
autocmd FileType json set makeprg=~/bin/jsonval\ %
autocmd FileType json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#
autocmd FileType json set expandtab

autocmd FileType sql set expandtab

autocmd FileType javascript setlocal ts=2 sw=2 expandtab

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
autocmd FileType vimrc,perl,python,ruby,elixir,terraform autocmd BufWritePre <buffer> :%s/\s\+$//e

" Perl key bindings
"map <F5> :setlocal makeprg=perl\ -c\ %\|make<CR>
"map <F6> :setlocal makeprg=perl\ %\|make<CR>
":au Filetype perl nmap ,c :!perl -Ilib -c %<CR>:!podchecker %<CR>:!perlcritic --profile `git rev-parse --show-toplevel`/perlcriticrc %<CR>
":au Filetype perl nmap ,c :!perl -Ilib -c %<CR>:!podchecker %<CR>:!perlcritic %<CR>

":au Filetype perl nmap ,c :!~/src/scripts/dc_wrapper.sh "perl -Ilib -c %"<CR>:!plx podchecker %<CR>:!plx perlcritic %<CR>
:au Filetype perl nmap ,c :!plx perl -Ilib -c %<CR>:!plx podchecker %<CR>:!plx perlcritic %<CR>
:au Filetype perl nmap ,r :!plx perl -Ilib %<CR>

" Tidy selected lines (or entire file) with ,t:
"nnoremap <silent> ,t :%!perltidy -q<CR>
"vnoremap <silent> ,t :!perltidy -q<CR>
":au Filetype perl nnoremap ,t mf:%!perltidy -q<CR>:%!podtidy<CR>:w<CR>`fzz
":au Filetype perl vnoremap ,t mf:!perltidy -q<CR>:w<CR>`fzz
:au Filetype perl nnoremap ,t :let t = winsaveview()<CR>:%!plx perltidy -q<CR>:%!plx podtidy<CR>:w<CR>:call winrestview(t)<CR>
:au Filetype perl vnoremap ,t <esc>:'<,'>!plx perltidy -q <CR>:w<CR>

" Run prove/bj-prove on the current buffer
":au Filetype perl,stwiki nmap ,bjp :!./script/bj-prove -v %<CR>
":au Filetype perl,stwiki nmap ,p :!ADDRESSPLUS_APIKEY=WS36-TCQ1-DOA2 prove -lv %<CR>
":au Filetype perl,stwiki map ,p :w<CR>:!script -c 'HARNESS_ACTIVE=1 prove -lvmfo %' /tmp/last-prove.txt<CR>:!less -R -F +G /tmp/last-prove.txt<CR>
":au Filetype perl,stwiki map ,lp :!less -R /tmp/last-prove.txt<CR>

" Run prove inside the blackjack-api container
":au Filetype perl,stwiki map ,p :w<CR>:!docker-compose -f /Users/dbaber/src/sldockerdev/docker-compose.yml exec -w /home/perldev/src/blackjack blackjack-api /bin/bash -lc "script -c 'HARNESS_ACTIVE=1 prove -lvmfo %' /tmp/last-prove.txt && less -R -F +G /tmp/last-prove.txt"<CR>
":au Filetype perl,stwiki map ,lp :!docker-compose -f /Users/dbaber/src/sldockerdev/docker-compose.yml exec -w /home/perldev/src/blackjack blackjack-api /bin/bash -lc "less -R /tmp/last-prove.txt"<CR>
:au Filetype perl,stwiki map ,p :w<CR>:!~/src/scripts/dc_wrapper.sh "script -c 'HARNESS_ACTIVE=1 prove -lvmfo %' /tmp/last-prove.txt && less -R -F +G /tmp/last-prove.txt"<CR>
:au Filetype perl,stwiki map ,lp :!~/src/scripts/dc_wrapper.sh "less -R /tmp/last-prove.txt"<CR>

" Validate XML files with <leader>v using xmllint
:au Filetype xml nmap ,v :!xmllint --relaxng ~/src/cadillac/lib/Cadillac/Devel/Doc/internal/schema.rng %<CR>

" Wrap git comments to 100 characters, updated per:
" https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#commits
au FileType gitcommit set tw=100

" Python key bindings
":au Filetype python nnoremap ,t :let t = winsaveview()<CR>:%!autopep8 -<CR>:w<CR>:call winrestview(t)<CR>
":au Filetype python vnoremap ,t <esc>:'<,'>!autopep8 -<CR>:w<CR>
"":au Filetype python nmap ,c :!flake8 --config `git rev-parse --show-toplevel`/tox.ini --statistics --count %<CR>
":au Filetype python nmap ,c :!flake8 --config './tox.ini' --statistics --count %<CR>

":au Filetype python nnoremap <leader>t :let t = winsaveview()<CR>:Black<CR>:w<CR>:call winrestview(t)<CR>
:au Filetype python nnoremap <leader>t :Black<CR>
":au FileType python xmap <buffer> <Leader>ts <plug>(BlackMacchiatoSelection)
":au FileType python nmap <buffer> <Leader>ts<plug>(BlackMacchiatoCurrentLine)
autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)
autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)

" Elixir key bindings
" autocmd FileType elixir setlocal equalprg=mix\ format\ -
":au Filetype elixir nnoremap ,t :let t = winsaveview()<CR>:!mix format %<CR>:w<CR>:call winrestview(t)<CR>
":au Filetype elixir vnoremap ,t <esc>:'<,'>!mix format %<CR>:w<CR>
":au Filetype elixir nmap ,c :!elixirc %<CR>

" Linux create pastie and copy to clipboard - pastie is defunct, RIP Corvisa
"nnoremap ,pb :!curl -s -F data=@% http://pastie.it.corp/ \| xclip -selection clipboard; xclip -selection clipboard -o<CR>
"vnoremap ,pb <esc>:'<,'>:w !curl -s -F data=@- http://pastie.it.corp/ \| xclip -selection clipboard; xclip -selection clipboard -o<CR>

" Use MacOS clipboard
nnoremap <leader>pb :%w !pbcopy<CR>
vnoremap <leader>pb <esc>:'<,'>:w !pbcopy<CR>

" Comment/uncomment blocks
"vnoremap <leader>cb :s/^/#/gi<CR>:noh<CR>
"vnoremap <leader>ub :s/^#//gi<CR>:noh<CR>

" fzf
noremap <silent> <leader>o :Files<CR>
noremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <Leader>pf :Files %:p:h<CR>

" Use C-b in terminal to go into normal mode
tnoremap <C-b> <c-\><c-n>

" Use vim-lsp and standardrb for Ruby. See https://github.com/standardrb/standard/wiki/IDE:-vim
" Use standard if available
"if executable('standardrb')
"  au User lsp_setup call lsp#register_server({
"        \ 'name': 'standardrb',
"        \ 'cmd': ['standardrb', '--lsp'],
"        \ 'allowlist': ['ruby'],
"        \ })
"endif

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
