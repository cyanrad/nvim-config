vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- the package manager
    use 'wbthomason/packer.nvim'

    -- fuzzy file finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- color theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- code tree parser
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' });

    -- the BEST file nav
    use('theprimeagen/harpoon')

    -- git
    use('tpope/vim-fugitive')

    -- file history tree
    use('mbbill/undotree')

    -- lsp zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { -- (not sure, but i think this is the lsp backend plugin)
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }
end)
