--- Miscellaneous ---
local plug = require('paq-nvim').paq

local Miscellaneous = {}

local function hardmode()
  vim.api.nvim_set_keymap('n', '<up>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('n', '<down>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('n', '<left>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('n', '<right>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('i', '<up>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('i', '<down>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('i', '<left>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('i', '<right>', '<NOP>', {noremap = true})
end

local function plugins()
  plug 'vimwiki/vimwiki'
  plug {'ObserverOfTime/discord.nvim', run=':UpdateRemotePlugins'}
  plug {'iamcco/markdown-preview.nvim', run='cd app && yarn install'}
  plug 'junegunn/goyo.vim'
end

local function config()
  vim.api.nvim_set_keymap('n', '<leader>nt', '<cmd>FloatermNew<cr>', {noremap = true})
end

--- Loads miscellanous plugins and configuration
function Miscellaneous.init()
  hardmode()
  plugins()
  config()
end

return Miscellaneous
