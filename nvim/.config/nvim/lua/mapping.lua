local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- :tnoremap <Esc> <C-\><C-n>

-- General
keymap('i', 'jk', '<Esc>', opts) -- Insert -> Normal
keymap('n', '<leader>w', '<cmd>w<cr>', opts) -- Write
keymap('n', '<leader>q', '<cmd>q<cr>', opts) -- Quit
keymap('n', '<leader>fm', '<cmd>make<cr>', opts) -- Quit

-- Window navigation
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)

-- Window resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('n', '<leader>tt', ':TodoTelescope<cr>', opts)


-- Move (Hop)
keymap('n', '<leader>mw', '<cmd>HopWord<cr>', opts)
keymap('n', '<leader>mc', '<cmd>HopChar1<cr>', opts)
keymap('n', '<leader>ml', '<cmd>HopLine<cr>', opts)

-- Tree
keymap('n', '<leader>.', ':NvimTreeToggle<cr>', opts)

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-d>", ":bdelete<CR>", opts)

-- Lspsaga
keymap("n", "gr", ":Lspsaga rename<CR>", opts)
keymap("n", "gx", ":Lspsaga code_action<CR>", opts)
keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
keymap("n", "go", ":Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "gj", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "gk", ":Lspsaga diagnostic_jump_prev<CR>", opts)

--Git
keymap('n', '<leader>gic', ':Telescope git_commits<cr>', opts)
keymap('n', '<leader>gib', ':Telescope git_branches<cr>', opts)
keymap('n', '<leader>gis', ':Telescope git_status<cr>', opts)
keymap('n', '<leader>gij', ':Gitsings prev_hunk<cr>', opts)
keymap('n', '<leader>gik', ':Gitsings next_hunk<cr>', opts)
keymap('n', '<leader>gid', ':Gitsings diffthis<cr>', opts)
keymap('n', '<leader>gir', ':Gitsings reset_hunk<cr>', opts)

                   -----------------
                   --   WHICHKEY  --
                   -----------------

require('which-key').register({
    h = 'Window left',
    j = 'Window down',
    k = 'Window up',
    l = 'Window right',
    q = 'Quit',
    w = 'Write',
    ['.'] = 'File browser',
    f = {
        name = 'file',
        f = 'Find files',
        m = 'Make',
        b = 'Buffer fuzzy find'
    },
    t = {
         name = 'telescope',
         t = 'To-Dos',
    },
    m = {
        name = 'Move (hop)',
        l = {'Move lines'},
        c = {'Move characters'},
        w = {'Move words'},
    },
    gi = {
        name = 'git',
        s = 'Git status',
        b = 'Git branches',
        c = 'Git commits',
        j = 'Next hunk',
        k = 'Previous hunk',
        d = 'Diff',
        r = 'Reset',
    }
},
    {prefix = "<leader>"})
