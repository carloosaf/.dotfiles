vim.g.mapleader = " " 

-- General
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true}) -- Insert -> Normal
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>w<cr>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>q<cr>', {noremap = true}) -- Write

-- Window navigation
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>.', ':Telescope file_browser<cr>', {noremap = true}) 

--Hop
vim.api.nvim_set_keymap('n', '<leader>hw', '<cmd>HopWord<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hc', '<cmd>HopChar1<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hl', '<cmd>HopLine<cr>', {noremap = true})


                   -----------------
                   --   WHICHKEY  --
                   -----------------


local wk = require('which-key')

wk.register({
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
    q = 'Quit',
    w = 'Write',
    ['.'] = 'File browser',
    h = {
        name = 'hop',
        l = {'Hop lines'},
        c = {'Hop characters'},
        w = {'Hop words'},
    },
}, {prefix = "<leader>"})
