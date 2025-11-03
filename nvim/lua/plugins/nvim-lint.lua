return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "flake8" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      lua = { "luacheck" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      sh = { "shellcheck" },
    }

    -- Run lint automatically when you open or save a file
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: keymap to manually trigger linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Lint current file" })
  end,
}

