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

    -- lsp stuff
    use {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function(_, opts)
            require('mason').setup(require('configs.mason'))

            -- custom nvchad cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})
        end,
        run = ':MasonUpdate'
    }

    use {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    }

    -- Load luasnips + cmp related in insert mode only
    use {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            require('cmp').setup(require('configs.cmp'))

            -- snippet plugin
            use {
                'L3MON4D3/LuaSnip',
                requires = 'rafamadriz/friendly-snippets',
                opt = true,
                config = function()
                    require("configs.luasnip").config(opts)
                end,
            }

            -- autopairing of (){}[] etc
            use {
                'windwp/nvim-autopairs',
                config = function()
                    require("nvim-autopairs").setup({
                        fast_wrap = {},
                        disable_filetype = { 'TelescopePrompt', 'vim' },
                    })

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            }

            -- cmp sources plugins
            use {
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
            }
        end,
    }
end)
