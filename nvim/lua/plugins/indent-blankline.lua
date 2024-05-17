return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {},
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    config = function()
        require("ibl").setup {
            scope = {
                enabled = false,
                show_start = false,
                show_end = false,
            },
        }
    end,
}
