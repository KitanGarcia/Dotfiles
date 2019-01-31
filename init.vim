" This file should be located in ~/.config/nvim

" Enable clipboard (without having xterm_clipboard enabled/compiled)
set clipboard+=unnamed
let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

" Performance
set lazyredraw " Don't update screen during macro and script execution

" Indentation
set hlsearch " Enable highlighting
set incsearch " Enable search highlighting
set tabstop=2 " View indents as using 2 spaces
set softtabstop=2 " Number of spaces in Tab when editing
set autoindent " New lines inherit indentation of previous lines
set expandtab " Convert tabs to spaces
set smarttab " Insert tabstop number of spaces when Tab is pressed

" Text Rendering
set encoding=utf-8 "Support unicode
set linebreak " Avoid wrapping a line in the middle of a word
set scrolloff=1 " Number lines to keep above and below cursor
set sidescrolloff=5 " Number columns to keep to left and right of cursor
syntax enable " Enable syntax processing

" Interface Options
set laststatus=2 " Always display status bar
set ruler " Always show cursor position
set cursorline " underline current line under cursor
set wildmenu " Display command line's tab complete options as a menu
set number " Show line numbers on sidebar
set mouse=a " Enable mouse
set title " Set window's title to file being edited
set showcmd " Show commands in the bottom bar
filetype indent on " Load filetype-specific indent files
set showmatch " Highlight matching [{()}]


" Code Folding Options
set foldenable " Enable folding
set foldlevelstart=99 " Folds are always open
set foldmethod=indent " Fold based on indention levels.
set foldnestmax=10 " Only fold up to 10 nested levels.
set nofoldenable " Disable folding by default.

" Miscellaneous Options
set history=1000 " Increase the undo limit

" Keybindings
" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
nnoremap gV `[v`]

" Mapleader
let mapleader=","       " Leader is comma (instead of \)

" Reopen a saved nvim sesssion with nvim -s
nnoremap <leader>s :mksession<CR>

" Plugins to get: power???, gundo, ag, ctrlp,
