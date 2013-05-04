""""""""""
" Vundle
"
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

Bundle "L9"
Bundle "FuzzyFinder"
Bundle "bufkill.vim"

""""""""""


"  General
filetype plugin indent on
set cc=120
set directory=/tmp,~/Temp
set encoding=utf-8
set ffs=unix,dos
set gdefault " Automatically /g in replacements
set history=1000
set mouse=a
set nocompatible
set nospell
set nowritebackup nobackup noswapfile
set undodir=/tmp,~/Temp
set undofile
set undolevels=1000
set undoreload=10000

"  Views
set viewoptions=folds,options,cursor,unix,slash

"  UI
set backspace=indent,eol,start " Proper backspace
set cinoptions=h4,l1,g0,t0,i4,+4,(4,w1,W4,:0,N-s
set completeopt=longest,menuone,preview
set fillchars+=vert:\ 
set fillchars-=vert:\|
set laststatus=2
set linespace=3 " A little extra space between lines
set list!
set listchars=tab:>\ ,eol:¬
set nofoldenable " No folding
set ofu=syntaxcomplete#Complete
set scrolloff=8 " Lines around cursor on-screen at all times
set shortmess+=I
set updatetime=4000
set virtualedit=onemore
set wildmenu " Show completion menu
set wildmode=list:longest,full

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" Formatting
set autoindent " Keep indentation level when going to new line
set expandtab " Spaces for indentation
set hid " Allow hidden buffers
set ignorecase " Ignore case in search by default
set incsearch " Incremental search
set nobackup
set noerrorbells
set nowb
set nowrap " Disable word wrapping
set number
set pastetoggle=<F12> " Disable auto-indent for pasting
set ruler
set shiftwidth=4 " Indent width
set softtabstop=4 " Delete indents with backspace
set tabstop=4 " Indent every 4 spaces

" Keys
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
" Yank entire line without newline
nnoremap ya mz^y$`z

" Haskell stuff
autocmd! Syntax haskell source ~/.vim/syntax/haskell.vim
let hs_highlight_debug = 1

" JSON stuff
autocmd BufNewFile,BufRead *.json set ft=javascript

" FuzzyFinder
noremap <Leader>lf :FufCoverageFile<CR>
noremap <Leader>lb :FufBuffer<CR>
noremap <Leader>lc :FufRenewCache<CR>
noremap <Leader>ld :FufDir<CR>
let g:fuf_coveragefile_exclude = '\v\~$|\.o$|^build\/'

" Save and restore session
func! RestoreSess()
    let conf = confirm("Really restore session?", "&Yes\n&No", 2)
    if conf == 1
        source ~/.vim_session
    endif
endfunc

nnoremap <F5> :mksession! ~/.vim_session<CR>
nnoremap <F8> :call RestoreSess()<CR>

" Change working directory to current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" annoying :W
command! W w

" autoreload vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc

" Status line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

syntax on

" Machine specific config
if filereadable(expand("~/.vimrc_machine"))
    source ~/.vimrc_machine
endif

" Color scheme
if has('gui_running')
    set background=light
    colorscheme two2tango
else
    set background=dark
    colorscheme two2tango
endif

" Font
set gfn=PT\ Mono:h12
set antialias

highlight NonText guifg=#444444 guibg=bg
hi User1 guifg=#eea040 guibg=bg
hi User0 guifg=#dd3333 guibg=bg
hi User3 guifg=#ff66ff guibg=bg
hi User4 guifg=#a0ee40 guibg=bg
hi User5 guifg=#eeee40 guibg=bg

