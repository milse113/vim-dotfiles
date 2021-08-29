local Packaging = {}

-- Library Imports
local plug = require('paq-nvim').paq

-- Bring Paq into vim
local function initialize_paq()
  local install_path = vim.fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
  end
  vim.cmd 'packadd paq-nvim'
  plug {'savq/paq-nvim', opt=true}
end

-- Install basic libraries
local function register_libraries()
  plug 'nvim-lua/popup.nvim'
  plug 'nvim-lua/plenary.nvim'
end

-- function Packaging.load_ide() end
-- function Packaging.load_ide() end
-- function Packaging.load_ide() end

function Packaging.init()
  initialize_paq()
  register_libraries()
end

return Packaging
