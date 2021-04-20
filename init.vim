"Leader
let mapleader = " "

nnoremap L gt
nnoremap H gT
nnoremap <C-t> :tabnew<CR>
nnoremap <C-t> <Esc>:tabnew<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>
"Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"Global
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Right> <C-W>l
noremap <C-Left> <C-W>h
map <C-H> :nohl<CR>
nnoremap <C-h> :%s<SPACE>//g
nnoremap / /\c
nnoremap U <C-r>

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

let g:coc_global_extensions = ['coc-css', 'coc-fzf-preview', 'coc-html', 'coc-html-css-support', 'coc-prettier', 'coc-lists',  'coc-stylelintplus', 'coc-tsserver']

function! PlugCoc(info) abort
    if a:info.status ==? 'installed' || a:info.force
          !yarn install
              call coc#util#install_extension(join(get(s:, 'coc_extensions', [])))
                elseif a:info.status ==? 'updated'
                      !yarn install
                          call coc#util#update()
                            endif
                              call PlugRemotePlugins(a:info)
                            endfunction


call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('PlugCoc')}
"Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x' }
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
"Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
"Plug 'epilande/vim-es2015-snippets'
"Plug 'epilande/vim-react-snippets'
"Plug 'SirVer/ultisnips'
call plug#end()

filetype plugin indent on
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
set clipboard=unnamedplus

set lazyredraw
set termguicolors

set background=dark

colorscheme dracula

let g:closetag_regions =  {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

" NERD tree configuration
noremap <C-b> :NERDTreeToggle<CR>
nnoremap F :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1

"Prettier config
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
     \   'javascript': ['prettier', 'eslint'],
     \   'typescript': ['prettier', 'eslint'],
     \}
" Softtabs, 2 space
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation
set nojoinspaces


" fzf.vim
"shortcut
nnoremap K :Ag <C-R><C-W><CR>
nnoremap <C-k> /<C-R><C-W><CR>
nnoremap \ :Ag<SPACE>
nnoremap <C-F> :GFiles<SPACE><CR>
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

" config Lightline
let g:dightline = {
      \ 'colorscheme': 'darcula',
      \'active': {
      \   'left': [ [ 'mode', 'paste', 'absolutepath'],
      \             [ 'gitbranch', 'cocstatus', 'readonly',  'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightlineFilename'
      \ },
      \ }
"get file name
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" coc
"Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <Leader>f :Format <CR>
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
nmap <Leader>o :OR <CR>

augroup SyntaxSettings
	autocmd!
	autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
	autocmd BufNewFile,BufRead *.jsx set filetype=javascriptjeact
augroup END

  " Auto close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue,*.tsx, *.ts'
let g:closetag_emptyTags_caseSensitive = 1
let g:jsx_ext_required = 0
