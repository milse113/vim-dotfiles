local Haskell = require('lsp.haskell')
local Rust = require('lsp.rust')
local Lua = require('lsp.lua')
local Zig = require('lsp.zig')
local Racket = require('lsp.racket')
local Java = require('lsp.java')
local Kotlin = require('lsp.kotlin')
local Go = require('lsp.go')
local Python = require('lsp.python')

local LSP = {}

local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach = function(client)
	require'completion'.on_attach(client)
  local telescope_prefix = '<cmd>lua require(\'telescope.builtin\').'

  vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()')

  -- Goto
  -- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  -- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  -- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gi', telescope_prefix..'lsp_implementations()<CR>')
  map('n', 'gr', telescope_prefix..'lsp_references()<CR>')
  map('n', 'gd', telescope_prefix..'lsp_definitions()<CR>')
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- Documentation
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  -- Information
  map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  -- Actions
  -- map('n', '<leader>gr', telescope_prefix..'lsp_references()<CR>')
  -- map('n', '<leader>gd', telescope_prefix..'lsp_definition()<CR>')
  -- map('n', '<leader>gi', telescope_prefix..'lsp_implementations()<CR>')
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>ca', telescope_prefix..'lsp_code_actions()<CR>')
  map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

  print("LSP attached")
end

LSP.on_attach = on_attach

function LSP.init(attach_func)
  attach_func = attach_func or on_attach
  Haskell.init(attach_func)
  --Rust.init(attach_func)
  Lua.init(attach_func)
  Zig.init(attach_func)
  Racket.init(attach_func)
  Java.init(attach_func)
  Kotlin.init(attach_func)
  Go.init(attach_func)
  Python.init(attach_func)

  require('rust-tools').setup {
    server = {
      on_attach=attach_func
    }
  }
end

return LSP
