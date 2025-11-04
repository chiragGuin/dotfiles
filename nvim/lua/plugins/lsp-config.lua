return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

      end,
    })

    -- Configure diagnostics    
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "\u{ea87}",
          [vim.diagnostic.severity.WARN] = "\u{f071}",
          [vim.diagnostic.severity.HINT] = "\u{f400}",
          [vim.diagnostic.severity.INFO] = "\u{f05a}",
        },
      },
      virtual_text = {
        enabled = true,
        source = "if_many",
        spacing = 2,
        prefix = "●",
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
      },
    })

    -- Neovim 0.11: Much simpler server setup
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Fix position encoding conflict between pyright and ruff
    capabilities.general = capabilities.general or {}
    capabilities.general.positionEncodings = { "utf-16" }

    -- Configure servers with global defaults
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}
