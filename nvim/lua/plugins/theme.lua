return {
  "sainnhe/everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_background = "medium"
    vim.g.everforest_enable_italic = true
    vim.g.everforest_disable_italic_comment = true
    vim.g.everforest_diagnostic_text_highlight = true
    vim.g.everforest_diagnostic_line_highlight = true
    vim.g.everforest_diagnostic_virtual_text = "colored"
    vim.cmd.colorscheme("everforest")
  end,
}

