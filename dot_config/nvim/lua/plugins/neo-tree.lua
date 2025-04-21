-- 📁 File explorer setup using Neo-tree

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- Use stable v3 version

	-- 🔗 Required dependencies
	dependencies = {
    "nvim-lua/plenary.nvim",        -- Utility functions
    "nvim-tree/nvim-web-devicons",  -- Optional: file type icons
    "MunifTanjim/nui.nvim",         -- UI components
	},

	lazy = false, -- Load on startup

	-- Optional: define options here if using opts = {} method
	opts = {},

	config = function()
		-- 🧩 Initialize neo-tree with default configuration
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
          hide_dotfiles = false,      -- Show dotfiles (e.g., .env)
          hide_gitignored = false,    -- Show files even if in .gitignore
          hide_hidden = false,        -- Show hidden files like (5 hidden items)
				},
			},
		})

		-- 🪟 Keymap: Always open Neo-tree file explorer on the left
		-- Note: This is not a toggle. It will always open (even if already open).
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {
			desc = "Reveal Neo-tree (left)",
		})
	end,
}
