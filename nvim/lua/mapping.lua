local map = vim.keymap.set
local builtin = require("telescope.builtin")
-- For autocompletion, check the plugin


-- Telescope
map("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- None-ls
map("n", "<leader>gf", vim.lsp.buf.format, {})

-- Neo Tree
map("n", "<C-n>", ":Neotree toggle reveal=true<CR>", { silent = true })
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- LSP config
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gd", vim.lsp.buf.definition, {})
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

map("i", "<C-e>", function()
  local next_char = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))
  if next_char == ")" or next_char == "]" or next_char == "}" or next_char == "\"" or next_char == "'" then
    return "<Right>"
  else
    return "<C-e>"
  end
end, { expr = true, desc = "Smart jump out of brackets" })
