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
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
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
" set autochdir
"
set splitright
set splitbelow
"
set mouse=a

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'glepnir/dashboard-nvim'

Plug 'neoclide/coc-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " ysw / ysiw etc - ) for no space ( for spaces )
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' " gcc / gc to comment/uncomment line/block
Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'mhartington/formatter.nvim'

" Plug 'mattn/emmet-vim'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

call plug#end()

set completeopt=menu,menuone,noselect

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
nnoremap <C-q> :q!<CR>

" move lines
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" replace
nnoremap <leader>s :%s/

colorscheme gruvbox
set background=dark

let g:prettier#exec_cmd_path = "~/.nvm/versions/node/v14.17.6/bin/prettier"
let g:prettier#autoformat = 1

let g:airline_theme='wombat'

let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_header = [
\'',
\'  _____ _____  ___   _   _ _ _____   _____ ___________ _____ ',
\' /  ___|  ___|/ _ \ | \ | ( )  ___| /  __ \  _  |  _  \  ___|',
\' \ `--.| |__ / /_\ \|  \| |/\ `--.  | /  \/ | | | | | | |__  ',
\'  `--. \  __||  _  || . ` |  `--. \ | |   | | | | | | |  __| ',
\' /\__/ / |___| | | || |\  | /\__/ / | \__/\ \_/ / |/ /| |___ ',
\' \____/\____/\_| |_/\_| \_/ \____/   \____/\___/|___/ \____/ ',
\'',                                                            
\]

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua <<EOF
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
       ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },

  }
})
EOF

nnoremap <silent> <leader>p :Format<CR>
