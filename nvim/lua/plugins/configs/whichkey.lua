local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = {
			min = 4,
			max = 25,
		}, -- min and max height of the columns
		width = {
			min = 20,
			max = 50,
		}, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	b = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	w = { "<cmd>w!<CR>", "Save" },
	q = { "<cmd>q!<CR>", "Quit" },
	x = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	X = { "<cmd>bufdo! bw<CR>", "Close All Buffers" },
	f = { "<cmd>Telescope find_files<cr>", "Find file" },
	F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find in project" },
	o = { "<cmd>Oil<cr>", "Oil" },
	p = { "<cmd>Lazy<cr>", "Lazy" },

	c = {
		name = "Copilot",
		c = { "<cmd>CopilotChatToggle<cr>", "Chat Toggle" },
		d = { "<cmd>CopilotChatDocs<cr>", "Docs" },
		e = { "<cmd>CopilotChatExplain<cr>", "Explain" },
		f = { "<cmd>CopilotChatFix<cr>", "Fix" },
		F = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix Diagnostic" },
		o = { "<cmd>CopilotChatOptimize<cr>", "Optimize" },
		t = { "<cmd>CopilotChatTests<cr>", "Tests" },
		r = { "<cmd>CopilotChatReset<cr>", "Reset" },
	},

	g = {
		name = "Git",
		b = { "<cmd>Git blame<cr>", "Blame" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Current Line Blame" },
	},

	l = {
		name = "LSP",
		A = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
		d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition" },
		D = { "<cmd>lua vim.lsp.buf.delaration()<CR>", "Go to declaration" },
		e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show line diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		L = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folder" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
		N = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>Telescope lsp_references<CR>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
	},

	s = {
		name = "Search",
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		C = { "<cmd>Telescope command_history<cr>", "Command History" },
		f = { "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending <cr>", "Find in File" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		H = { "<cmd>Telescope highlights<cr>", "Highlights" },
		j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		l = { "<cmd>Telescope loclist<cr>", "Location List" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
		p = { "<cmd>Telescope planets<cr>", "Planets" },
		P = { "<cmd>Telescope builtin<cr>", "Pickers" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix List" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
	},

	t = {
		name = "Test",
		n = { "<cmd>TestNearest<CR>", "Nearest" },
		f = { "<cmd>TestFile<CR>", "File" },
		a = { "<cmd>TestSuite<CR>", "All" },
		l = { "<cmd>TestLast<CR>", "Last" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
