local dap = require('dap')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<F10>', dap.step_over, opts)
vim.keymap.set('n', '<F11>', dap.step_into, opts)
