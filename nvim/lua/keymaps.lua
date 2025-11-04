-- ====================================================================
--                          gitsigns.nvim
-- ====================================================================

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Hunk preview" })
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })

-- ====================================================================
--                          gitsigns.nvim
-- ====================================================================

vim.keymap.set("n", "<leader>gad", ":Git add .<CR>", { desc = "Git add current directory" })
vim.keymap.set("n", "<leader>gaf", ":Git add %<CR>", { desc = "Git add current file"  })
vim.keymap.set("n", "<leader>gc", function()
  local msg = vim.fn.input("Commit message: ")
  if msg ~= "" then
    vim.cmd("Git commit -m \"" .. msg .. "\"")
  else
    print("Commit aborted: empty message")
  end
end, { desc = "Git commit with message" })
vim.keymap.set("n", "<leader>gp", function()
  vim.cmd("Git push")
end, { desc = "Git push" })
vim.keymap.set("n", "<leader>gpu", function()
  vim.cmd("Git push -u origin main")
end, { desc = "Git push and set upstream" })

-- ====================================================================
--                           neo-tree.nvim
-- ====================================================================

vim.keymap.set("n", "<C-f>", ":Neotree filesystem reveal left<CR>", { desc = " Reveal Filesystem" })

-- ====================================================================
--                             conform.lua
-- ====================================================================

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format code" })

-- ====================================================================
--                           lsp-config.lua
-- ====================================================================

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

-- ====================================================================
--                              telescope
-- ====================================================================

local builtin = require("telescope.builtin")
vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-s>", builtin.live_grep, {})

-- ====================================================================
--                             diagnostics
-- ====================================================================

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
