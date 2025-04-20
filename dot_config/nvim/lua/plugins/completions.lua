-- ⚙️ Autocompletion & Snippet Configuration

return {
  -- 🌐 LSP completion source for nvim-cmp
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  -- ✂️ LuaSnip (snippet engine) and its sources
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",  -- Snippet source for nvim-cmp
      "rafamadriz/friendly-snippets", -- Predefined snippets
    },
  },

  -- 🤖 Main autocompletion engine
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load() -- Load vscode-style snippets

      cmp.setup({
        -- ✨ Snippet expansion
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        -- 🪟 UI configuration for completion/documentation
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- ⌨️ Key mappings for completion behavior
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection (default to first)
        }),

        -- 🔌 Completion sources
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Enable when LSP source is needed
          { name = "luasnip" },
        }, {
          { name = "buffer" }, -- Fallback to buffer content
        }),
      })
    end,
  },
}
