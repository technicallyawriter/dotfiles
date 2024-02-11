colorscheme desert
filetype plugin on
set nocompatible
syntax on
set wrap
set spell
set number
set ignorecase
set cursorline
set wildmenu

" indent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" status line
set laststatus=2
set statusline=%<%F\ %(%m%r%w%)%=%p%%

" shame
set mouse=a
set clipboard=unnamedplus

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

" LSP config
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

""" ALE Config
" Enable ALE
let g:ale_enabled = 1

" Vale linting
let g:ale_linters = {
  \ 'text': ['vale'],
  \ }

" Specify the Vale executable
let g:ale_vale_executable = '/usr/local/bin/vale'

" Prettier formatting
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier'],
    \   'javascript.jsx': ['prettier'],
    \   'typescript': ['prettier'],
    \   'typescript.tsx': ['prettier'],
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

" FZF
set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Key mappings
" fzf all files
nnoremap <leader>f :FZF<CR>
" fzf Git files
nnoremap <leader>g :GFiles<CR>
" fzf buffers
nnoremap <leader>b :Buffers<CR>
" fzf with ripgrep
nnoremap <leader>t :Rg<CR>

""" PLUGINS
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
