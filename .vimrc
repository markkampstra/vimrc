" ==============================================================================
" Vundle
" ==============================================================================

set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required

Plugin 'ctrlpvim/ctrlp.vim'               " full path fuzzy finder
Plugin 'ervandew/supertab'                " tab completion
Plugin 'ngmy/vim-rubocop'                 " rubocop integration
Plugin 'ntpeters/vim-better-whitespace'   " show trailing whitespaces
Plugin 'tpope/vim-bundler'                " bundle commands
Plugin 'tpope/vim-fugitive'               " git commands
Plugin 'tpope/vim-commentary'             " easy commenting
Plugin 'tpope/vim-rails'                  " rails commands
Plugin 'tpope/vim-rake'                   " rake commands
Plugin 'tpope/vim-repeat'                 " more repeatings with .
Plugin 'tpope/vim-surround'               " surroundings
Plugin 'vim-ruby/vim-ruby'                " ruby commands
Plugin 'thoughtbot/vim-rspec'             " Rspec commands
Plugin 'mileszs/ack.vim'                  " Search tool
Plugin 'ConradIrwin/vim-bracketed-paste'  " No more `:set paste`

Plugin 'tpope/vim-haml'                   " syntax highlight .haml
Plugin 'tpope/vim-markdown'               " syntax highlight .md
Plugin 'kchmck/vim-coffee-script'         " syntax highlight .coffee
Plugin 'groenewege/vim-less'              " syntax highlight .less
Plugin 'slim-template/vim-slim.git'       " syntax highlight .slim
Plugin 'leafgarland/typescript-vim'       " syntax highlight .ts
Plugin 'keith/rspec.vim'                  " Better highlighting for rspec

Plugin 'chriskempson/base16-vim'          " colorscheme

Plugin 'scrooloose/nerdTree'
Plugin 'elixir-editors/vim-elixir'        "Elixir
Plugin 'tpope/vim-dispatch'               "Dispatching commands
Plugin 'posva/vim-vue'                    "Vue syntax

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
" colorscheme railscasts
colorscheme base16-railscasts
"

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" map <C-m> :NERDTreeFind<CR>


" Strip whitespace automaticly
autocmd BufEnter * EnableStripWhitespaceOnSave

" ==============================================================================
" Ruby stuff
" ==============================================================================

syntax on                 " Enable syntax highlighting

" Enable built-in matchit plugin
runtime macros/matchit.vim

" Always run rspec in bundler
let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
" Use iTerm2 as rspec runner
let g:rspec_runner = 'os_x_iterm2'


" ==============================================================================
" General settings
" ==============================================================================

set nobackup                    " Don't keep backups of files
set nowritebackup               " Don't make backups when writing to files
set history=500                 " keep 500 lines of command line history
set ruler                       " show the cursor position all the time
set showmode                    " show insert, replace or visual status
set showcmd                     " display incomplete commands
set nocursorline                " don't highlight current line
set incsearch                   " do incremental searching
set hlsearch                    " highlight search matches
set backspace=indent,eol,start  " backspace over everything in insert mode
set wildmenu                    " enhanced command line completion
set wildmode=list:longest,full  " list all, complete to longest, cycle full
set autoindent                  " Automatically indent new lines
set encoding=utf-8              " Best for MacVim/gVim and utf-8 terminals
set autoread                    " Automatically reread externally changed files
set gdefault                    " Always set g flag on regexes
set matchpairs+=<:>             " Match <> with %
set vb t_vb=                    " Disable beeping completely
set splitbelow                  " Enable split below
set splitright                  " Enable split right
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Don't ingore case if searching with upper case
set scrolloff=3                 " Number of lines to keep above/below the cursor
set bg=dark                     " Always use dark background
set guifont=Ayuthaya:h18        " Set a default font
set laststatus=2                " Always display the status line
set tabstop=2                   " Number of spaces that for a <Tab>
set shiftwidth=2                " Number of spaces to use for (auto)indent
set shiftround                  " Round indent to multiple of 'shiftwidth'
set expandtab                   " Convert tabs to spaces in insert mode
set smarttab                    " Insert blanks (shiftwidth amount) on newline
set wrap                        " Wrap by default
set whichwrap=b,s,<,>,[,]       " Cursor keys move from eol to start of next line

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Also include hidden files, but not the ones from the gitignore.
let g:ctrlp_user_command = ['ag %s -l --hidden --nocolor -g ""', '.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_caching = 0

" Let's use The Silver Searcher as default search tool
let g:ackprg = 'ag --vimgrep'

let g:vimrubocop_keymap = 0

" ==============================================================================
" Leader mappings
" ==============================================================================

let mapleader = ","

nnoremap <Leader>a :Ack<Space>
nnoremap <Leader>bi :Bundle<CR>
nnoremap <Leader>bs :Bsplit<Space>
nnoremap <Leader>ex :Explore<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sn :call RunNearestSpec()<CR>
nnoremap <Leader>ve :tabe ~/.vimrc<CR>
nnoremap <Leader>vi :source ~/.vimrc<CR>:PluginInstall!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :RuboCop<CR>
map <Leader>/ gcc

" noremap <Leader> :call RebaseActionToggle()<Cr>

" ==============================================================================
" Other mappings
" ==============================================================================

" Easy access to the start of the line
nnoremap 0 ^

" Disable Ex mode, remap Q to formatting
nnoremap Q gq<CR>

" Indent and automatically re-select
vnoremap > >gv
vnoremap < <gv

" Search for word under cursor and open search results
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Save text to clipboard in visual mode by hitting ctrl-c
vnoremap <C-c> :w !pbcopy<CR><CR>


