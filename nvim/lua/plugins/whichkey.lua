-- return {
-- 	"folke/which-key.nvim",
--     tag = "v2.1.0",
-- 	event = "VeryLazy",
-- 	init = function()
-- 		vim.o.timeout = true
-- 		vim.o.timeoutlen = 300
-- 	end,
-- 	opts = {},
-- 	config = function()
-- 		require("plugins.configs.whichkey")
-- 	end,
-- }

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    init = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
	opts = {
        spec = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
            { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find file"},
            { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find in project"},
            { "<leader>o", "<cmd>Oil<cr>", desc = "Oil"},
            { "<leader>O", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others"},
            { "<leader>p", "<cmd>Lazy<cr>", desc = "Lazy"},
            { "<leader>x", "<cmd>Bdelete!<cr>", desc = "Close Buffer"},
            { "<leader>X", "<cmd>bufdo! bw<cr>", desc = "Close All Buffers"},
            { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
            { "<leader>q", "<cmd>q!<cr>", desc = "Quit" },

            { "<leader>c", group = "Copilot" },
            { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Chat Toggle" },
            { "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Docs" },
            { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain" },
            { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix" },
            { "<leader>cF", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
            { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize" },
            { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Tests" },
            { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset" },

            { "<leader>g", group = "Git" },
            { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
            { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
            { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
            { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
            { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
            { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
            { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current Line Blame" },

            { "<leader>l", group = "LSP" },
            { "<leader>lA", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code actions" },
            { "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", desc = "Go to definition" },
            { "<leader>lD", "<cmd>lua vim.lsp.buf.delaration()<CR>", desc = "Go to declaration" },
            { "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", desc = "Show line diagnostics" },
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
            { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
            { "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
            { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
            { "<leader>lL", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List workspace folder" },
            { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next diagnostic" },
            { "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostic" },
            { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
            { "<leader>lr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
            { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
            { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
            { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },

            { "<leader>s", group = "Search" },
            { "<leader>sb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
            { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>sC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>sf", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending <cr>", desc = "Find in File" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
            { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
            { "<leader>st", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },
            { "<leader>sp", "<cmd>Telescope planets<cr>", desc = "Planets" },
            { "<leader>sP", "<cmd>Telescope builtin<cr>", desc = "Pickers" },
            { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
            { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
            { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
        }
    },
}
