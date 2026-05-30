return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
	---Max header size (not recommended change).
	--length = 80,
	---Header margin (not recommended change).
	--margin = 5,
	default_map = true, -- Default mapping <F1> in normal mode.
	auto_update = true, -- Update header when saving.
	user = "frodrig2", -- Your user.
	mail = "frodrig2@students.42porto.com", -- Your mail.
	-- add other options.
  },
  init = function()
    vim.g.user = "frodrig2"
    vim.g.mail = "frodrig2@students.42porto.com"
  end,
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
