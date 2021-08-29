--- NeoVim GUI Settings ---

local GUI = {}

local function neovide()
  vim.opt.guifont = "Iosevka Term:h8"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

function GUI.init()
  if (vim.api.nvim_eval('exists("g:neovide")')) then
    neovide()
  end
end

return GUI
