return {
	"vim-test/vim-test",
	config = function()
		vim.cmd([[
      let test#strategy = "neovim"
      let test#neovim#term_position = "vert"
    ]])
	end,
}
