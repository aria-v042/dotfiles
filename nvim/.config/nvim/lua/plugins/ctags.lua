return {
	"wsdjeg/ctags.nvim",
	config = function()

		require("ctags").setup()

		-- update vim.o.tags options
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

		-- auto-update tags and vim.o.tags options when project root changes
		require("rooter").reg_callback(function()
			local ok, err = pcall(function()
				require("ctags").update()
				update_ctags_option()
			end)
			if not ok then
				vim.notify("ctags rooter callback failed: " .. tostring(err), vim.log.levels.ERROR)
			end
		end, "update ctags on project root change")

		-- create command and keymap to force ctags update
		vim.api.nvim_create_user_command("CtagsUpdate", function()
			require("ctags").update()
			update_ctags_option()
		end, {})
		vim.keymap.set("n", "<leader>ct", "<cmd>CtagsUpdate<cr>", 
		{ desc = "Force ctags update" })

	end,
	dependencies = { 
		"wsdjeg/job.nvim", 
		"wsdjeg/rooter.nvim", 
		"wsdjeg/logger.nvim", 
	},
}
