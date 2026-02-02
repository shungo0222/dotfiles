-- 🧠 Language Server Protocol (LSP) Setup
-- Updated for Neovim 0.11+ using vim.lsp.config API

return {
  -- 📦 Mason: LSP/DAP/Formatter installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- 🔗 Bridge between Mason and lspconfig (for auto-installation)
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },

  -- 🧠 LSP config data (provides server configurations)
  -- Note: In Neovim 0.11+, nvim-lspconfig is purely "data" for vim.lsp.config
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

      -- 🔧 Global on_attach: Set keymaps when any LSP server attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = function(desc)
            return { buffer = bufnr, desc = desc }
          end

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("LSP: Hover Documentation"))
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP: Go to Definition"))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("LSP: References"))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("LSP: Implementation"))
          vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts("LSP: Code Action"))
          vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts("LSP: Rename"))
          vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts("LSP: Show Diagnostics"))
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("LSP: Previous Diagnostic"))
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("LSP: Next Diagnostic"))
        end,
      })

      -- 🌐 Global LSP config (applies to all servers)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- 🧠 Configure and enable Lua language server
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- ⚙️ Configure TypeScript language server
      vim.lsp.config("ts_ls", {})

      -- 🚀 Enable configured LSP servers
      vim.lsp.enable({ "lua_ls", "ts_ls" })
    end,
  },
}
