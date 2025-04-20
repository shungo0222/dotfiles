-- 🌳 Syntax highlighting & code structure parsing with Treesitter

return {
	"nvim-treesitter/nvim-treesitter",

	-- 🛠️ Auto-run :TSUpdate after install to ensure parsers are up to date
	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			-- 🔄 Automatically install missing parsers when entering a buffer
			auto_install = true,

			-- 🌈 Enable syntax highlighting powered by Treesitter
			highlight = {
				enable = true,
			},

			-- 🧾 Enable indentation based on AST (may be experimental for some languages)
			indent = {
				enable = true,
			},
		})
	end,
}
