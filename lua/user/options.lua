local options = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    completeopt = {"menuone", "noselect"}, -- mostly just for cmp
    pumheight = 10, -- pop up menu height
    showtabline = 2, -- always show tabs
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time

    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 300, -- faster completion (4000ms default)

    -- mine:
    --
    hidden = true,
    --
    number = true,
    relativenumber = true,
    cursorline = true,
    --
    ignorecase = true,
    smartcase = true,
    incsearch = true,
    hlsearch = false,
    showcmd = true,
    cmdheight = 2,
    --
    shiftwidth = 2,
    tabstop = 2,
    softtabstop = 2,
    expandtab = true,
    smarttab = true,
    autoindent = true,
    --
    lazyredraw = true,
    scrolloff = 15,
    --
    eb = false,
    --
    swapfile = false,
    backup = false,
    writebackup = false,
    undodir = "~/.config/nvim/undodir",
    undofile = true,
    --
    splitright = true,
    splitbelow = true,
    --
    mouse = "a"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
