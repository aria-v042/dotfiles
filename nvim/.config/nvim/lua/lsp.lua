-- =================
-- LSP configuration
-- =================

-- Disable LSP diagnostic features
vim.diagnostic.config({
  virtual_text = false,   -- no inline squiggly text
  signs = false,          -- no sign column icons
  underline = false,      -- no underlines
  update_in_insert = false,
})

-- ============
-- Key mappings
-- ============

local telescope_builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs,
	  { buffer = ev.buf, silent = true, desc = desc })
    end

    map("n", "gd", telescope_builtin.lsp_definitions, "Go to definition")

    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

    map("n", "gr", telescope_builtin.lsp_references, "Find references")

	-- telescope_builtin.lsp_implementations
    map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Go to implementation")

    map("n", "K", vim.lsp.buf.hover, "Hover documentation")

	map("n", "<leader>ss", telescope_builtin.lsp_document_symbols, "Document symbols")

	map("n", "<leader>sS", telescope_builtin.lsp_workspace_symbols, "Workspace symbols")

	map("n", "<leader>dd", telescope_builtin.diagnostics, "Show diagnostics")

	map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")

	-- jump to previous diagnostic in buffer
	map("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, "Go to previous diagnostic")

	-- jump to next diagnostic in buffer
	map("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, "Go to next diagnostic")

  end,
})
