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
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    -- Autocompletion/LSP

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'windwp/nvim-autopairs'
    use 'tami5/lspsaga.nvim'
    use 'williamboman/mason.nvim'
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'onsails/lspkind.nvim' 

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

    -- Mappings hints
    use {"folke/which-key.nvim",}

    -- Movement
    use {'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end,
    }

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

    --Greeter
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    -- Faster loading plugins
    use 'lewis6991/impatient.nvim'

    -- Toggleterm
    use {"akinsho/toggleterm.nvim"}

    -- Highlight TODOs -- Lua
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }


    -- Git functionalities
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

end)  -- end packer startup
