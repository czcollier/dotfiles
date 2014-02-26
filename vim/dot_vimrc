version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Ubuntu\ Mono\ 11
set helplang=en
set history=50
set nomodeline
set mouse=a
set printoptions=paper:letter
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set window=54
set noea "don't re-equalize windows after closing one

" requisite status line pr0n
set statusline=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ \ %h%m%r%y\ \ %c,%l/%L\ %=%t 

"general editing stuff
set tabstop=4
set shiftwidth=4
set expandtab

"gui stuff
set guioptions-=m
set guioptions-=T
colorscheme jellybeans

"replace normal bdelete behavior with
"no-window-killing version from plugin
ca bd Kwbd

"also re-map q to prevent accidental
"bagging out of windows
ca q Kwbd

" Opening and closing braces
imap <C-F> {<CR>}<C-O>O

call pathogen#infect()

" some java stuff
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead set makeprg=ant\ -find\ build.xml

execute pathogen#infect()

syntax on

filetype plugin indent on

" for the LustyJuggler plugin.  Switch buffers with <C-Tab>.  LustyJuggler also
" shows a nice buffer list along the bottom of the window.
"let g:LustyJugglerAltTabMode = 1
"noremap <silent> <C-Tab> :LustyJuggler<CR>

" The below mappings make completion popups behave more like the GUI IDEs.
" See:
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE 
" 
" Changes the 'completeopt' option so that Vim's popup menu doesn't select the
" first completion item, but rather just inserts the longest common text of
" all matches; and the menu will come up even if there's only one match. (The
" longest setting is responsible for the former effect and the menuone is
" responsible for the latter.) 
set completeopt=longest,menuone

" changes the behavior of the <Enter> key when the popup is visible.
" It will simply select the hilighted menu item, just as <C-Y> does.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 

" make first item in popup list selected when it first shows
inoremap <expr> <C-x><C-u> pumvisible() ? '<C-x><C-u>' : '<C-x><C-u><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>' 
