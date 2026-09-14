-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.autoformat = false
vim.b.autoformat = false
vim.o.shell = "/usr/bin/fish"

vim.g.snacks_animate = false
vim.opt.scrolloff = 10
vim.opt.mousescroll = "ver:1,hor:1"

vim.opt.shell = "/usr/bin/fish"
vim.opt.breakindent = true
vim.opt.laststatus = 0

vim.g.lazyvim_picker = "snacks"

vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0

vim.opt.textwidth = 0
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.linebreak = false

vim.g.lazygit_config_file_path = vim.fn.expand("~/.config/lazygit/config.yml")
