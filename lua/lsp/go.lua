local nvim_lsp = require('lspconfig')

local Go = {}

function Go.init(on_attach)
  nvim_lsp.gopls.setup {
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
end

return Go
