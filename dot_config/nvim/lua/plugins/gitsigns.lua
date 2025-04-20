-- 📦 Git Change Signs (Inline Git integration)
return {
  "lewis6991/gitsigns.nvim",

  config = function()
    require("gitsigns").setup({
      -- 🔍 Visual indicators in the sign column
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },

      -- 🧭 Keymap style navigation through hunks
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- 🧭 Navigate between hunks
        map("n", "]c", gs.next_hunk, "Next Git Hunk")
        map("n", "[c", gs.prev_hunk, "Previous Git Hunk")

        -- 👀 Preview & Blame
        map("n", "<leader>gp", gs.preview_hunk, "Preview Git Hunk")
        map("n", "<leader>gb", gs.blame_line, "Git Blame Line")

        -- 🔧 Stage / Reset
        map("n", "<leader>gs", gs.stage_hunk, "Stage Git Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset Git Hunk")
      end,
    })
  end,
}
