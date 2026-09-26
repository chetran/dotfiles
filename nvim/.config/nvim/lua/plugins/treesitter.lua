return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site'
    }
    require("nvim-treesitter").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

