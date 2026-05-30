return{
-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next hunk")
				map("n", "[h", gs.prev_hunk, "Previous hunk")

				-- Staging
				map("n", "<leader>hs", gs.stage_hunk,  "Stage hunk")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>hr", gs.reset_hunk,  "Reset hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage entire buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset entire buffer")

				-- Visual mode staging (stage only selected lines)
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage selected lines")

				-- Previewing
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk diff")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
				map("n", "<leader>hd", gs.diffthis, "Diff against index")
			end
		})
	end,
}
