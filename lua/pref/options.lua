local options = {
	hidden = true,
	--backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "preview" },
	--conceallevel = 0,
	fileencoding = 'utf-8',
	mouse = "a",
	--showmode = false,
	showtabline = 2,
	smartcase = true,
	--smartindent = true,
	cindent = true,
	termguicolors = true,
	timeoutlen = 200,
	undofile = true,
	updatetime = 300,
	expandtab = false,
	tabstop = 4,
	shiftwidth = 4,
	cursorline = true,
	number = true,
	relativenumber = false,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8
}

--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"

for k, v in pairs(options) do
	vim.opt[k] = v
end

--vim.cmd [[hi Cursorline gui=underline guibg=bg]]
--vim.cmd [[hi CursorlineNr gui=underline]]

