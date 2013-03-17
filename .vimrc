set nocompatible  " be iMproved
filetype off      " Required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-afterimage'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'pangloss/vim-javascript'
Bundle 'adie/BlockDiff'
Bundle 'csexton/rvm.vim'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
let g:syntastic_html_checkers=[]

Bundle 'kchmck/vim-coffee-script'
Bundle 'skammer/vim-css-color'
Bundle 'slim-template/vim-slim'
Bundle 'vim-scripts/CSSMinister'
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'greyblake/vim-preview'
Bundle 'gregsexton/gitv'
Bundle 'kien/ctrlp.vim'
Bundle 'jimenezrick/vimerl'

Bundle 'mileszs/ack.vim'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:CommandTMaxFiles=100000

filetype plugin indent on " Required!

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

nmap <silent> <C-i> i<CR><Esc>
nmap <silent> <C-a> a<CR><Esc>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/routes.rb'

syntax enable
syntax on

"set hidden
set lazyredraw
set showmode
set wildmenu

nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
colorscheme slate  " Uncomment this to set a default theme

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

set wrapscan
set ch=2

set timeoutlen=500
set history=100

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set scrolloff=8
"set virtualedit=all

set synmaxcol=2048

set cpoptions+=$
set hlsearch
set ignorecase
set wrap

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}%{exists('g:loaded_rvm')?rvm#statusline():''}%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-16(\ %l,%c-%v\ %)%P

"set wildignore+=vendor/ruby/*,.git,tmp/*,public/system/*,doc/*
let g:ctrlp_custom_ignore = '\v[\/](vendor/ruby|\.git|tmp|public/system|doc)$'

let g:ragtat_global_maps=1

hi PreProc guifg=red ctermfg=red guibg=grey15

" File type associations
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.thor setf ruby
au BufRead,BufNewFile *.hamlc setf haml

" Support rspec in all projects
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function
