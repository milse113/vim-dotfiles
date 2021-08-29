--- IDE Features, Autocompletion ---

local LSP = require('lsp.lsp')

local plug = require('paq-nvim').paq

local IDE = {}

local function plugins()
  -- LSP Plugins
  plug 'neovim/nvim-lspconfig'
  plug 'kabouzeid/nvim-lspinstall'
  plug 'nvim-lua/completion-nvim'
  plug 'folke/trouble.nvim'
  plug 'nvim-lua/lsp-status.nvim'
  plug 'mfussenegger/nvim-dap'
  plug 'rcarriga/nvim-dap-ui'
  plug 'nvim-telescope/telescope-dap.nvim'

  -- Syntax utilities
  plug 'jiangmiao/auto-pairs'
  plug {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  plug 'kovisoft/paredit'

  -- Language specific plugins
  plug 'ziglang/zig.vim'
  plug 'cespare/vim-toml'
  plug {'vlime/vlime', rtp='vim/'} -- TODO Fix RTP
  plug 'purescript-contrib/purescript-vim'
  plug 'mfussenegger/nvim-jdtls'
  plug 'wlangstroth/vim-racket'
  plug 'simrat39/rust-tools.nvim'
end

local function config()
  vim.g.completion_enable_auto_popup = 1
  vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true, noremap = true})
  vim.opt.completeopt="menuone,noinsert,noselect"

  require("trouble").setup {}
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    }
  }
  require('telescope').load_extension('dap')

  LSP.init()
end

function IDE.init()
  plugins()
  config()
end

return IDE
