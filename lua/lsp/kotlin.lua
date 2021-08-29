local nvim_lsp = require('lspconfig')
local lsp_util = require('lspconfig.util')

local Kotlin = {}

function Kotlin.init(on_attach)
  nvim_lsp.kotlin_language_server.setup{
    on_attach=on_attach,
    root_dir = lsp_util.root_pattern("settings.gradle") or lsp_util.root_pattern("settings.gradle.kts")
  }
end

return Kotlin
