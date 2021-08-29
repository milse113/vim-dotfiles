local nvim_lsp = require'lspconfig'

local Zig = {}

function Zig.init(on_attach)
  nvim_lsp.zls.setup{on_attach=on_attach}
end

return Zig
