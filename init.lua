require("mason").setup()


-- nvim-dap
--local dap_ok, dap = pcall(require, "dap")
--if not (dap_ok) then
    --print("nvim-dap not installed!")
    --return
--end
dap = require("dap")
--dap.setup()

-- Helps when configuring DAP, see logs with :DapShowLog
require('dap').set_log_level('INFO')

dap.configurations = {
    c = {
        {
            type = "cppdbg",
            name = 'Debug (cpptools)',
            request = "launch",
            cwd = '${workspaceFolder}',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            stopAtEntry = true,
            setupCommands = {  
                { 
                    text = '-enable-pretty-printing',
                    description =  'enable pretty printing',
                    ignoreFailures = false 
                },
            },
        }
    },
}

dap.adapters = {
    cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
    }
}

-- neodev.nvim
--require('neodev').setup({
    --library = {
        --plugins = {
            --'nvim-dap-ui',
        --},
        --types = true,
    --},
--})

-- nvim-dap-ui
ui = require("dapui")
ui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
    {
        elements = {
            "scopes",
        },
        size = 0.3,
        position = "right"
    },
    {
        elements = {
            "repl",
            "breakpoints"
        },
        size = 0.3,
        position = "bottom",
    },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
    dap.continue()
    ui.toggle({})
    -- Spaces buffers evenly
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) 
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<localleader>dc", dap.continue)
vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>dn", dap.step_over)
vim.keymap.set("n", "<localleader>di", dap.step_into)
vim.keymap.set("n", "<localleader>do", dap.step_out)
vim.keymap.set("n", "<localleader>dC", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
    dap.clear_breakpoints()
    ui.toggle({})
    dap.terminate()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end)


local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr})
        end,
    },
})
