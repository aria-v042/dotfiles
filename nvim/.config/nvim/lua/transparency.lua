-- ==============
--  Transparency
-- ==============

-- Diagnostics:
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	desc = "Force transparent background on every highlight group",
-- 	callback = function()
-- 		local highlights = vim.api.nvim_get_hl(0, { link = false })
-- 		local processed, failed = 0, 0
-- 		for name, hl in pairs(highlights) do
-- 			if hl.bg or hl.ctermbg then
-- 				local new_hl = vim.tbl_extend("force", {}, hl)
-- 				new_hl.bg = nil
-- 				new_hl.ctermbg = nil
-- 				new_hl.default = nil
-- 				local ok, err = pcall(vim.api.nvim_set_hl, 0, name, new_hl)
-- 				if ok then
-- 					processed = processed + 1
-- 				else
-- 					failed = failed + 1
-- 					vim.notify("transparency: failed on '" .. name .. "': " .. tostring(err), vim.log.levels.WARN)
-- 				end
-- 			end
-- 		end
-- 		vim.notify(("transparency: cleared %d groups, %d failed"):format(processed, failed))
-- 	end,
-- })

-- Ver. 2.0 - BUGGED
-- -- Strip the background from EVERY highlight group whenever a
-- -- colorscheme loads, so transparency works regardless of which
-- -- theme Themery switches to — including extra groups (Telescope,
-- -- Pmenu, sidebars, etc.) a theme may define beyond Normal/NormalFloat.
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	desc = "Force transparent background on every highlight group",
-- 	callback = function()
-- 		local highlights = vim.api.nvim_get_hl(0, { link = false })
-- 		for name, hl in pairs(highlights) do
-- 			if hl.bg or hl.ctermbg then
-- 				hl.bg = nil
-- 				hl.ctermbg = nil
-- 				hl.default = nil
-- 				vim.api.nvim_set_hl(0, name, hl)
-- 			end
-- 		end
-- 	end,
-- })

-- Ver. 1.0 - Works except for Oxocarbon
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
