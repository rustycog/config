-- Configurations for plugins management
-- v0.1
-- Referenced from chris@machine
-- 2022-05-25

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim ..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever save plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Proteced call to packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "packer loading error!"
    return
end

-- Have Packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Plugins housekeeping
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    
    -- Plugins go here
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'akinsho/bufferline.nvim'
    use 'moll/vim-bbye'
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'


    -- color schemes
    use 'w0ng/vim-hybrid'
    use 'sainnhe/everforest'
    use 'sainnhe/gruvbox-material'
    use 'morhetz/gruvbox'
    use 'NLKNguyen/papercolor-theme'
    use 'joshdick/onedark.vim'
    use 'tomasiser/vim-code-dark'
    -- color schemes

    -- Auto completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'windwp/nvim-autopairs'
--    use 'numToStr/Comment.nvim'

    -- Snip engine
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    -- Tree-sitter
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }
 --   use 'JoosepAlviste/nvim-ts-context-commentstring'
    
    if packer_bootstrap then
        require('packer').sync()
    end
end)


