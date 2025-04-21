-- 📦 Visual keybinding helper plugin
return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lazy-load after startup
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,        -- Show buffer marks on `'` or `` `
        registers = true,    -- Show registers on `"`, `<C-r>`
        spelling = {
          enabled = true,    -- Enable spelling suggestions
          suggestions = 20,
        },
        presets = {
          operators = true,  -- Add help for operators like `d`, `y`, etc.
          motions = true,    -- Add help for motions
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      windows = {
        border = "rounded",       -- Rounded borders
        position = "bottom",      -- Popup position
        margin = { 1, 0, 1, 0 },  -- Top/bottom margin
        padding = { 1, 2, 1, 2 }, -- Inner padding
      },
      layout = {
        spacing = 6,  -- Spacing between columns
        align = "left",
      },
      show_help = true,
      show_keys = true,
    })

    -- 🧭 Optional keybinding to trigger which-key manually
    vim.keymap.set("n", "<Leader>?", function()
      require("which-key").show({
        keys = "<c-w>",
        loop = true,  -- this will keep the popup open until you hit <esc>
      })
    end, { desc = "Show WhichKey Popup" })
  end,
}
