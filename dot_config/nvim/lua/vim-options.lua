-- 🧰 Vim/Neovim Global Options Configuration

-- 🔢 Indentation settings
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.tabstop = 2            -- A tab is 2 spaces
vim.opt.softtabstop = 2        -- Spaces inserted when pressing <Tab>
vim.opt.shiftwidth = 2         -- Indent width for autoindents

-- 🌈 Visual Enhancements
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.signcolumn = "yes"     -- Always show the sign column
vim.opt.scrolloff = 5          -- Minimum lines to keep above/below cursor
vim.opt.wrap = true            -- Wrap long lines (disable with `false` if preferred)

-- 🔍 Search Behavior
vim.opt.ignorecase = true      -- Case-insensitive search by default
vim.opt.smartcase = true       -- Override if search contains uppercase
vim.opt.incsearch = true       -- Show matches while typing
vim.opt.hlsearch = true        -- Highlight all search matches

-- 📜 UI & Interaction
vim.opt.wildmenu = true                          -- Enhanced command-line completion
vim.opt.backspace = { "indent", "eol", "start" } -- Make backspace behave intuitively
vim.opt.mouse = "a"                              -- Enable mouse support
vim.opt.updatetime = 300                         -- Faster CursorHold (used by plugins like GitSigns)

-- 📋 Clipboard
-- NOTE: clipboard keymaps are used instead of enabling unnamedplus globally
-- vim.opt.clipboard = "unnamedplus"             -- Use system clipboard for all yanks/pastes

-- ⌨️ Leader key
vim.g.mapleader = " "                            -- Use space as the leader key

-- 🔁 Pane navigation with <C-h/j/k/l>
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- 🖱️ Clipboard keymaps (preferred over global clipboard setting)
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from system clipboard" })

-- 🧪 Optional settings (enabled)
-- vim.opt.nowrap = false          -- Set to `true` if you prefer wrapping; `false` for no wrapping
-- vim.opt.swapfile = false        -- Disable swap file creation
-- vim.opt.spell = false           -- Enable if working with text-heavy files; false by default
