syntax enable

set hidden
"
set number
set relativenumber
set cursorline
"
set ignorecase
set smartcase
set incsearch
set nohls
set showcmd
set cmdheight=1
"
set shiftwidth=4
set tabstop=4
set softtabstop=4 " Number of spaces a tab counts when editing
set expandtab
set smarttab
set autoindent
"
set lazyredraw
set scrolloff=15
"
set noeb
"
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set autochdir
"
set splitright
set splitbelow
"
set mouse=a

call plug#begin()
" colour scheme / statusbars
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'glepnir/dashboard-nvim'
" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " ysw / ysiw etc - ) for no space ( for spaces )
Plug 'alvan/vim-closetag'
" Plug 'neovim/nvim-lspconfig'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' " gcc / gc to comment/uncomment line/block
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

let mapleader=" "

" escape the terminal hell
tnoremap <Esc> <C-\><C-n>
tnoremap jk  <C-\><C-n>

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

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

nnoremap <silent> ga :<C-u>CocList diagnostics<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ga  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>g  <Plug>(coc-fix-current)

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

let g:prettier#exec_cmd_path = "~/.nvm/versions/node/v14.17.6/bin/prettier"
let g:prettier#autoformat = 1


let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git']
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let g:airline_theme='wombat'

let g:dashboard_default_executive = 'fzf'

nnoremap <leader>r :Rg
nnoremap <leader>s :%s/
