local nvim_lsp = require('lspconfig')

local Racket = {}

function Racket.init(on_attach)
  nvim_lsp.racket_langserver.setup {
    on_attach=on_attach
  }
end

return Racket
