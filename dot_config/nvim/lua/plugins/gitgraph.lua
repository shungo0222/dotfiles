-- 📦 Git Graph Viewer for Neovim
return {
  "isakbm/gitgraph.nvim",

  -- 🔗 Required for diff comparison integration
  dependencies = {
    "sindrets/diffview.nvim",
  },

  -- ⚙️ Plugin configuration
  config = function()
    require("gitgraph").setup({
      -- 🔣 Customize visual symbols for commits
      symbols = {
        merge_commit = "M", -- Symbol for merge commits
        commit = "*",       -- Symbol for regular commits
      },

      -- 🕒 Configure commit metadata display
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",           -- Date format
        fields = { "hash", "timestamp", "author", "branch_name", "tag" }, -- Fields to show
      },

      -- 🔁 Hook actions for diff inspection
      hooks = {
        on_select_commit = function(commit)
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!") -- Open diff for single commit
        end,
        on_select_range_commit = function(from, to)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash) -- Diff between range
        end,
      },
    })

    -- 🧠 Keybinding: <Leader>gl to draw the full git graph
    vim.keymap.set("n", "<Leader>gl", function()
      require("gitgraph").draw({}, { all = true, max_count = 5000 })
    end, { desc = "Git: Show Commit Graph" })
  end,
}
