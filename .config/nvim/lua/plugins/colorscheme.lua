return{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require("tokyonight.colors").setup()

    require("tokyonight").setup({
      on_highlights = function(hl, c)
        hl.WinSeparator = { fg = c.fg_dark }
        hl.ColorColumn = { bg = c.bg_highlight }
        hl.Search = {fg = c.bg_dark, bg = c.blue5}
        hl.StatusLine = { bg = c.fg_gutter}
        hl.StatusLineNC = { bg = c.fg_gutter }
      end})

    vim.cmd.colorscheme('tokyonight')
  end,
}
