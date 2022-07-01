require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use ({ 
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate' 
    })
end)  -- end packer startup
