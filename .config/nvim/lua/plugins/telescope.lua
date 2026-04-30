return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
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
					['ui-select'] = { require('telescope.themes').get_dropdown() },
				},
			})

			-- Load extensions after setup
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")

			-- Keymaps
			local map = vim.keymap.set
			local builtin = require("telescope.builtin")
			-- Files
			map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			-- Search
			map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			-- LSP (very useful for C)
			map("n", "<leader>ss", builtin.lsp_document_symbols,  { desc = "Document symbols" })
			map("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
			map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			map("n", "gr", builtin.lsp_references, { desc = "LSP references" })
			-- Git
			map("n", "<leader>gf", builtin.git_files,  { desc = "[G]it [F]iles" })
			map("n", "<leader>gc", builtin.git_commits,  { desc = "[G]it [C]ommits" })
			map("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
			map("n", "<leader>gs", builtin.git_status,   { desc = "[G]it [S]tatus" })
			-- Meta
			map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			map("n", "<leader>sc", builtin.colorscheme,  { desc = "[S]earch [C]olorschemes" })
			-- Telescope
			map("n", "<leader>st", builtin.builtin, { desc = "[S]earch Select [T]elescope" })
			map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		end,
	},
}
