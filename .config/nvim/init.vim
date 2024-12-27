"-------------------------------------------------------------------------------
" Setup runtimepath
"-------------------------------------------------------------------------------
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Neovim specific key mapppings 
"-------------------------------------------------------------------------------
" Launch terminal
nnoremap <leader>' :terminal<C-m>i
" Go into normal mode from terminal
tnoremap <leader>q <C-\><C-n>
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin()
  " Language Server
  Plug 'neovim/nvim-lspconfig'
  " LSP server management
  Plug 'williamboman/mason.nvim'
  " Colorizer
  Plug 'norcalli/nvim-colorizer.lua'
  " Tokyo Night colorscheme
  Plug 'folke/tokyonight.nvim'
  " nice status line
  Plug 'nvim-lualine/lualine.nvim'
  " indentation symbols
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " To Do: Add autocompletion and telescope
call plug#end()

lua << EOF
  vim.cmd[[set termguicolors]]

  local colors = require("tokyonight.colors").setup()
  ------------------------------------------------------------------------------
  -- Lualine customized theme testing
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

  require("tokyonight").setup({
    on_highlights = function(hl, c)
      hl.WinSeparator = { fg = c.fg_dark }
      hl.ColorColumn = { bg = c.bg_highlight }
      hl.Search = {fg = c.bg_dark, bg = c.blue5}
      hl.StatusLine = { bg = c.fg_gutter}
      hl.StatusLineNC = { bg = c.fg_gutter }
    end
  })

  vim.cmd.colorscheme({"tokyonight"})
  
  require'lualine'.setup({
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
  })

  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
  
  require'ibl'.setup()
  require'nvim-treesitter.configs'.setup({highlight={enable=true}})
  require'colorizer'.setup()
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.lua_ls.setup{}

EOF
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"- Source existing vim config
"-------------------------------------------------------------------------------
source ~/.vimrc
"-------------------------------------------------------------------------------

