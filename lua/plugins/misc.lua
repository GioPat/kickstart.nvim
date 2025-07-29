-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  -- {
  --   -- Autoclose parentheses, brackets, quotes, etc.
  --   'windwp/nvim-autopairs',
  --   dependencies = { 'hrsh7th/nvim-cmp' },
  --   config = function()
  --     require('nvim-autopairs').setup {
  --       check_ts = true,
  --       ts_config = {
  --         lua = { 'string' },
  --         javascript = { 'template_string' },
  --       },
  --       disable_file_type = { 'TelescopePrompt' },
  --       disable_in_macro = false,
  --       ignored_next_char = '[%w%.]',
  --     }
  --   end,
  -- },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
