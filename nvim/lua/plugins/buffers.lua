return {
	{
		"famiu/bufdelete.nvim",
	},
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("bufferline").setup()
		end,
	},
}
