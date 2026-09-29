return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { 
				"catppuccin",
				"cyberdream",
				"fluoromachine",
				"gruvbox",
				"kanagawa",
				"monokai-pro",
				"moonlight",
				"oxocarbon",
				"poimandres",
				"rose-pine",
				"tokyonight",
				"vscode",
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Open Themery" })
	end
}
