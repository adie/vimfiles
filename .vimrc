set nocompatible  " be iMproved
filetype off      " Required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2 " changing root dir in tree will `cd` the whole vim
let g:NERDTreeMinimalUI=1

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-afterimage'
Bundle 'tpope/vim-liquid'

Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'pangloss/vim-javascript'
Bundle 'adie/BlockDiff'
Bundle 'csexton/rvm.vim'
Bundle 'godlygeek/tabular'

Bundle 'scrooloose/syntastic'
let g:syntastic_html_checkers=[]

Bundle 'kchmck/vim-coffee-script'
Bundle 'slim-template/vim-slim'
Bundle 'heartsentwined/vim-emblem'

Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'vim-scripts/CSSMinister'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'

Bundle 'greyblake/vim-preview'
Bundle 'gregsexton/gitv'
Bundle 'kien/ctrlp.vim'

Bundle 'jimenezrick/vimerl'
Bundle 'elixir-lang/vim-elixir'

Bundle 'mileszs/ack.vim'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

Bundle 'ngmy/vim-rubocop'

Bundle 'mattn/zencoding-vim'
let g:user_zen_expandabbr_key='<c-e>'
let g:use_zen_complete_tag = 1

Bundle 'matchit.zip'
Bundle 'jgdavey/vim-blockle'
Bundle 'ecomba/vim-ruby-refactoring'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1

Bundle 'ZoomWin'
" Bundle 'Valloric/YouCompleteMe' " requires Vim 7.3.584+

Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

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

" ctrl+i breaks line apart
nmap <silent> <C-i> i<CR><Esc>

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
let g:ctrlp_custom_ignore = '\v[\/](vendor/ruby|\.git|tmp|public/system|doc|data|node_modules)$'
let g:ctrlp_max_files = 1000000

let g:ragtat_global_maps=1

hi PreProc guifg=red ctermfg=red guibg=grey15

" File type associations
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.thor setf ruby
au BufRead,BufNewFile *.hamlc setf haml
au BufRead,BufNewFile *.ract setf html

" Support rspec in all projects
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" Remove all trailing whitespace
au BufWritePre * :%s/\s\+$//e
