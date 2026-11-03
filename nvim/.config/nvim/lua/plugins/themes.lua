return {

	{	-- THEME: catpuccin
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({

				flavour = "mocha", -- auto, latte, frappe, macchiato, mocha
				
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},

				transparent_background = true, -- Don't set background color
				float = {
					transparent = true, -- Enable transparent floating windows
				},

				term_colors = false, -- Set terminal colors

				-- dim_inactive = {
				-- 	enabled = true, -- Dim background color of inactive window
				-- 	shade = "dark",
				-- 	percentage = 0.15, -- % of shade to apply to inactive window
				-- },

				no_italic = true, -- Force no italic
				
				-- Check plugin integrations:
				-- https://github.com/catppuccin/nvim#integrations
				auto_integrations = true,
			})
		end,
	},

	{	-- THEME: cyberdream
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			require("cyberdream").setup({

				-- Enable transparent background
				transparent = true,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,

				-- Apply a modern borderless look to pickers like Telescope
				borderless_pickers = false,

				-- Disable or enable colorscheme extensions
				extensions = {
					telescope = false,
					notify = true,
				},
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
		config = function ()
			require("gruvbox").setup({
				terminal_colors = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				-- dim_inactive = true,
				transparent_mode = true,
			})
		end,
	},

	{	-- THEME: monokai pro
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
				styles = {
					comment = { italic = false },
					keyword = { italic = false },
					type = { italic = false },
					storageclass = { italic = false },
					structure = { italic = false },
					parameter = { italic = false },
					annotation = { italic = false },
					tag_attribute = { italic = false },
				},
				-- classic, octagon, pro, machine, ristretto, spectrum
				filter = "spectrum",
				background_clear = {
					"toggleterm",
					"telescope",
					"renamer",
					"notify",
					"nvim-tree", -- add NvimTree
				},
			})
		end,
	},

	{	-- THEME: moonlight
		'shaunsingh/moonlight.nvim',
		lazy = false,
		priority = 1000,
		config = function()

			vim.g.moonlight_italic_comments = false
			vim.g.moonlight_italic_keywords = false
			vim.g.moonlight_italic_functions = false
			vim.g.moonlight_italic_variables = false
			vim.g.moonlight_italic_string = false
			vim.g.moonlight_contrast = true
			vim.g.moonlight_borders = false
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
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- end,
	},

	{	-- THEME: poimandres
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('poimandres').setup({
				bold_vert_split = false, -- use bold vertical separators
				dim_nc_background = true, -- dim 'non-current' window backgrounds
				disable_background = true, -- disable background
				disable_float_background = true, -- disable background for floats
				disable_italics = true, -- disable italics
			})
		end,
	},

	{	-- THEME: rose-pine
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
				-- dim_inactive_windows = true,
				extend_background_behind_borders = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
		end,
	},

	{	-- THEME: tokyonight
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				style = "night", -- moon, storm, night, day
				light_style = "day", -- Theme used with light background
				transparent = true, -- Disable setting the background color
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles ("dark", "transparent", "normal")
					sidebars = "transparent", -- Style for sidebars, see below
					floats = "transparent", -- Style for floating windows
				},
				-- dim_inactive = true, -- Dim inactive windows
			})
		end,
	},

	{	-- THEME: vscode
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({

				-- Enable transparent background
				transparent = true,

				-- Underline `@markup.link.*` variants
				underline_links = true,

				-- Disable nvim-tree background color
				disable_nvimtree_bg = true,

				-- Apply theme colors to terminal
				terminal_colors = true,

			})
		end,
	},
}
