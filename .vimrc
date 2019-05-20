syntax off

let mapleader = ","

set autoindent
set autoread
set autowrite
set backspace=2
set encoding=utf-8
set ffs=unix
set fileencodings=utf-8
set fileformat=unix
set hlsearch
set noexpandtab
set noswapfile
set pastetoggle=<F2>
set ruler
set smartindent
set t_Co=0
set termencoding=utf-8
set titlestring="%f"

nnoremap <silent> <C-l> :nohl<CR><C-l>

highlight TabLine cterm=reverse

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>f <Plug>(go-fmt)
autocmd FileType go nmap <leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

autocmd BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.rs setlocal tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.pl setlocal tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.sql setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
autocmd BufNewFile,BufRead *.txt set textwidth=78
autocmd BufNewFile,BufRead *.md  set textwidth=78
autocmd BufNewFile,BufRead *.c  set textwidth=80
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG set textwidth=72
