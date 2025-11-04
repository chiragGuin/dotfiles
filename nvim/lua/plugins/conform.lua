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

	end,
}
