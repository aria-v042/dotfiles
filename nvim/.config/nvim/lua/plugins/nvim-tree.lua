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
				--width = function()
				--	if in_buffer then
				--		return vim.o.columns
				--	end
				--	local min = 20
				--	local max = 40
				--	local padding = 1
				--	return math.max(min, math.min(max, vim.o.columns - padding))
				--end,
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
			-- expand/reveal currently opened file
			update_focused_file = {
				enable = true,
				--update_root = true,	-- update root if file is outside the current root
				ignore_list = {},
			},
		})
		vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
		--vim.keymap.set('n', '<leader>E', function()
		--	require('nvim-tree.api').tree.toggle({ current_window = true })
		--end, { desc = 'Toggle file tree in current buffer' })
	end,
}
