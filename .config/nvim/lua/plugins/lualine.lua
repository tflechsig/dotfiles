local colors = require("tokyonight.colors").setup()

------------------------------------------------------------------------------
-- Lualine customized theme
------------------------------------------------------------------------------
-- status line theme
local tokyo_winter_sl = 
  {
  normal = {
    a = { bg = colors.blue      , fg = colors.bg_dark , gui = 'bold' },
    b = { bg = colors.dark3     , fg = colors.fg                     },
    c = { bg = colors.fg_gutter , fg = colors.fg                     },
  },
  insert = {
    a = { bg = colors.green     , fg = colors.bg_dark , gui = 'bold' },
  },
  command = {
    a = { bg = colors.yellow    , fg = colors.bg_dark , gui = 'bold' },
  },
  visual = {
    a = { bg = colors.magenta   , fg = colors.bg_dark , gui = 'bold' },
  },
  replace = {
    a = { bg = colors.red       , fg = colors.bg_dark , gui = 'bold' },
  },
  terminal = {
    a = { bg = colors.green1    , fg = colors.bg_dark , gui = 'bold' },
  },
  inactive = {
    a = { bg = colors.fg_gutter , fg = colors.fg      , gui = 'bold' },
    b = { bg = colors.fg_gutter , fg = colors.fg                     },
    c = { bg = colors.fg_gutter , fg = colors.fg                     },
  }}
------------------------------------------------------------------------------

return{
  "nvim-lualine/lualine.nvim",
  lazy = false,
  opts = {
    options = {
      theme = tokyo_winter_sl, -- 'tokyonight-night'
      section_separators = {left = '', right = ''}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    }
  }
}
