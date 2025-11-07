-- ====================================================================
--                           neo-tree.nvim
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
--                          gitsigns.nvim
-- ====================================================================

vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Hunk preview" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })

-- Navigation
vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		require("gitsigns").nav_hunk("next")
	end
end, { desc = "Next git hunk" })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		require("gitsigns").nav_hunk("prev")
	end
end, { desc = "Previous git hunk" })

-- Actions
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })

vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })

vim.keymap.set("v", "<leader>hs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selected hunk" })

vim.keymap.set("v", "<leader>hr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selected hunk" })

vim.keymap.set("n", "<leader>hS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage entire buffer" })

vim.keymap.set("n", "<leader>hR", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset entire buffer" })

vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

vim.keymap.set("n", "<leader>hi", function()
	require("gitsigns").preview_hunk_inline()
end, { desc = "Preview hunk inline" })

vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame current line" })

vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this buffer" })

vim.keymap.set("n", "<leader>hD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff against last commit" })

vim.keymap.set("n", "<leader>hQ", function()
	require("gitsigns").setqflist("all")
end, { desc = "Populate quickfix with all hunks" })

vim.keymap.set("n", "<leader>hq", function()
	require("gitsigns").setqflist()
end, { desc = "Populate quickfix with current hunks" })

-- Toggles
vim.keymap.set("n", "<leader>tb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle current line blame" })

vim.keymap.set("n", "<leader>tw", function()
	require("gitsigns").toggle_word_diff()
end, { desc = "Toggle word diff" })

-- Text object
vim.keymap.set({ "o", "x" }, "ih", function()
	require("gitsigns").select_hunk()
end, { desc = "Select git hunk" })

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

-- ====================================================================
--                              telescope
-- ====================================================================

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>Tr", "<cmd>Telescope lsp_references<CR>", { desc = "references" })
vim.keymap.set("n", "<leader>Td", "<cmd>Telescope lsp_definitions<CR>", { desc = "definitions" })
vim.keymap.set("n", "<leader>Ti", "<cmd>Telescope lsp_implementations<CR>", { desc = "implementations" })
vim.keymap.set("n", "<leader>Tt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "type" })
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "list diagnostics" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "find text" })

-- ====================================================================
--                               git
-- ====================================================================

vim.keymap.set("n", "<leader>gad", ":Git add .<CR>", { desc = "Git add current directory" })
vim.keymap.set("n", "<leader>gaf", ":Git add %<CR>", { desc = "Git add current file" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gpu", ":Git push -u origin main<CR>", { desc = "Git push and set upstream" })
vim.keymap.set("n", "<leader>gc", function()
	local msg = vim.fn.input("Commit message: ")
	if msg ~= "" then
		vim.cmd('Git commit -m "' .. msg .. '"')
	else
		print("Commit aborted: empty message")
	end
end, { desc = "Git commit with message" })
