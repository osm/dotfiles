syntax on

let mapleader = ","

set autowrite
set backspace=2
set ffs=unix
set fileencodings=utf-8
set hlsearch
set ignorecase
set noexpandtab
set noswapfile
set ruler
set smartindent
set titlestring="%f"

highlight TabLine cterm=reverse

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>f <Plug>(go-fmt)
autocmd FileType go nmap <leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

autocmd BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.sql setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
autocmd BufNewFile,BufRead *.txt set textwidth=78
autocmd BufNewFile,BufRead *.md  set textwidth=78
