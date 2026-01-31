return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "niuiic/dap-utils.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local utils = require("dap.utils")

            dapui.setup()

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

            dap.adapters = {
                ["pwa-node"] = {
                    type = "server",
                    port = "${port}",
                    executable = {
                        command = "js-debug-adapter",
                        args = {
                            "${port}",
                        },
                    },
                },
            }

            dap.configurations["typescript"] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch dev file",
                    runtimeExecutable = "npm",
                    runtimeArgs = { "run", "dev" },
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach to process ID",
                    processId = utils.pick_process,
                    cwd = "${workspaceFolder}",
                },
            }

            vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", dap.continue, {})
            vim.keymap.set("n", "<leader>ds", dap.step_over, {})
            vim.keymap.set("n", "<leader>di", dap.step_into, {})
        end,
    },
}
