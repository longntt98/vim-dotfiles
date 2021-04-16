" Leader
let mapleader = " "
nnoremap L gt
nnoremap H gT

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }'
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax enable
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set autoread
set autowrite

" Numbers
set relativenumber
set number
set numberwidth=5

" Copy to clipboard
set clipboard=unnamed

set lazyredraw
set termguicolors

set background=dark

colorscheme dracula

" NERD tree configuration
noremap <C-d> :NERDTreeToggle<CR>
nnoremap F :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1

" fzf.vim
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  
  " Auto close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:jsx_ext_required = 0
