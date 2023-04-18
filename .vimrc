syntax off

hi Search ctermbg=Yellow
hi Search ctermfg=Black
hi Visual ctermbg=Black
hi Visual ctermfg=White

let mapleader = ","
nnoremap <silent> <C-l> :nohl<CR><C-l>

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
set t_Co=256
set termencoding=utf-8
set titlestring="%f"

autocmd BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.graphql setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.graphqls setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 shiftwidth=2 expandtab
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
