return {
  -- full git client inside nvim
  {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    opts = {
      kind = "replace", -- opens in full window
      integrations = { diffview = true },
    },
  },

  -- optional visual git diff & stash browser
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  -- optional fancy UI git status / preview plugin
  {
    "tanvirtin/vgit.nvim",
    event = "VeryLazy",
    opts = {},
  },
}

