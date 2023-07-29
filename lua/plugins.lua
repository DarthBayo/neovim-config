-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'dracula/vim', as = 'dracula'}

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'editorconfig/editorconfig-vim'

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup(require('configs.indent-blankline'))
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup(require('configs.treesitter'))
        end,
        run = ':TSUpdate'
    }
end)
