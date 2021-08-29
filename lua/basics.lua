local Basics = {}

local function base_binds()
  vim.g.mapleader = ' '
  vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true})
  vim.api.nvim_set_keymap('n', '<esc>', ':noh<return><esc>', {noremap = true})
end

local function base_settings()
  vim.opt.compatible = false
  vim.opt.exrc = true
  vim.opt.secure = true
  vim.opt.autoread = true
  vim.opt.termguicolors = true

  vim.opt.backup = true
  vim.opt.backupdir = '/tmp'
  vim.opt.dir = '/tmp'
  vim.opt.swapfile = false

  vim.opt.timeoutlen = 1000
  vim.opt.ttimeoutlen = 0

  vim.opt.mouse = 'a'

  vim.opt.tw = 0
  vim.opt.wrap = false

  vim.opt.ttyfast = true

  vim.opt.clipboard = 'unnamedplus'

  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.expandtab = true
  vim.opt.ai = true

  vim.opt.incsearch = true
  vim.opt.ignorecase = true

  vim.cmd([[
    filetype off
    filetype plugin on
  ]])
end

function Basics.init()
  base_binds()
  base_settings()
end

return Basics
