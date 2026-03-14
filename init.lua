-- local vimrc = vim.fn.stdpath 'config' .. './vimrc.vim'
-- vim.cmd.source(vimrc)
local python_path = vim.fn.system('uv python find'):gsub('%s+$', '')
vim.g.python3_host_prog = python_path
local python_dir = vim.fn.fnamemodify(python_path, ':h')
vim.env.PATH = python_dir .. (package.config:sub(1, 1) == '\\' and ';' or ':') .. vim.env.PATH
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

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

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

vim.treesitter.language.register('jai', 'jai')
vim.filetype.add {
  extension = {
    jai = 'jai',
  },
}
