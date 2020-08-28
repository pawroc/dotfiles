" General {{{
set number

" Apperance
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set wildmenu " enhanced command line completion
set signcolumn=yes
set title " set terminal title
set showmatch " show matching braces

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set expandtab
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set tabstop=4 " the visible width of tabs

"Enable mouse click for nvim
if has('mouse')
  set mouse=a
endif

"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

" Let statements
let mapleader = " "

set autoread " detect when a file is changed

set history=1000 " change history to 1000
set textwidth=120

"See invisible characters
set list listchars=tab:▷·,trail:·,eol:↵,space:·,extends:◣,precedes:◢
" }}}

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
    \ 'coc-clangd',
    \ 'coc-python',
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-ultisnips',
    \ 'coc-diagnostic',
    \ ]

  " coc-git }}}
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  nmap gs <Plug>(coc-git-chunkinfo)
  nmap gu :CocCommand git.chunkUndo<cr>
  " }}}

  nmap <silent> <leader>k :CocCommand explorer<cr>

  " coc-clangd {{{
  nmap <leader>h :CocCommand clangd.switchSourceHeader<cr>
  nmap <leader>si :CocCommand clangd.symbolInfo<cr>
  " }}}

  " UltiSnips {{{
  Plug 'SirVer/ultisnips' " Snippets plugin
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
  " }}}

  " Gotos instructions {{{
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gdec <Plug>(coc-declaration)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> gh <Plug>(coc-doHover)
  " }}}

  " Refactoring {{{
  nmap re <Plug>(coc-rename)
  nmap ref <Plug>(coc-refactor)
  " }}}
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
