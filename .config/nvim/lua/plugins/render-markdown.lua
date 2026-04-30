-- lua/plugins/render-markdown.lua
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons", -- optional but recommended for file icons
	},
	ft = { "markdown" }, -- only load when opening a markdown file
}
