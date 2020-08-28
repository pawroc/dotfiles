set number

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>


" Let statements
let mapleader = " "


"See invisible characters
set list listchars=tab:▷·,trail:·,eol:↵,space:·,extends:◣,precedes:◢

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

  Plug 'gruvbox-community/gruvbox'

" coc {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  let g:coc_global_extensions = [
    \ 'coc-sh',
    \ 'coc-git',
    \ 'coc-explorer',
    \ ]

  " coc-git
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  nmap gs <Plug>(coc-git-chunkinfo)
  nmap gu :CocCommand git.chunkUndo<cr>

  nmap <silent> <leader>k :CocCommand explorer<cr>

" }}}
" Initialize plugin system
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
