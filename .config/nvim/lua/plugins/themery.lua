return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { 
				"catppuccin",
				"fluoromachine",
				"monokai-pro",
				"tokyonight",
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Open Themery" })
	end
}
