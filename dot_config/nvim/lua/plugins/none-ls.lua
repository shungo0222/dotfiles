-- 🧹 Formatter & Linter integration using none-ls (formerly null-ls)

return {
  "nvimtools/none-ls.nvim",

  config = function()
    local null_ls = require("null-ls")

    -- 🔧 Setup null-ls with selected sources (formatters only)
    -- Note: For linting (eslint), install it locally in each project
    null_ls.setup({
      sources = {
        -- 🖋️ Formatters
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.prettier, -- JS/TS/HTML/CSS
      },
    })

    -- 🧼 Format buffer using LSP (via null-ls)
    vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format current file" })
  end,
}
