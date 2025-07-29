-- local vimrc = vim.fn.stdpath 'config' .. './vimrc.vim'
-- vim.cmd.source(vimrc)
vim.g.python3_host_prog = 'C:\\Users\\GiovanniPatruno\\AppData\\Local\\nvim-data\\venv\\Scripts\\python.exe'
require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets
-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.colortheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.conform',
  require 'plugins.gitsigns',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
  require 'plugins.toggleterm',
  require 'plugins.surround',
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.jai = {
  install_info = {
    url = 'C:\\Users\\GiovanniPatruno\\repos\\personal\\jai\\tree-sitter-jai',
    files = { 'src/parser.c' },
  },
}
