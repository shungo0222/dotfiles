-- 📊 Statusline configuration using lualine.nvim

return {
  "nvim-lualine/lualine.nvim",

  -- Optional: for file type icons in the statusline
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("lualine").setup({
      options = {
        theme = "solarized_dark", -- You can change this to "catppuccin", "gruvbox", etc.
      },
    })
  end,
}
