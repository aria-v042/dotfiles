return {
	{	-- THEME: catpuccin
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				float = {
					transparent = true, -- enable transparent floating windows
				},
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				auto_integrations = true,
				-- For plugins integrations (https://github.com/catppuccin/nvim#integrations)
			})
		end,
	},
	{	-- THEME: cyberdream
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			require("cyberdream").setup({
				transparent = true	-- enable transparent background
			})
		end,
	},
    {	-- THEME: fluoromachine
		'maxmx03/fluoromachine.nvim',
		lazy = false,
		priority = 1000,
		config = function ()
			require('fluoromachine').setup({
				glow = false,
				theme = 'fluoromachine',
				transparent = true,
			})
		end,
    },
	{	-- THEME: gruvbox
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},
	{	-- THEME: kanagawa
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
	{	-- THEME: monokai pro
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	require("monokai-pro").setup({
		-- 		transparent_background = true,
		-- 	})
		-- end,
	},
	{	-- THEME: moonlight
		'shaunsingh/moonlight.nvim',
		lazy = false,
		priority = 1000,
		config = function()

			vim.g.moonlight_disable_background = true

			-- Load the colorscheme
			require("moonlight").set()
		end,
	},
	{	-- THEME: oxocarbon
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.opt.background = "dark" -- set to dark or light
		-- 	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- 	-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- end,
	},
	{	-- THEME: poimandres
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('poimandres').setup {
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
				bold_vert_split = false, -- use bold vertical separators
				dim_nc_background = true, -- dim 'non-current' window backgrounds
				disable_background = true, -- disable background
				disable_float_background = true, -- disable background for floats
				disable_italics = false, -- disable italics
			}
		end,
	},
	{	-- THEME: rose-pine
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme rose-pine")
		-- end
	},
	{	-- THEME: tokyonight
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				transparent = true, --  NOTE: set to true if you want transparent background
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})
		end,
	},
	{	-- THEME: vscode
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({

				style = "dark"

				-- -- Enable transparent background
				-- transparent = true,
				--
				-- -- Enable italic comment
				-- italic_comments = true,
				--
				-- -- Enable italic inlay type hints
				-- italic_inlayhints = true,
				--
				-- -- Underline `@markup.link.*` variants
				-- underline_links = true,
				--
				-- -- Disable nvim-tree background color
				-- disable_nvimtree_bg = true,
				--
				-- -- Apply theme colors to terminal
				-- terminal_colors = true,
				--
				-- -- Override colors (see ./lua/vscode/colors.lua)
				-- color_overrides = {
				-- 	vscLineNumber = '#FFFFFF',
				-- },
				--
				-- -- Override highlight groups (see ./lua/vscode/theme.lua)
				-- group_overrides = {
				-- 	-- this supports the same val table as vim.api.nvim_set_hl
				-- 	-- use colors from this colorscheme by requiring vscode.colors!
				-- 	Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
				-- }
			})
		end,
	},
}
