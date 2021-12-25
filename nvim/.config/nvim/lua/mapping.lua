local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " " 

-- :tnoremap <Esc> <C-\><C-n>

-- General
keymap('i', 'jk', '<Esc>', opts) -- Insert -> Normal
keymap('n', '<leader>w', '<cmd>w<cr>', opts) -- Write
keymap('n', '<leader>q', '<cmd>q<cr>', opts) -- Quit

-- Window navigation
keymap('n', '<leader>h', '<C-w>h', opts) 
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts) 
keymap('n', '<leader>l', '<C-w>l', opts)

-- Telescope
keymap('n', '<leader>.', ':Telescope file_browser<cr>', opts) 
keymap('n', '<leader>tff', ':Telescope find_files<cr>', opts) 
keymap('n', '<leader>tn', ':Telescope neoclip<cr>', opts) 

--Hop
keymap('n', '<leader>hw', '<cmd>HopWord<cr>', opts)
keymap('n', '<leader>hc', '<cmd>HopChar1<cr>', opts)
keymap('n', '<leader>hl', '<cmd>HopLine<cr>', opts)


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
