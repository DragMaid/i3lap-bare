-- vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	-- Mutiline selection 
	use { 'mg979/vim-visual-multi', branch = 'master' }

	-- Vim lua support
	use { 'nvim-lua/plenary.nvim' }

	-- Vim theme
	use { 'rebelot/kanagawa.nvim' }
	use { 'ellisonleao/gruvbox.nvim' }

	-- File Search-engine
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Ui-select
	use { 'nvim-telescope/telescope-ui-select.nvim' }

	-- Text based search
	use { 'BurntSushi/ripgrep' }

	-- The primeagen harpoon
	use {
		'ThePrimeagen/harpoon',
		requires = { {'nvim-lua/plenary.nvim'} }
	}	

	-- Auto commenter
	use { 'preservim/nerdcommenter' }

	-- Panel rezise
	use { 'zhaocai/GoldenView.Vim' }

	-- Syntax highlighting
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Undotree
	use { 'mbbill/undotree' }

    -- Surround plugin
    use { 'tpope/vim-surround' }

    -- Web development
    use { 'mattn/emmet-vim' }
end)
