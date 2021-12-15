vim.g.mapleader = " " 

-- General
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true}) -- Insert -> Normal
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>w<cr>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>q<cr>', {noremap = true}) -- Quit

-- Window navigation
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>.', ':Telescope file_browser<cr>', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>tff', ':Telescope find_files<cr>', {noremap = true}) 
vim.api.nvim_set_keymap('n', '<leader>tn', ':Telescope neoclip<cr>', {noremap = true}) 

--Hop
vim.api.nvim_set_keymap('n', '<leader>hw', '<cmd>HopWord<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hc', '<cmd>HopChar1<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hl', '<cmd>HopLine<cr>', {noremap = true})


                   -----------------
                   --   WHICHKEY  --
                   -----------------


require('which-key').register({
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
    q = 'Quit',
    w = 'Write',
    ['.'] = 'File browser',
    t = {
         name = 'telescope',
         ff = 'Find files',
         n = 'Neoclip',
    },
    h = {
        name = 'hop',
        l = {'Hop lines'},
        c = {'Hop characters'},
        w = {'Hop words'},
    },
},
    {prefix = "<leader>"})
