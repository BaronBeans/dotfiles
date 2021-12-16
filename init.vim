syntax enable

set hidden

set number
set relativenumber
set cursorline

set ignorecase
set smartcase
set incsearch
set nohls
set showcmd
set cmdheight=2

set shiftwidth=4
set tabstop=4
set softtabstop=4 " Number of spaces a tab counts when editing
set expandtab
set smarttab
set autoindent

set lazyredraw
set scrolloff=15

set noeb

set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set autochdir

set splitright
set splitbelow

set mouse=a

call plug#begin()

" colour scheme
Plug 'morhetz/gruvbox'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
" Plug 'neovim/nvim-lspconfig'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

" syntax highlighting
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'styled-components/vim-styled-components'

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'branch': 'release/0.x' }

" searching
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

" others
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

call plug#end()

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=
set statusline+=\ %F
set statusline+=%= "Shift over to the right
set statusline+=\ %c:%l:%L
set statusline+=\ %n
set statusline+=\ %{LinterStatus()}

" escape the terminal hell
tnoremap <Esc> <C-\><C-n>
tnoremap jk  <C-\><C-n>

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-\> <C-W>v
nnoremap <C-s> <C-W>s
nnoremap <C-x> <C-W>q

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-m> :GFiles?<CR>
" nnoremap <C-F> :GFiles?<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader=" "

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)


" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" let g:ale_linters_explicit = 1
" let g:ale_linters= {
" \   'javascript': ['prettier', 'eslint', 'stylelint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'jsx': ['stylelint', 'eslint'],
" \}

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier'],
" \   'jsx': ['prettier'],
" \   'typescript': ['prettier'],
" \}

" let g:ale_fix_on_save = 1

let g:prettier#exec_cmd_path = "~/.nvm/versions/node/v14.17.6/bin/prettier"
let g:prettier#autoformat = 1


let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git']
