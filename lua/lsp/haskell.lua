local nvim_lsp = require('lspconfig')

local Haskell = {}

function Haskell.init(on_attach)
  nvim_lsp.hls.setup{
    on_attach=on_attach,
    settings = {
      haskell = {
        formattingProvider = "stylish-haskell"
      }
    }
  }
end

return Haskell
