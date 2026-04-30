
-- =======
-- Options
-- =======

-- Basic settings
vim.opt.number = true					-- Line numbers
vim.opt.relativenumber = true			-- Relative line numbers
vim.opt.cursorline = true				-- Highlight current line
--vim.opt.wrap = false					-- Don't wrap lines
vim.opt.scrolloff = 10					-- Keep 10 lines above/below cursor  to clipboard
vim.opt.sidescrolloff = 8				-- Keep 8 columns left/right of cursor

-- Indentation - follow 42 Norm
vim.opt.tabstop = 4						-- Tab width
vim.opt.softtabstop = 4					-- Soft tab stop
vim.opt.shiftwidth = 4					-- Indent width
vim.opt.expandtab = false				-- Use spaces instead of tabs
vim.opt.smartindent = true				-- Smart auto-indenting
vim.opt.autoindent = true				-- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true				-- Case insensitive search
vim.opt.smartcase = true				-- Case sensitive if uppercase in search
vim.opt.hlsearch = true					-- Highlight search results 
vim.opt.incsearch = true				-- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true			-- Enable 24-bit colors
vim.opt.signcolumn = "yes"				-- Always show sign column
vim.opt.colorcolumn = "80"				-- Show column at 100 characters
vim.opt.showmatch = true				-- Highlight matching brackets
vim.opt.matchtime = 2					-- How long to show matching bracket
vim.opt.cmdheight = 1					-- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"	-- Completion options 
--vim.opt.showmode = false				-- Don't show mode in command line 
vim.opt.pumheight = 10					-- Popup menu height 
vim.opt.pumblend = 10					-- Popup menu transparency 
vim.opt.winblend = 0					-- Floating window transparency 
vim.opt.conceallevel = 0				-- Don't hide markup 
vim.opt.concealcursor = ""				-- Don't hide cursor line markup 
vim.opt.lazyredraw = true				-- Don't redraw during macros
vim.opt.synmaxcol = 300					-- Syntax highlighting limit 
vim.opt.fillchars = { eob = " " }		-- Hide ~ on empty lines

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- File handling
vim.opt.backup = false					-- Don't create backup files
vim.opt.writebackup = false				-- Don't create backup before writing
vim.opt.swapfile = false				-- Don't create swap files
vim.opt.undofile = false				-- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")	-- Undo directory
vim.opt.updatetime = 300				-- Faster completion
vim.opt.timeoutlen = 500				-- Key timeout duration
vim.opt.ttimeoutlen = 10				-- Key code timeout
vim.opt.autowrite = false				-- Don't auto save
vim.opt.autoread = true					-- Auto reload files changed outside vim

-- Behavior settings
vim.opt.hidden = true					-- Allow hidden buffers
vim.opt.errorbells = false				-- No error bells
vim.opt.backspace = "indent,eol,start"	-- Better backspace behavior
vim.opt.autochdir = false				-- Don't auto change directory
vim.opt.path:append("**")				-- include subdirectories in search
vim.opt.selection = "exclusive"			-- Selection behavior
vim.opt.mouse = "a"						-- Enable mouse support
--vim.opt.clipboard:append("unnamedplus")	-- Use system clipboard
vim.opt.modifiable = true				-- Allow buffer modifications

vim.opt.encoding = "UTF-8"				-- Set encoding
-- Folding settings
vim.opt.foldmethod = "expr"				-- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"	-- Use treesitter for folding
vim.opt.foldlevel = 99					-- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true				-- Horizontal splits go below
vim.opt.splitright = true				-- Vertical splits go right

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000				-- Max time for syntax highlighting
vim.opt.maxmempattern = 20000			-- Increase memory nvim can use for regex

-- Make indentation markers more subtle
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a2a" })  -- dim inactive lines
vim.api.nvim_set_hl(0, "IblScope",  { fg = "#565656" })  -- slightly brighter for current scope

-- ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

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
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete without yanking" })

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", "\"+p", { desc = "Paste from selection" })
vim.keymap.set("x", "<leader>P", "\"+P", { desc = "Paste from selection without yanking" })

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

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })

-- Diagnostic
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
