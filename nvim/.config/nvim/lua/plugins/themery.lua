return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { 
				"catppuccin",
				"cyberdream",
				"fluoromachine",
				"monokai-pro",
				"moonlight",
				"oxocarbon",
				"poimandres",
				"tokyonight",
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Open Themery" })
	end
}
