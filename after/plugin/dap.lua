local dap = require("dap")

vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end)

-- Dart / Flutter
dap.adapters.dart = {
    type = 'executable',
    command = 'dart',
    args = { 'debug_adapter' }
}
dap.adapters.flutter = {
    type = 'executable',
    command = 'flutter',
    args = { 'debug_adapter' }
}
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart",
        flutterSdkPath = "/opt/flutter/bin/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    },
    {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart",
        flutterSdkPath = "/opt/flutter/bin/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    }
}

-- Go
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

-- C / C++
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = 'codelldb',
        args = { "--port", "${port}" },
    }
}
dap.configurations.c = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
    },
    {
        name = "Debug using Make & Debug binary",
        type = "codelldb",
        request = "launch",
        program = function()
            os.execute("make debug")
            return "${workspaceFolder}/bin/debug"
        end,
        cwd = "${workspaceFolder}",
    },
}
dap.configurations.cpp = dap.configurations.c

-- Rust
dap.configurations.rust = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program =
            function()
                os.execute("cargo build -q")
                return "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
            end,
        cwd = "${workspaceFolder}",
    },
}

-- Python
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = "python",
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = "/usr/bin/python",
    },
}
