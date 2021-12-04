require('packer').startup(function()
	use 'wbthomason/packer.nvim'

  -- Syntax highlight
  use 'arcticicestudio/nord-vim'
  use 'mhartington/oceanic-next'
  use 'sainnhe/everforest'
  use {'nvim-treesitter/nvim-treesitter',
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
  }

  -- Autocompletion/LSP
  
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'windwp/nvim-autopairs'

  -- Statusline

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
}

-- Which key
use {"folke/which-key.nvim",}

-- Movement
use {'phaazon/hop.nvim',
  branch = 'v1', -- optional but strongly recommended
}
-- Add backet lines
use {"lukas-reineke/indent-blankline.nvim"}


end)  -- end packer startup


require('lualine').setup{
  options = {theme = 'nord'},
}

vim.opt.list = false
