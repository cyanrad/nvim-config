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
    --
    -- rose
    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    --
    -- poimandres
    -- use {
    --     'olivercederborg/poimandres.nvim',
    --     config = function()
    --         require('poimandres').setup {}
    --     end
    -- }
    --
    -- gruvbox
    use { "ellisonleao/gruvbox.nvim" }


    -- code tree parser
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' });
    use("nvim-treesitter/nvim-treesitter-context");


    -- the BEST file nav
    use('theprimeagen/harpoon')

    -- git
    use('tpope/vim-fugitive')
    -- git branches
    use('sodapopcan/vim-twiggy')

    -- surround for stuff like {, (, "
    use('tpope/vim-surround')

    -- commenting support
    use('tpope/vim-commentary')

    -- file history tree
    use('mbbill/undotree')

    -- additional go support
    use('fatih/vim-go')

    -- lsp zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- (not sure, but i think this is the lsp backend plugin)
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
