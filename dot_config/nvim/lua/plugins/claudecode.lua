-- ============================================================================
-- Claude Code (AI Pair Programming in Neovim)
-- ============================================================================
-- Source: https://github.com/coder/claudecode.nvim
--
-- This plugin integrates the Claude Code CLI into Neovim, providing:
--  - An embedded terminal UI for chatting with Claude
--  - Commands to send files or selections as context
--  - Diff preview with accept / deny workflow
--
-- Requirements:
--  - Neovim >= 0.8
--  - Claude Code CLI installed
--  - folke/snacks.nvim for terminal UI support
--
-- Notes:
--  - We set `claude_path` explicitly because Neovim may not inherit
--    shell PATH or aliases from your terminal environment.
-- ============================================================================

return {
	"coder/claudecode.nvim",

	-- Required for terminal UI integration
	dependencies = { "folke/snacks.nvim" },

	-- Use the plugin's default setup() automatically
	config = true,

	-- Plugin options
	opts = {
		-- Absolute path to Claude Code CLI
		claude_path = "/Users/shungo/.local/bin/claude",
	},

	-- Key mappings (all grouped under <leader>a = AI / Claude Code)
	keys = {
		-- Group label for which-key / documentation
		{ "<leader>a", nil, desc = "AI/Claude Code" },

		-- Panel control
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },

		-- Session control
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },

		-- Context feeding
		-- Add the entire current buffer to Claude's context
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },

		-- Send only the visually selected text to Claude
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },

		-- Add a file from file tree plugins without opening it
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},

		-- Diff management
		-- Accept Claude's proposed code change
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },

		-- Reject Claude's proposed code change
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
