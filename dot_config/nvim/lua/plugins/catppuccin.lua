-- 🎨 Colorscheme configuration using Catppuccin

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- Load on startup (not lazy-loaded)
	priority = 1000, -- Load before other plugins for consistent theming

	config = function()
		-- 🧁 Setup with desired flavour (latte, frappe, macchiato, mocha)
		require("catppuccin").setup({
			flavour = "macchiato", -- Choose your favorite flavour
		})

		-- 🌈 Apply the colorscheme
		vim.cmd.colorscheme("catppuccin")
	end,
}
