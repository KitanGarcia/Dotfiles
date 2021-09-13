" This file should be located in ~/.config/nvim

let mapleader = " "
let maplocalleader = ","

" Enable clipboard (without having xterm_clipboard enabled/compiled)
set clipboard+=unnamedplus
" set clipboard^=unnamed,unnamedplus
" let g:clipboard = {
"   \   'name': 'xclip-xfce4-clipman',
"   \   'copy': {
"   \      '+': 'xclip -selection clipboard',
"   \      '*': 'xclip -selection clipboard',
"   \    },
"   \   'paste': {
"   \      '+': 'xclip -selection clipboard -o',
"   \      '*': 'xclip -selection clipboard -o',
"   \   },
"   \   'cache_enabled': 1,
"   \ }
"
"

call plug#begin('~/.config/nvim/plugged')
" Black for python
Plug 'dense-analysis/ale'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'epmatsw/ag.vim'
Plug 'tpope/vim-eunuch'
call plug#end()

autocmd BufWritePre *.py execute ':ALEFix'

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:ale_fixers = {
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'python': ['black']
\}

"let g:ale_fixers.python = ['black']
let g:ale_fix_on_save = 1
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python3.9'

" Performance
set lazyredraw " Don't update screen during macro and script execution
" Indentation

set hlsearch " Enable highlighting
set incsearch " Enable search highlighting
set tabstop=2 " View indents as using 2 spaces
set softtabstop=2 " Number of spaces in Tab when editing
set shiftwidth=2 " Indenting is 2 spaces
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
"set mouse=a " Enable mouse
set title " Set window's title to file being edited
set showcmd " Show commands in the bottom bar
filetype indent on " Load filetype-specific indent files
set showmatch " Highlight matching [{()}]

nnoremap <silent> <Esc> <Esc>:nohlsearch<CR><Esc>
" ^Make double-<Esc> clear search highlights

" Code Folding Options
set foldenable " Enable folding
set foldlevelstart=99 " Folds are always open
set foldmethod=indent " Fold based on indention levels.
set foldnestmax=10 " Only fold up to 10 nested levels.
set nofoldenable " Disable folding by default.

" Miscellaneous Options
set history=1000 " Increase the undo limit

" Use fzf with \\ff
map <leader>ff :Files<CR>

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader>RG :RG<CR>
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader>sp :RG<CR>

nmap <leader>do <Plug>(coc-codeaction)
nmap <silent> gd <Plug>(coc-definition)
map <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': function('s:copy_results'),
  \ 'ctrl-o': ':r !echo'}



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


" Plugin for auto completion


" Powerline setup
set laststatus=2
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
let g:Powerline_symbols = 'fancy'
