" Template Toolkit
au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.tt2 setf tt2html

" JSON
"au! BufRead,BufNewFile *.json setfiletype javascript
au! BufRead,BufNewFile *.json setfiletype json

" Taken from http://en.wikipedia.org/wiki/Wikipedia:Text_editor_support#Vim
" 	Ian Tegebo <ian.tegebo@gmail.com>

" Wiki syntax highlighting
"augroup filetypedetect
"au BufNewFile,BufRead *.wiki setf Wikipedia
"augroup END

au BufNewFile,BufRead *.www setf perl
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG set ft=gitcommit
