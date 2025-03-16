return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    lazy = true,  -- Ensure lazy loading
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "Start/Continue Debugging" },
        { "<S-F5>", function() require("dap").terminate() end, desc = "Stop Debugging" },
        { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<S-F9>", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Set Conditional Breakpoint" },
        { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
        { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
        { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>dR", function() require("dap").restart() end, desc = "Restart Debugging" },
        { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
        { "<leader>ds", function() require("dapui").open() end, desc = "Open Debugger" },
        { "<leader>dv", function() require("dapui").eval() end, desc = "Evaluate Expression" },
        { "<leader>dr", function() require("dap").repl.open() end, desc = "Open Debug Console" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()  -- Set up UI only when first loaded

        -- Automatically open/close UI
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
}
