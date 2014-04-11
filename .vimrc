call pathogen#incubate()
call pathogen#helptags()

"execute pathogen#infect()

"filetype plugin indent on
"filetype plugin on
syntax on
set ruler
set ai
set mouse=a
set mousemodel=popup

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

"make ctrl-c ctrl-v work right
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

:map <n> "NERDTree

let g:mta_use_matchparen_group = 0
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'htmldjango' : 1,
    \}

autocmd FileType htmldjango set ft=html " For SnipMatesyntax enable
set background=dark
colorscheme mustang
set hidden
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
autocmd vimenter * NERDTree

let mapleader = ","
nmap <leader>nt :NERDTree<cr>
nmap <leader>bb :Bclose<CR>

"tags

map <f12> :!start ctags -R .<cr>
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" this allows line swapping with Ctrl-shift-up/down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
