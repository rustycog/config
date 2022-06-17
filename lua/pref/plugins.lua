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
    -- color schemes
    use 'w0ng/vim-hybrid'
    use 'sainnhe/everforest'
    use 'sainnhe/gruvbox-material'
    use 'morhetz/gruvbox'
    use 'NLKNguyen/papercolor-theme'
    use 'joshdick/onedark.vim'
    use 'tomasiser/vim-code-dark'
    -- color schemes
    
    -- Auto completion and LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'williamboman/nvim-lsp-installer'

    if packer_bootstrap then
        require('packer').sync()
    end
end)


