" Notes {
"
"   Sections
"     -> Basic
"     -> General
"     -> UI
"     -> Tabs/Layout
"     -> Search
"     -> Plugin Settings
"     -> Mappings
"     -> Autocommands
"
" }


" Basic {
  call pathogen#infect()
  set nocompatible        " don't use vi-compatible mode
  set noexrc              " don't use .vimrc in current directory
  set history=1000        " remember most of the commands
  set background=dark     " dark is stark
  if has("gui_running")
    colorscheme railscasts
  elseif $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    colorscheme railscasts
  else
    colorscheme default
  endif
  syntax on               " syntax highlight on
" }

" General {
  filetype plugin indent on       " load filetype plugins/indent settings
  set nobackup                    " use version control
  set fileformats=unix,dos,mac    " support all three, in this order
  set hidden                      " change buffers w/out saving
" set mouse=a                     " maybe i can need it
  set mousehide                   " hide mouse while typing
  set noerrorbells                " no noise
  set wildmenu                    " <TAB> completion shell-like
  set wildmode=longest:full
" }

" UI {
  set number                          " show line numbers
  set numberwidth=4                   " up to 9999 lines
  set laststatus=2                    " always show status line
  set list                            " show tabs and trailing spaces
  set listchars=tab:▸\ ,trail:¬       " nice symbols
  highlight NonText guifg=#4a4a59     "
  highlight SpecialKey guifg=#4a4a59  "
  set matchtime=4                     " show 0.4s matching bracket
  set showmatch                       " show matching brackets
  set nostartofline                   " leave cursor where it was
  set ruler                           " show current position
  set scrolloff=5                     " keep 5 lines (top/bottom) when
                                      " scrolling
  set shortmess=aOstT                 " shortens msgs to avoid
                                      " 'press a key' prompt
  set showcmd                         " show command that is being typed
  set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  "              | | | | |  |   |      |  |     |    |
  "              | | | | |  |   |      |  |     |    + current column
  "              | | | | |  |   |      |  |     |
  "              | | | | |  |   |      |  |     +-- current line
  "              | | | | |  |   |      |  +-- current % into file
  "              | | | | |  |   |      +-- current syntax in square brackets
  "              | | | | |  |   |
  "              | | | | |  |   +-- current fileformat
  "              | | | | |  +-- number of lines
  "              | | | | +-- preview flag in square brackets
  "              | | | +-- help flag in square brackets
  "              | | +-- readonly flag in square brackets
  "              | +-- rodified flag in square brackets
  "              +-- full path to file in the buffer
" }

" Tabs/Layout {
  set completeopt=    " no popup menu for completion
  set expandtab       " no real tabs
  set shiftround      " when 3 spaces and one hits > go to 4, not 5
  set tabstop=2       " real tabs are 2 spaces
  set softtabstop=2   " tab and backspace are 2 spaces
  set shiftwidth=2    " indent 2 spaces
  set nowrap          " do not wrap lines
" }

" Search {
  set nohlsearch    " don't highlight search hits
  set ignorecase    " case insensitive by default
  set smartcase     " if there are caps, go case-sensitive
" }

" Plugin Settings {

" }

" Mappings {
  " Windows {
    map <C-k> <C-W>k
    map <C-j> <C-W>j
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    map <C-Up> <C-W>k
    map <C-Down> <C-W>j
    map <C-Left> <C-W>h
    map <S-right> <C-W>l
  " }
  " Tabs {
    map <S-Left> :tabprev<CR>
    map <S-Right> :tabnext<CR>
    " direct to tab # with #gt where # is the number of the tab
  " }
" }

" Autocommands {
  " make vim restore cursor position in files
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  endif
" }
