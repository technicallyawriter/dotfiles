let mapleader = " "

colorscheme desert
syntax on
filetype plugin on

set wrap
set linebreak
set spell
set number
set relativenumber
set ignorecase
set cursorline
set showcmd

" find
set path+=**
set wildmode=list:longest,full
set wildmenu
set wildignore+=**/node_modules/**,**/public/**,**build/site/**,**/*.png,**/*.jpeg,**/*.jpg,**/*.svg

" indent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" status line
set laststatus=2
set statusline=%<%f\   " File path
set statusline+=%m     " Modified flag
set statusline+=%r     " Readonly flag
set statusline+=%y     " Filetype indicator
set statusline+=%=     " set to right
set statusline+=%p%%   " Percent through the file

" system clipboard
noremap <Leader>y "+y

" shame
set mouse=a

" file browsing
let g:netrw_banner=0

" remap splits navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easier splits resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" easier scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" remap for moving within a wrapped line
noremap j gj
noremap k gk

" LSP config
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ALE Config
let g:ale_enabled = 1

" Vale linting
let g:ale_linters = {
  \ 'text': ['vale'],
  \ }

" Path to Vale
let g:ale_vale_executable = '/usr/local/bin/vale'

" Prettier formatting
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \   'html': ['prettier'],
    \   'yaml': ['prettier'],
    \   'toml': ['prettier'],
    \   'php': ['prettier'],
    \   'go': ['prettier'],
    \   'python': ['prettier'],
    \   'markdown': ['prettier'],
    \   'asciidoc': ['prettier'],
    \   'bash': ['prettier'],
    \}

" Automatically fix issues on save
let g:ale_fix_on_save = 1

" PLUGINS
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'dense-analysis/ale'
Plug 'itspriddle/vim-shellcheck'
call plug#end()
