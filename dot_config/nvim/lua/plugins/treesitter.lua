-- 🌳 Syntax highlighting & code structure parsing with Treesitter
-- Updated for Neovim 0.11+ (nvim-treesitter rewrite removes configs module)

return {
	"nvim-treesitter/nvim-treesitter",

	-- 🔒 Treesitter should not be lazy-loaded
	lazy = false,

	-- 🛠️ Auto-run :TSUpdate after install to ensure parsers are up to date
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")

		-- 📦 Setup treesitter (new API in 2025+ rewrite)
		treesitter.setup()

		-- 📋 Define languages to install parsers for
		local languages = {
			"lua", "vim", "vimdoc", "query",
			"javascript", "typescript", "tsx",
			"python", "go", "rust",
			"html", "css", "json", "yaml", "toml",
			"markdown", "markdown_inline",
			"bash", "regex",
			"gitcommit", "gitignore", "diff",
		}

		-- 🔄 Install parsers for specified languages
		treesitter.install(languages)

		-- 🌈 Enable syntax highlighting for all filetypes with parsers
		-- Neovim 0.11+ uses vim.treesitter.start() for highlighting
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- Try to start treesitter highlighting if parser exists
				pcall(vim.treesitter.start, args.buf)
			end,
		})

		-- 🧾 Enable treesitter-based indentation
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
