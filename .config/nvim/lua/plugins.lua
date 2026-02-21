return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Vim lua support
    use { 'nvim-lua/plenary.nvim' }

    -- Vim theme
    use { 'ellisonleao/gruvbox.nvim' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Ui-select
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    -- Text based search
    use { 'BurntSushi/ripgrep' }

    -- The primeagen harpoon
    use {
        'ThePrimeagen/harpoon',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Auto commenter
    use { 'preservim/nerdcommenter' }

    -- Syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Treesitter context function wrap
    use("nvim-treesitter/nvim-treesitter-context");

    -- Undotree
    use { 'mbbill/undotree' }

    -- Web development
    use { 'mattn/emmet-vim' }
    use { 'sirver/ultisnips' }

    -- Latex development
    use { 'lervag/vimtex' }
    use { 'ckunte/latex-snippets-vim', tag = '*' }

    -- web dev icons
    use { 'nvim-tree/nvim-web-devicons' }

    -- Obsidian integration plugin
    use { 'epwalsh/obsidian.nvim', tag = '*', requires = { 'nvim-lua/plenary.nvim' } }

    -- fzf replacement for telescope
    use { "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } }

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Auto completion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

        }
    })

    -- Start screen with session management
    use { 'mhinz/vim-startify' }

    -- Lazygit integration
    use({
        "kdheepak/lazygit.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    })

    --use({ 'github/copilot.vim' })

    use({ 'preservim/nerdtree' })

    use({ 'ryanoasis/vim-devicons' })
end)
