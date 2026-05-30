
-- ==========================
-- Colorscheme & transparency
-- ==========================

-- Re-apply transparency every time a colorscheme is loaded,
-- so it works regardless of which theme Themery switches to
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end,
})

-- Fallback colorscheme for the very first launch before
-- Themery has saved a choice. After first selection,
-- Themery's block in init.lua takes over.
if vim.g.theme_id == nil then
	vim.cmd.colorscheme("wildcharm")
end
