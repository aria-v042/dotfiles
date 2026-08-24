-- ============
-- Key mappings
-- ============

-- Exit Insert mode with 'jj'
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert mode with 'jj'" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
--vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
--vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", ":bprevious<CR>", { desc = "Previous buffer" })

-- Window navigation & resizing
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Delete without overwriting register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n" }, "<leader>D", '"_D', { desc = "Delete until the end of line without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete without yanking" })

-- Paste from clipboard
vim.keymap.set("x", "<leader>p", "\"+p", { desc = "Paste from clipboard" })
vim.keymap.set("x", "<leader>P", "\"+P", { desc = "Paste from clipboard without yanking" })

-- Yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- File navigation
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Diagnostic
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
