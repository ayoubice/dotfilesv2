local dap_go_ok, dap_go = pcall(require, "dap-go")
if not dap_go_ok then
    return
end

local port = 9999

dap_go.setup {
    -- Additional dap configurations can be added.
    -- dap_configurations accepts a list of tables where each entry
    -- represents a dap configuration. For more details do:
    -- :help dap-configuration
    dap_configurations = {
        {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },

    -- delve configurations
    delve = {
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}"
    },
}


local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
    return
end

dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    return
end

dapui.setup()

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
--     {
--         type = "delve",
--         name = "Debug",
--         request = "launch",
--         program = "${file}"
--     },
--     {
--         type = "delve",
--         name = "Debug test", -- configuration for debugging test files
--         request = "launch",
--         mode = "test",
--         program = "${file}"
--     },
--     -- works with go.mod packages and sub packages
--     {
--         type = "delve",
--         name = "Debug test (go.mod)",
--         request = "launch",
--         mode = "test",
--         program = "./${relativeFileDirname}"
--     }
-- }
--

