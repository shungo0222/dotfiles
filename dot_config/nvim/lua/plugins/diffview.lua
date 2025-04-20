-- 📦 Git Diff Viewer with UI support
return {
  "sindrets/diffview.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",            -- Required for core functionality
    "nvim-tree/nvim-web-devicons",      -- Optional: file icons in panels
  },

  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- Enable word-level highlighting
      use_icons = true,        -- Show icons in file panel (optional)

      view = {
        merge_tool = {
          layout = "diff3_mixed",       -- 3-way mixed layout for conflict resolution
          disable_diagnostics = true,   -- Disable diagnostics while resolving
        },
      },

      hooks = {
        diff_buf_read = function(bufnr)
          -- Apply buffer-local options when a diff buffer is opened
          vim.opt_local.wrap = false
          vim.opt_local.list = false
        end,
      },
    })

    -- 🔍 Open diff view of current changes
    vim.keymap.set("n", "<Leader>gd", "<Cmd>DiffviewOpen<CR>", { desc = "Git: Open Diff View" })

    -- ❌ Close diff view
    vim.keymap.set("n", "<Leader>gq", "<Cmd>DiffviewClose<CR>", { desc = "Git: Close Diff View" })

    -- 📜 View file history of current file
    vim.keymap.set("n", "<Leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Git: File History (current file)" })

    -- 🕑 View git log of full project
    vim.keymap.set("n", "<Leader>gH", "<Cmd>DiffviewFileHistory<CR>", { desc = "Git: File History (project)" })
  end,
}
