return {
	"kyazdani42/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			renderer = {
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "U",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
				highlight_git = true,
				root_folder_modifier = ":t",
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			filters = {
				dotfiles = false,
				custom = {},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 500,
			},
			view = {
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
			actions = {
				open_file = {
					resize_window = true,
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}
