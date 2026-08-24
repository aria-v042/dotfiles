-- =============
--  Colorscheme
-- =============

-- Re-apply transparency every time a colorscheme is loaded,
-- so it works regardless of which theme Themery switches to
vim.api.nvim_create_autocmd("ColorScheme", 
{
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr",		{ bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder",	{ bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator",	{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Comment",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Constant",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Special",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Identifier",	{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Statement",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "PreProc",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Type",			{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Underlined",	{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Todo",			{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "String",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Function",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Conditional",	{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Repeat",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Operator",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "Structure",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "NonText",		{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "CursorLine",	{ bg = "none" })
		-- vim.api.nvim_set_hl(0, "CursorLineNr",	{ bg = "none" })
		-- Experimental:
	end,
})

-- Fallback colorscheme for the very first launch before
-- Themery has saved a choice. After first selection,
-- Themery's block in init.lua takes over.
if vim.g.theme_id == nil then
	vim.cmd.colorscheme("wildcharm")
end
