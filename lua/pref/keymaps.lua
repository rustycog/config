-- Keymaps configuration
-- v0.1
-- 2022-05-25
-- 

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts) -- moving left
keymap('n', '<C-j>', '<C-w>j', opts) -- moving down
keymap('n', '<C-k>', '<C-w>k', opts) -- moving up
keymap('n', '<C-l>', '<C-w>l', opts) -- moving right

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +1<CR>', opts)
keymap('n', '<C-Down>', ':resize -1<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -1<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +1<CR>', opts)

-- Open file explorer
keymap('n', '<leader>e', ':Lex 30<CR>', opts)

-- Exit insert mode 
keymap('i', 'jk', '<ESC>', opts)
