vim.g.mapleader = [[ ]]

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
require('lazy').setup('plugins', {
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'matchparen',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'netrw',
            },
        },
    },
})

require('canand')
