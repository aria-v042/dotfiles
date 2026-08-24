-- =======
-- OPTIONS
-- =======

-- Basic options --

vim.opt.number = true					-- Line numbers
vim.opt.relativenumber = true			-- Relative line numbers

vim.opt.cursorline = true				-- Highlight current line
vim.opt.cursorlineopt = "number"		-- Highlight text line and/or number

vim.opt.scrolloff = 5					-- Keep set lines above/below cursor
vim.opt.sidescrolloff = 8				-- Keep set columns left/right of cursor

vim.opt.wrap = true						-- Wrap lines
vim.opt.textwidth = 80

vim.opt.confirm = true					-- Start a dialog when a command fails


-- Behavior options --

vim.opt.mouse = "a"							-- Enable mouse support
--vim.opt.clipboard:append("unnamedplus")	-- Always use system clipboard
vim.opt.selection = "exclusive"				-- Selection behavior
vim.opt.path:append("**")					-- Search subdirectories in find commands
--vim.opt.timeoutlen = 500					-- Key timeout duration
vim.opt.ttimeoutlen = 10					-- Key code timeout


-- Indentation options --

-- 42's Norm:
vim.opt.tabstop = 4						-- Tab width
vim.opt.softtabstop = 4					-- Soft tab stop
vim.opt.shiftwidth = 4					-- Indent width
vim.opt.expandtab = false				-- Use spaces instead of tabs

vim.opt.smartindent = true				-- Smart auto-indenting
vim.opt.autoindent = true				-- Copy indent from current line


-- Search options --

vim.opt.ignorecase = true				-- Case insensitive search
vim.opt.smartcase = true				-- Case sensitive if uppercase in search
vim.opt.hlsearch = true					-- Highlight search results 
vim.opt.incsearch = true				-- Show matches as you type


-- Visual options --

vim.opt.termguicolors = true			-- Enable 24-bit colors

vim.opt.signcolumn = "yes"				-- When/how to draw sign column
--vim.opt.colorcolumn = "+1"			-- Show column at textwidth+1 characters

vim.opt.showmatch = true				-- Highlight matching brackets
vim.opt.matchtime = 2					-- How long to show matching bracket

vim.opt.completeopt = "fuzzy,menuone,noinsert,noselect"	-- Completion options 

vim.opt.cmdheight = 1					-- Command line height
vim.opt.showmode = true					-- Show mode in command line 

vim.opt.pumheight = 10					-- Popup menu height 
vim.opt.pumblend = 0					-- Popup menu transparency 
vim.opt.winblend = 0					-- Floating window transparency 

vim.opt.conceallevel = 1				-- How markup text is concealed (0=show)
vim.opt.concealcursor = ""				-- Don't hide cursor line markup 


-- File handling --

-- Create undo directory if it doesn't exist
local undodir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.undofile = true					-- Persistent undo
vim.opt.undodir = undodir				-- Set undo directory


-- Folding settings --

--vim.opt.foldmethod = "expr"				-- Use expression for folding
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"	-- Use treesitter for folding
vim.opt.foldmethod = "indent"				-- Use indentation level for folding
vim.opt.foldenable = false					-- Start with all folds open


-- Split behavior --

vim.opt.splitbelow = false				-- Set if horizontal splits go below
vim.opt.splitright = true				-- Set if vertical splits go right


-- Command-line completion --

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })


-- Better diff options --

vim.opt.diffopt:append("linematch:60")


-- Performance improvements --

vim.opt.maxmempattern = 20000			-- Increase memory nvim can use for regex
