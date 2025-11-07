-- ====================================================================
--                          gitsigns.nvim
-- ====================================================================

local gs = require("gitsigns")

-- Navigation
vim.keymap.set("n", "<leader>gn", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gs.nav_hunk("next")
	end
end, { desc = "Next git hunk" })

vim.keymap.set("n", "<leader>gp", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gs.nav_hunk("prev")
	end
end, { desc = "Previous git hunk" })

-- Actions
vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })

vim.keymap.set("v", "<leader>gs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selected hunk" })
vim.keymap.set("v", "<leader>gr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selected hunk" })

vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { desc = "Stage entire buffer" })
vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reset entire buffer" })
vim.keymap.set("n", "<leader>gpv", gs.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gpi", gs.preview_hunk_inline, { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame current line" })
vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Diff this buffer" })
vim.keymap.set("n", "<leader>gD", function() gs.diffthis("~") end, { desc = "Diff against last commit" })
vim.keymap.set("n", "<leader>gQ", function() gs.setqflist("all") end, { desc = "Populate quickfix with all hunks" })
vim.keymap.set("n", "<leader>gq", gs.setqflist, { desc = "Populate quickfix with current hunks" })

-- Toggles
vim.keymap.set("n", "<leader>gbt", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
vim.keymap.set("n", "<leader>gwt", gs.toggle_word_diff, { desc = "Toggle word diff" })

-- Text object
vim.keymap.set({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select git hunk" })

-- ====================================================================
--                               git
-- ====================================================================

vim.keymap.set("n", "<leader>Gad", ":Git add .<CR>", { desc = "Git add current directory" })
vim.keymap.set("n", "<leader>Gaf", ":Git add %<CR>", { desc = "Git add current file" })
vim.keymap.set("n", "<leader>Gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>Gpu", ":Git push -u origin main<CR>", { desc = "Git push and set upstream" })
vim.keymap.set("n", "<leader>Gc", function()
	local msg = vim.fn.input("Commit message: ")
	if msg ~= "" then
		vim.cmd('Git commit -m "' .. msg .. '"')
	else
		print("Commit aborted: empty message")
	end
end, { desc = "Git commit with message" })
