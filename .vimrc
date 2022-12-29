" T. Flechsig
"===============================================================================
" Functions
"===============================================================================
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatusLineGit()
  let branchname = GitBranch()
  if strlen(branchname) > 0
    let output=" ".branchname." "
  else
    let output=''
  endif
  return output
endfunction

function! DisplayMode()
  if mode() == "n"
    return 'NORMAL'
  elseif mode() == "v"
    return "VISUAL"
  elseif mode() == "V"
    return "VISUAL LINE"
  elseif mode() == ""
    return "VISUAL BLOCK"
  elseif mode() == "i"
    return "INSERT"
  elseif mode() == "R"
    return "REPLACE"
  elseif mode() == "Rv"
    return "REPLACE"
  elseif mode() == "c"
    return "COMMAND-LINE"
  else
    return "Turn Back"
endfunction

"===============================================================================
" Environment settings  
"===============================================================================
set runtimepath+=~/seneca/users/flechsig/linux_cfg_files/vim

colorscheme badwolf

" tag paths are relative to current vim directory, not relative to the path of
" the tags file
set notagrelative

syntax enable

" don't show mode on last line
" this will be captured in the status line
set noshowmode

" number of spaces per tab when vim opens a file
set tabstop=2

" number of spaces per tab when editing
set softtabstop=2

" autoindent size
set shiftwidth=2

" turn tabs into spaces
set expandtab

" shows line numbers in hybrid format
set number relativenumber

" turn on cursorline
set cursorline

" turn off line wrapping
set nowrap

" show commands as they're typed in the bottom bar
set showcmd

" enables status line
set laststatus=2

hi statusline   cterm=bold ctermbg=50 ctermfg=16 guibg=#88C0D0 guifg=#000000
hi statuslinenc cterm=bold ctermbg=238 ctermfg=15 guibg=#434C5E guifg=#000000

 set statusline=\ %{DisplayMode()}\ 
                \%{gitstatus}
                \\ %t
                \%=
                \\ %p%%\ (%l,%c)\ 

" set line wrap to occur after 80 characters
set textwidth=80

" highlight automatic text wrap column
" set colorcolumn=80

set wildmenu

set showmatch

" case insensitive searches
set ignorecase

set incsearch
set hlsearch

set wildignorecase

" search font color
" hi Search ctermfg=black ctermbg=cyan

" smartindent seems better
set smartindent

" Designate .swp file storage location
set directory=~/.vim/swp/

" Set netrw file explorer list style to tree
let g:netrw_liststyle = 1

" set sessionoptions-=options

" assign system verilog files to syntax type of verilog
augroup sv_ft
  au!
  autocmd BufNewFile,BufRead *.sv set syntax=verilog
  autocmd BufWinEnter,ShellCmdPost * let gitstatus=StatusLineGit()
augroup END

autocmd FileType netrw setl bufhidden=delete

" set command history window height
set cmdwinheight=2

" Set vertical window separator character
set fillchars=vert:│

" Set background color of vertical split
hi VertSplit ctermbg=bg

"===============================================================================
" Key mappings
"===============================================================================
let mapleader=" "
inoremap  kj                <Esc>
nnoremap  j                 gj
nnoremap  k                 gk
nnoremap  <leader>f         *Nzz
nnoremap  *                 <Nop>
nnoremap  n                 nzz
nnoremap  N                 Nzz
vnoremap  n                 nzz
vnoremap  N                 Nzz
nnoremap  <leader>r         <C-r>
nnoremap  <leader>v         <C-v>
vnoremap  <leader>v         <C-v>
nnoremap  <leader>w         <C-w>
nnoremap  <leader>l         <C-w>l
nnoremap  <leader>k         <C-w>k
nnoremap  <leader>j         <C-w>j
nnoremap  <leader>h         <C-w>h
nnoremap  <leader>]         <C-]>
nnoremap  <leader>t         <C-t>
nnoremap  <leader>o         <C-o>
nnoremap  <leader>i         <C-i>
nnoremap  <leader>x         :Explore<C-m>
nnoremap  <leader>z         :vertical resize 
nnoremap  <leader>b         0
nnoremap  <leader>e         $
inoremap  uu                _
cnoremap  uu                _
" signal under cursor added to signal definition list
nnoremap  <leader>d        wbveygg/begin<C-M>i<C-M><Esc>kisignal <Esc>pa: std_logic_vector;<Esc><C-o><C-o>:nohl<C-M>
" comment block template shortcut
nnoremap  <leader>ch       80i-<Esc>a<C-M>--<C-M><Esc>80i-<Esc>ka <Esc>
" replace word under cursor
nnoremap  <leader>s        wbvey:%s/"/
" Jump into component under cursor
nnoremap <leader>n /:N$h/

" If vim is run with huge feature set including
" q: and q/ commands, use the following key mappings
if has("vertsplit")
  nnoremap : q:i
  nnoremap / q/i
endif

