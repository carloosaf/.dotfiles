local fn = vim.fn

-- Source of fancy functions: https://github.com/LunarVim/Neovim-from-scratch/tree/master
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}



require('packer').startup(function()
	use 'wbthomason/packer.nvim'

  -- Syntax highlight
  use 'arcticicestudio/nord-vim'
  use 'mhartington/oceanic-next'
  use 'sainnhe/everforest'
  use'rose-pine/neovim'
  use {'nvim-treesitter/nvim-treesitter'}

  -- Autocompletion/LSP
  
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'windwp/nvim-autopairs'
  use 'williamboman/nvim-lsp-installer'

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
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use {"AckslD/nvim-neoclip.lua",
     config = function()
         require('neoclip').setup()
     end
}

-- Which key
use {"folke/which-key.nvim",}

-- Movement
use {'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
}
-- Add backet lines
-- use {"lukas-reineke/indent-blankline.nvim",}

-- Commentary
 use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
}

-- Tree
use {'kyazdani42/nvim-tree.lua'}

-- Bufferline
use {'akinsho/bufferline.nvim'}
 
end)  -- end packer startup
