require('copilot').setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            accept = '<M-y>',
        },
    },
    panel = { enabled = false },
    filetypes = {
        python = false,
    },
})
