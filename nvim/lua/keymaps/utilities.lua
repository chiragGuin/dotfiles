-- ====================================================================
--                              neo-tree
-- ====================================================================

vim.keymap.set("n", "<C-f>", ":Neotree filesystem reveal left<CR>", { desc = " Reveal Filesystem" })

--[[

auto linting is active so this is optional if in future any change is made

-- ====================================================================
--                              nvim-lint
-- ====================================================================

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Lint current file" })

]]

-- ====================================================================
--                             conform.lua
-- ====================================================================

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format code" })


-- ====================================================================
--                             diagnostics
-- ====================================================================

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open diagnostic" })
vim.keymap.set("n", "<leader>du", vim.diagnostic.goto_prev, { desc = "next diagnostic" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.goto_next, { desc = "previous diagnostic" })

-- ====================================================================
--                           lsp-config.lua
-- ====================================================================

vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, { desc = "go to declaration" })
vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, { desc = "code action" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "rename all" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.hover, { desc = "documentation" })
