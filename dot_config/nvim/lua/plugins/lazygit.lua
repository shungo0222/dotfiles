-- 📦 Plugin: lazygit.nvim (Git TUI integration)
return {
  "kdheepak/lazygit.nvim",

  -- Required dependency
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- Keymap to trigger LazyGit
  config = function()
    -- 🧠 Keybinding: <Leader>lg to open LazyGit interface
    vim.keymap.set("n", "<Leader>lg", "<cmd>LazyGit<CR>", { desc = "Git: Open LazyGit" })
  end,
}
