-- 📁 File explorer setup using Neo-tree

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- Use stable v3 version

	-- 🔗 Required dependencies
	dependencies = {
		"nvim-lua/plenary.nvim", -- Utility functions
		"nvim-tree/nvim-web-devicons", -- Optional: file type icons
		"MunifTanjim/nui.nvim", -- UI components
		-- "3rd/image.nvim", opts = {},        -- Optional: image preview support
	},

	lazy = false, -- Load on startup

	-- Optional: define options here if using opts = {} method
	opts = {},

	config = function()
		-- 🧩 Initialize neo-tree with default configuration
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
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
