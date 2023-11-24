"-------------------------------------------------------------------------------
" Setup runtimepath and source existing vim configuration
"-------------------------------------------------------------------------------
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Key mapppings 
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
  " LSP
  Plug 'neovim/nvim-lspconfig'
  " Colorizer
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

lua require'lspconfig'.pyright.setup{}
set termguicolors
lua require'colorizer'.setup()
"-------------------------------------------------------------------------------

