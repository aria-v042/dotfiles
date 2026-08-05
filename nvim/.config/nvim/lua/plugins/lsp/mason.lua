return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
--    opts = {
--      ensure_installed = { "clangd", "lua_ls" },
--      automatic_enable = true,
--    },
  },
}
