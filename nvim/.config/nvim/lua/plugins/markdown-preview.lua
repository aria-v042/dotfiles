-- This plugin requires having Node.js and npm installed 
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
	  -- set to 1, nvim will open the preview window after entering the Markdown buffer
	  -- default: 0
	  vim.g.mkdp_auto_start = 1

	  -- set to 1, the nvim will auto close current preview window when changing
	  -- from Markdown buffer to another buffer
	  -- default: 1
	  vim.g.mkdp_auto_close = 1
	  
	  -- keybinds:
	  vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", { desc = "Toggle Markdown Preview"})
  end,
}
