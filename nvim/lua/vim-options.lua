vim.cmd("set et")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")

vim.opt.relativenumber = true

vim.diagnostic.config({
	virtual_text = false,
	signs = true, -- Show those "W" and "E" marks on the left
	underline = true,
	update_in_insert = false, -- Don't refresh while you are typing
	severity_sort = true,
})

vim.g.mapleader = " "
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

vim.api.nvim_create_user_command("Config", function()
  vim.cmd("tabnew " .. vim.fn.stdpath("config"))
end, {})

