-- 🔄 Seamless pane navigation between Neovim and tmux using <C-h/j/k/l>
-- Plugin: christoomey/vim-tmux-navigator

return {
  "christoomey/vim-tmux-navigator",
  config = function()
    -- Optional manual mappings (plugin auto-handles this, but explicit is fine)
    vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Navigate to left pane" })
    vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Navigate to below pane" })
    vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Navigate to above pane" })
    vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Navigate to right pane" })
  end,
}
