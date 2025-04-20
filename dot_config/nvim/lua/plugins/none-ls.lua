-- 🧹 Formatter & Linter integration using none-ls (formerly null-ls)

return {
  "nvimtools/none-ls.nvim",

  -- 🔗 Optional plugin: adds extra diagnostics/formatters like eslint
  dependencies = { "nvimtools/none-ls-extras.nvim" },

  config = function()
    local null_ls = require("null-ls")

    -- 🔧 Setup null-ls with selected sources (formatters / linters)
    null_ls.setup({
      sources = {
        -- 🔍 Linting (external from none-ls-extras)
        require("none-ls.diagnostics.eslint"),

        -- 🖋️ Formatters
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.prettier, -- JS/TS/HTML/CSS
      },
    })

    -- 🧼 Format buffer using LSP (via null-ls)
    vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format current file" })
  end,
}
