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
    -- colorschemes
    -- use 'w0ng/vim-hybrid'
    -- use 'sainnhe/everforest'
    use 'sainnhe/gruvbox-material'
    -- use 'NLKNguyen/papercolor-theme'
    -- use 'joshdick/onedark.vim'
    use 'tomasiser/vim-code-dark'
    if packer_bootstrap then
        require('packer').sync()
    end
end)


