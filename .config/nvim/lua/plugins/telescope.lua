return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					-- Where results appear
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.45,
						},
						width = 0.87,
						height = 0.80,
					},

					sorting_strategy = "ascending", -- results go top-down
					prompt_prefix = "   ",
					selection_caret = "  ",

					-- Files/dirs to always ignore
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						"build/",
						"%.o",    -- C object files
						"%.a",    -- C static libs
						"%.out",  -- C compiled output
					},

					-- Keymaps inside the Telescope window
					mappings = {
						i = { -- insert mode
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<Esc>"] = actions.close,
						},
						n = { -- normal mode
							["q"] = actions.close,
						},
					},
				},

				pickers = {
					-- Customize individual pickers here
					find_files = {
						hidden = true,  -- include dotfiles
					},
					live_grep = {
						additional_args = { "--hidden" }, -- ripgrep: include hidden files
					},
					buffers = {
						sort_lastused = true,            -- MRU order
						ignore_current_buffer = true,
					},
				},

				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case", -- case-insensitive unless you use uppercase
					},
				},
			})

			-- Load the fzf extension after setup
			telescope.load_extension("fzf")
		end,
	},
}
