--- Looks and Appearance ---
local plug = require('paq-nvim').paq
local Colors = require('util.colors')

local Looks = {}

local function galaxyline()
  require('galaxyline').section.left[1]= {
    FileSize = {
      provider = 'FileSize',
      condition = function()
        if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
          return true
        end
        return false
        end,
      icon = '    ',
      separator = '',
      highlight = {Colors.normal.white,'#82AAFF'},
      separator_highlight = {'#3E50E4',Colors.bright.black}
    }
  }
end

local function tabline()
  require('tabline').setup {
    section_separators = {'', ''},
    component_separators = {'', ''},
  }

  vim.api.nvim_set_keymap('n', 'gt', '<cmd>TablineBufferNext<cr>', {noremap = true})
  vim.api.nvim_set_keymap('n', 'gT', '<cmd>TablineBufferPrevious<cr>', {noremap = true})
end

local function plugins()
  -- Theme
  plug {'kaicataldo/material.vim', branch='main'}

  -- Icon Support
  plug 'kyazdani42/nvim-web-devicons' -- NeoVim icons
  plug 'ryanoasis/vim-devicons' -- Vimscript icons

  -- Tab line
  plug 'romgrk/barbar.nvim'
  -- plug 'kdheepak/tabline.nvim'

  -- Status line
  plug 'hoob3rt/lualine.nvim'
  --plug 'glepnir/galaxyline.nvim'

  -- Miscellaneous
  plug 'folke/lsp-colors.nvim' -- LSP Colors TODO configure
  plug 'glepnir/dashboard-nvim' -- Dashboard
end

local function configuration()
  --vim.g.airline_theme = 'material'
  vim.g.material_theme_style = 'darker'
  vim.g.indentLine_char = '│'

  vim.g.dashboard_default_executive = 'telescope'

  vim.opt.number = true
  vim.opt.nu = true

  local material_darker = require'lualine.themes.material'

  material_darker.normal.c.bg = '#2A2A2A'
  material_darker.inactive.c.bg = '#2A2A2A'

  require('lualine').setup {
    options = { theme = material_darker },
    -- sections = { lualine_c = {require'lsp-status'.status} }
  }

  vim.api.nvim_set_keymap('n', 'gt', '<cmd>BufferNext<cr>', {noremap = true})
  vim.api.nvim_set_keymap('n', 'gT', '<cmd>BufferPrevious<cr>', {noremap = true})

  --vim.g.dashboard_custom_header = {
  --  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  --  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  --  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  --  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  --  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  --  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  --}

    vim.g.dashboard_custom_header = {
      '⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀',
      '⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀',
      '⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀',
      '⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆',
      '⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⠿⠿⠿⠿⠛',
    }

    vim.g.dashboard_custom_footer = {"Anemone Neovim"}


  vim.cmd([[
    syntax on
    colors material
  ]])
end

--- Loads appearance related plugins and configuration
function Looks.init()
  plugins()
  configuration()
end

return Looks
