local nvim_lsp = require'lspconfig'

local Rust = {}

function Rust.init(on_attach)
  nvim_lsp.rust_analyzer.setup({
      on_attach=on_attach,
      settings = {
          ["rust-analyzer"] = {
              cargo = {
                  loadOutDirsFromCheck = true
              },
              procMacro = {
                  enable = true
              },
          }
      }
  })
end

return Rust
