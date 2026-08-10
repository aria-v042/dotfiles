return {
 	{
 		"mason-org/mason.nvim",
 		opts = {
 			ui = {
 			icons = {
 				package_installed = "✓",
 				package_pending = "➜",
 				package_uninstalled = "✗"
 			}},
 		},
 	},
 	{
 		"mason-org/mason-lspconfig.nvim",
 		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
 		opts = {
 			ensure_installed = {
 				"clangd",
 			},
 			automatic_enable = true,
 		},
 	},
}
