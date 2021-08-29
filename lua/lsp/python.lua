local nvim_lsp = require('lspconfig')

local Python = {}

function Python.init(on_attach)
  nvim_lsp.pyright.setup {
    on_attach=on_attach,
  }
end

return Python
