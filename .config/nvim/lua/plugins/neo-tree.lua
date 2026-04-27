return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
--    "nvim-tree/nvim-web-devicons", -- optional, requires a Nerd Font
  },
  cmd = "Neotree", -- only loads when you run :Neotree
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle file explorer" },
	{ "<leader>E", ":Neotree reveal<CR>", desc = "Reveal current file in explorer" },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true }, -- moves to the open file's location
      use_libuv_file_watcher = true,             -- auto-refreshes on external changes
    },
    window = {
      width = 30,
      mappings = {
        ["l"] = "open",       -- open with l (vim-style)
        ["h"] = "close_node", -- close with h
      },
    },
  },
}
