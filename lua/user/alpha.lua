local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {[[  _____ _____  ___   _   _ _ _____   _____ ___________ _____ ]],
                                [[ /  ___|  ___|/ _ \ | \ | ( )  ___| /  __ \  _  |  _  \  ___|]],
                                [[ \ `--.| |__ / /_\ \|  \| |/\ `--.  | /  \/ | | | | | | |__  ]],
                                [[  `--. \  __||  _  || . ` |  `--. \ | |   | | | | | | |  __| ]],
                                [[ /\__/ / |___| | | || |\  | /\__/ / | \__/\ \_/ / |/ /| |___ ]],
                                [[ \____/\____/\_| |_/\_| \_/ \____/   \____/\___/|___/ \____/ ]]}

dashboard.section.buttons.val = {dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
                                 dashboard.button("g", "  Git files", ":Telescope git_status <CR>"),
                                 dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
                                 dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
                                 dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
                                 dashboard.button("s", "  Find text", ":Telescope live_grep <CR>"),
                                 dashboard.button("t", "  Terminal", ":ToggleTerm direction=float<cr>"),
                                 dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                                 dashboard.button("q", "  Quit Neovim", ":qa<CR>")}

local function footer()
    return "https://seanbarnard.dev"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
