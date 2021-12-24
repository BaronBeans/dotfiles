local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-web-devicons"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye" -- buffer delete etc
    use "nvim-lualine/lualine.nvim" -- istead of airline
    use "akinsho/toggleterm.nvim"
    use "lewis6991/impatient.nvim"
    use "folke/which-key.nvim"
    use "ahmedkhalf/project.nvim"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"

    -- snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- My plugins here
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- use 'morhetz/gruvbox'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    -- use 'glepnir/dashboard-nvim'
    use "goolord/alpha-nvim"

    use 'neoclide/coc-pairs'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround' -- ysw / ysiw etc - ) for no space ( for spaces )
    use 'alvan/vim-closetag'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary' -- gcc / gc to comment/uncomment line/block
    use 'airblade/vim-gitgutter'

    use 'nvim-telescope/telescope.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
