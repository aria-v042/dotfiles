-- =============
--  Colorscheme
-- =============


-- Colorscheme issues:
--
--	General:
--		before re-selecting theme:
--			- Telescope: doesn't apply theme; no transparency (except
--			"monokai-pro")
--			- NvimTree: doesn't apply theme
--
--	gruvbox:
--		- no transparency in highlight groups:
--			- CursorLineNr
--			- StatusLine
--			- StatusLineNC
--			- Folded
--			- ColorColumn
--			- CursorLine
--	monokai-pro:
--		- no transparency in highlight groups:
--			- StatusLine
--			- StatusLineNC
--			- NormalFloat
--			- ...?
--	moonlight:
--		- Telescope: no transparent background
--		- no transparency in highlight groups:
--			- StatusLine
--			- StatusLineNC
--			- NormalFloat
--			- ...?
--		- can't disable some italic text (strings)
--	oxocarbon:
--		- no transparency in most highlight groups
--	tokyonight:
--		- no transparency in highlight groups:
--			- StatusLine
--			- StatusLineNC
--	vscode:
--		- no transparency in highlight groups:
--			- StatusLine
--			- NormalFloat


-- Re-apply transparency every time a colorscheme is loaded,
-- so it works regardless of which theme Themery switches to
vim.api.nvim_create_autocmd("ColorScheme", 
{
	pattern = "*",
	callback = function()
		-- Set no background for relevant highlight groups
		vim.api.nvim_set_hl(0, "EndOfBuffer",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "Folded",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "FoldColumn",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "Normal",		{ bg = "none" })
		-- indent-blankline
		vim.api.nvim_set_hl(0, "IblScope",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "@ibl.scope.char.1",	{ bg = "none" })
		-- telescope
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		-- nvim-tree
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeStatus", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "none" })
	end,
})

-- -- Fallback colorscheme for the very first launch before
-- -- Themery has saved a choice. After first selection,
-- -- Themery's block in init.lua takes over.
-- if vim.g.theme_id == nil then
-- 	vim.cmd.colorscheme("wildcharm")
-- end
