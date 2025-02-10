return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Example config in lua
    -- Load the colorscheme
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
