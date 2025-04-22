-- 🧠 Language Server Protocol (LSP) Setup

return {
  -- 📦 Mason: LSP/DAP/Formatter installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- 🔗 Bridge between Mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true, -- Automatically install configured servers
      })
    end,
  },

  -- 🧠 Core LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- ⚠️ Global diagnostic display settings
      vim.diagnostic.config({
        virtual_text = true,        -- Show inline diagnostic text
        signs = true,               -- Show signs in the gutter
        underline = true,           -- Underline problematic code
        update_in_insert = false,   -- Don't show diagnostics while typing
        severity_sort = true,       -- Sort by error/warning level
      })

      -- 🔌 LSP capabilities (used for cmp-nvim-lsp completion)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- 🔧 on_attach: Set keymaps when an LSP server attaches to a buffer
      local on_attach = function(_, bufnr)
        local opts = function (desc)
          return { buffer = bufnr, desc = desc }
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("LSP: Hover Documentation"))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP: Go to Definition"))
        vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts("LSP: Code Action"))
        vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts("LSP: Show Diagnostics"))
      end

      -- 🧠 Setup for Lua language server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ⚙️ Setup for TypeScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}
