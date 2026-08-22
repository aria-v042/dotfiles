return {
	"wsdjeg/rooter.nvim",
    config = function()
      require("rooter").setup({
        root_patterns = { ".git/", ".root" },	-- patterns to identify root
		outermost = true,	-- find outermost matching directory (vs. nearest)
		enable_cache = true,	-- persist project history
		project_non_root = "",	-- for files outside any project:
									-- '' = keep cwd
									-- 'home' = switch to home
									-- 'current' = switch to file's directory
		command = "lcd",
      })
    end,
}
