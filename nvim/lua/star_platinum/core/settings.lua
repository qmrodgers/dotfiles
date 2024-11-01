vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 50
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.backspace = "indent,eol,start"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.updatetime = 300
vim.o.signcolumn = "yes:3"
vim.o.number = true
vim.o.relativenumber = true
vim.o.statuscolumn = "%s%l %r %C"
vim.opt.showmode = false
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25,v:blinkwait700-blinkoff400-blinkon250"
vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")
vim.o.shell = "zsh"
vim.o.shellcmdflag = "-c"
