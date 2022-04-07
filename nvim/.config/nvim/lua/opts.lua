vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.laststatus = 0
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true 
vim.o.updatetime = 300
vim.o.background = 'dark'
vim.o.scrolloff = 6


vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 1 
vim.wo.wrap = false

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.opt.list = false


require('rose-pine').setup({
	---@usage 'main'|'moon'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
	---@usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	}
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
