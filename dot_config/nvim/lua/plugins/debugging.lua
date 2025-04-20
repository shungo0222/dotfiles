-- 🐞 Debugging setup using nvim-dap and dap-ui
-- Base configuration is set, but no language-specific adapters are defined yet.
-- This provides a ready-to-extend foundation for future debugging.

return {
  -- 🔧 Core Debug Adapter Protocol (DAP) plugin
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- 🔴 Set breakpoint
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

      -- ▶️ Start/continue debugging
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
    end,
  },

  -- 🖼️ UI overlay for DAP
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- Required for async UI behavior
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ⚙️ Initialize dap-ui
      dapui.setup()

      -- 🔁 Automatically open/close UI with DAP lifecycle
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
