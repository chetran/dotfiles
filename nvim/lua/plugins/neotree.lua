return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()

  require('neo-tree').setup {
    filesystem = {
      filtered_items = {
        visible = true, -- when true, dotfiles will be shown instead of hidden
        hide_dotfiles = false,
        hide_gitignored = true,
        -- hide_by_name = { -- add files/folders you want to exclude completely
        --   ".DS_Store",
        -- },
      },
    },
  }
		vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>")
	end,
}
