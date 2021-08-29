--- File Navigation ---
local plug = require('paq-nvim').paq

local Navigation = {}

local function plugins()
  plug 'kyazdani42/nvim-tree.lua'
  plug 'nvim-telescope/telescope.nvim'
end

local function config()
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  vim.api.nvim_set_keymap('n', '<leader>nn', ':NvimTreeOpen<CR>', {noremap = true})
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_group_empty = 1
  vim.g.nvim_tree_bindings = {
    { key = "t", cb = tree_cb("tabnew") },
  }

  vim.opt.shortmess = vim.opt.shortmess + 'c'
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true })

  vim.g.nvim_tree_disable_netrw = 0
  vim.g.nvim_tree_hijack_netrw = 0
end

function Navigation.init()
  plugins()
  config()
end

return Navigation
