return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local startify = require("alpha.themes.startify")
    startify.file_icons.provider = "devicons"
    require("alpha").setup(startify.config)
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "󰍉  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }
    dashboard.section.header.opts.hl = "Type"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Comment"
    alpha.setup(dashboard.opts)
  end,
}
