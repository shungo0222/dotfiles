-- 🌳 Syntax highlighting & code structure parsing with Treesitter

return {
	"nvim-treesitter/nvim-treesitter",

	-- 🔒 Treesitter should not be lazy-loaded
	lazy = false,

	-- 🛠️ Auto-run :TSUpdate after install to ensure parsers are up to date
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			-- 📋 Languages to install parsers for
			ensure_installed = {
				"lua", "vim", "vimdoc", "query",
				"javascript", "typescript", "tsx",
				"python", "go", "rust",
				"html", "css", "json", "yaml", "toml",
				"markdown", "markdown_inline",
				"bash", "regex",
				"gitcommit", "gitignore", "diff",
			},

			-- 🔄 Auto-install missing parsers when entering buffer
			auto_install = true,

			-- 🌈 Enable syntax highlighting
			highlight = {
				enable = true,
			},

			-- 🧾 Enable treesitter-based indentation
			indent = {
				enable = true,
			},
		})
	end,
}
