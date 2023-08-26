-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'github/copilot.vim'
 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'mhartington/oceanic-next'
    use 'folke/tokyonight.nvim'
    use 'bluz71/vim-nightfly-colors'
    use 'rebelot/kanagawa.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'morhetz/gruvbox'
    use {
        'dracula/vim',
        as = 'dracula'
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'HiPhish/nvim-ts-rainbow2' }
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    -- use 'tpope/vim-surround'
    -- use 'tpope/vim-ragtag'
    use 'tpope/vim-vinegar'
    use 'prettier/vim-prettier'
    -- use 'tpope/vim-commentary'
    -- use 'chun-yang/auto-pairs'
    use { 'yoavbls/pretty-ts-errors' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- use 'vim-airline/vim-airline'
    -- use { 'vim-airline/vim-airline-themes' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
             {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'sveltejs/language-tools'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
      end
    }
    use { "kyazdani42/nvim-web-devicons" }
    use { 'Shougo/context_filetype.vim' }
    use { 'christoomey/vim-tmux-navigator'}
   --  use { 'chrisbra/Colorizer' }
end)
