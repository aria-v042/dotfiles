return {
	"wsdjeg/ctags.nvim",
	config = function()

		require("ctags").setup()

		local function update_ctags_option()
			local project_root = vim.fn.getcwd()
			local dir = require("ctags.util").unify_path(require("ctags.config").cache_dir)
			.. require("ctags.util").path_to_fname(project_root)
			local tags = vim.tbl_filter(function(t)
				return not vim.startswith(
					t,
					require("ctags.util").unify_path(require("ctags.config").cache_dir)
				)
			end, vim.split(vim.o.tags, ","))
			table.insert(tags, dir .. "/tags")
			vim.o.tags = table.concat(tags, ",")
		end

		require("rooter").reg_callback(function()
			local ok, err = pcall(function()
				require("ctags").update()
				update_ctags_option()
			end)
			if not ok then
				vim.notify("ctags rooter callback failed: " .. tostring(err), vim.log.levels.ERROR)
			end
		end, "update ctags on project root change")

		-- claude's 1st fix -- manual root change check:

		--local last_root = nil
		--vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
		--	desc = "Regenerate ctags and update tags option when project root changes",
		--	callback = function()
		--		local root = vim.fn.getcwd()
		--		if root ~= last_root then
		--			last_root = root
		--			require("ctags").update()
		--			update_ctags_option()
		--		end
		--	end,
		--})

	end,
	dependencies = { 
		"wsdjeg/job.nvim", 
		"wsdjeg/rooter.nvim", 
		"wsdjeg/logger.nvim", 
	},
}
