-- 🔭 Telescope: Fuzzy finder & powerful file search tool

return {
	-- 🗂 Core telescope plugin
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- Pin version for stability
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for telescope
		},

		config = function()
			local builtin = require("telescope.builtin")

			-- 🔍 <C-p> to find files
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope: Find Files" })

			-- 🔎 <Leader>fg to live grep
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })

			-- 📂 List all open buffers and switch between them
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Telescope: List Buffers" })

			-- 📚 Search and open help tags (Neovim help topics)
			vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })
		end,
	},

	-- 🎛 UI enhancement: use Telescope for vim.ui.select()
	{
		"nvim-telescope/telescope-ui-select.nvim",

		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),
				},
			})

			-- 🚀 Load the ui-select extension after setup
			require("telescope").load_extension("ui-select")
		end,
	},
}
