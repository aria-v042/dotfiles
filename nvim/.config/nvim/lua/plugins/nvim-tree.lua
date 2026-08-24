return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()

		local in_buffer = false

		require('nvim-tree').setup({
			view = {
				adaptive_size = true,
				width = {
					min = 20,
					max = 40,
					padding = 1,
				},
			},
			renderer = { group_empty = true },
			filters = {
				dotfiles = false,		-- show dotfiles ('H' to hide)
				git_ignored = false,	-- show git ignored files ('I' to hide)
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,		-- expand/reveal currently opened file
				--update_root = true,	-- update root if file is outside the current root
			},
		})
		vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
	end,
}
