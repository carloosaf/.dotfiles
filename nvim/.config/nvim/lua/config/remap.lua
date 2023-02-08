vim.g.mapleader = " "

--Basic
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

--Window navigation
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Window resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>tt', ':TodoTelescope<cr>')

-- Tree
vim.keymap.set('n', '<leader>.', ':NvimTreeToggle<cr>')

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-d>", ":bdelete<CR>")

--Git
vim.keymap.set('n', '<leader>gic', ':Telescope git_commits<cr>')
vim.keymap.set('n', '<leader>gib', ':Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>gis', ':Telescope git_status<cr>')
vim.keymap.set('n', '<leader>gij', ':Gitsigns prev_hunk<cr>')
vim.keymap.set('n', '<leader>gik', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>gid', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>gir', ':Gitsigns reset_hunk<cr>')

-- Trouble 
vim.keymap.set('n', '<leader>d', ':TroubleToggle document_diagnostics<cr>')



