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

-- buffer navigation
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- move line up and down
-- keymap({'n','i'}, '<A-j>', '<Esc>:m .+1<CR>', opts)
-- keymap({'n','i'}, '<A-k>', '<Esc>:m .-2<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +1<CR>', opts)
keymap('n', '<C-Down>', ':resize -1<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -1<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +1<CR>', opts)

-- Open file explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Exit insert mode 
keymap('i', 'jk', '<ESC>', opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Visual mode
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
