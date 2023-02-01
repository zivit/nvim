local dap = require('dap')

if (vim.fn.has("osx") == 1) then
    dap.adapters.lldb = {
        type = 'executable',
        command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }
elseif (vim.fn.has("linux") == 1) then
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }
end

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}
--
-- If you want to use this for Rust and C, add something like this:
--
dap.configurations.c = dap.configurations.cpp

require('dap.ext.vscode').load_launchjs(nil, { cpp = { 'c', 'cpp' } })

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local dap_breakpoint = {
    error = {
        text = "🔴",
        -- texthl = "LspDiagnosticsSignError",
        -- linehl = "",
        -- numhl = "",
    },
    rejected = {
        text = "🐞",
        -- texthl = "LspDiagnosticsSignHint",
        -- linehl = "",
        -- numhl = "",
    },
    stopped = {
        text = "👉",
        -- texthl = "LspDiagnosticsSignInformation",
        -- linehl = "DiagnosticUnderlineInfo",
        -- numhl = "LspDiagnosticsSignInformation",
    },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

require("dapui").setup()
