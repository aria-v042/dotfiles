return {
	"wsdjeg/ctags.nvim",
	config = function()

		require("ctags").setup()

		-- Rewrite the plugin's built-in update-on-save
		-- to avoid indexing home and root directories
		local augroup = vim.api.nvim_create_augroup("ctags.nvim", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*",
			group = augroup,
			callback = function()
				local cwd = vim.fn.getcwd()
				if cwd == vim.env.HOME or cwd == "/" then
					return
				end
				require("ctags").update()
			end,
		})

		-- Update vim.o.tags options
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

		-- Auto-update tags and vim.o.tags options when project root changes
		require("rooter").reg_callback(function()
			-- Blocklist home and root directories
			local cwd = vim.fn.getcwd()
			if cwd == vim.env.HOME or cwd == "/" then
				return
			end
			local ok, err = pcall(function()
				require("ctags").update()
				update_ctags_option()
			end)
			if not ok then
				vim.notify("ctags rooter callback failed: " .. tostring(err), vim.log.levels.ERROR)
			end
		end, "update ctags on project root change")

		-- Create command and keymap to force ctags update
		vim.api.nvim_create_user_command("CtagsUpdate", function()
			-- Blocklist home and root directories
			local cwd = vim.fn.getcwd()
			if cwd == vim.env.HOME or cwd == "/" then
				return
			end
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
