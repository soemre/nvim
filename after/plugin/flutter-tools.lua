require("flutter-tools").setup {
    debugger = {
        enabled = true,
        run_via_dap = false,
        register_configurations = function(_)
            local dap = require("dap")

            dap.adapters.flutter = {
                type = 'executable',
                command = 'flutter',
                args = { 'debug_adapter' }
            }
            dap.configurations.dart = {
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter",
                    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
                    flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                    cwd = "${workspaceFolder}",
                    toolArgs = { "-d", "linux" },
                }
            }
        end,
    }
}
