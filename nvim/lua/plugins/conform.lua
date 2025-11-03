return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Load before saving a file
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			-- Add formatters per filetype
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "jq" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				sh = { "shfmt" },
			},
		})

		-- Optional: keymap to manually trigger formatting
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format code" })
	end,
}
