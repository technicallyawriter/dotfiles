set number
set ruler
set autoindent
set showmatch
set ignorecase
set hlsearch  
set expandtab  
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmode=longest,list
set clipboard=unnamedplus
set wrap
set mouse=a
set splitbelow splitright

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

" nerdtree toggle
nnoremap <C-t> :NERDTreeToggle<CR>

" Emmet shortcuts
let g:user_emmet_mode='n' "only enable normal mode functions
let g:user_emmet_leader_key=","

" LSP config
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" PLUGINS via vim-plug
call plug#begin()
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/mattn/vim-lsp-settings'
Plug 'https://github.com/dense-analysis/ale'
call plug#end()

" ALE/Vale Config 
" Enable ALE
let g:ale_enabled = 1

" Use Vale for linting
let g:ale_linters = {
  \ 'text': ['vale'],
  \ }

" Use global eslint if available
let g:ale_javascript_eslint_executable = 'eslint'

" Specify the Vale executable
let g:ale_vale_executable = '/usr/local/bin/vale'

" Automatically fix issues on save
let g:ale_fix_on_save = 1


