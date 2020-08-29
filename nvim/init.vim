"General {{{

" Apperance
set number
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
set shiftwidth=4 " number of spaces to use for indent and unindent
set tabstop=4 " the visible width of tabs

" Tab indentation for particular filetypes
autocmd FileType sh,vim,zsh setlocal shiftwidth=2 tabstop=2

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

  " Color scheme
  Plug 'gruvbox-community/gruvbox'

  " vim-airline {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='deus'
    
  " }}}

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

  " Usufeul additions {{{
  " substitute, search, and abbreviate multiple variants of a word
  Plug 'tpope/vim-abolish'
  
  " easy commenting motions
  " gc - toggle selected line(s) (comment / uncomment)
  " :7,17Commentary - comments lines from 7 to 17 ion current buffer
  " :g/Something/Commentary - comments globally all 'Something' texts
  Plug 'tpope/vim-commentary'
  
  " .editorconfig support
  Plug 'editorconfig/editorconfig-vim'

  " Startify: Fancy startup screen for vim {{{
  Plug 'mhinz/vim-startify'

    " Don't change to directory when selecting a file
    let g:startify_files_number = 5
    let g:startify_change_to_dir = 0
    let g:startify_custom_header = [ ]
    let g:startify_relative_path = 1
    let g:startify_use_env = 1

    " Custom startup list, only show MRU from current directory/project
    let g:startify_lists = [
                \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
                \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
                \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
                \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
                \  { 'type': 'commands',  'header': [ 'Commands' ]       },
                \ ]

    let g:startify_commands = [
                \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
                \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
                \ ]

    let g:startify_bookmarks = [
                \ { 'c': '~/.config/nvim/init.vim' },
                \ { 'g': '~/.gitconfig' },
                \ { 'z': '~/.zshrc' }
                \ ]

    autocmd User Startified setlocal cursorline
    nmap <leader>st :Startify<cr>
  " }}}

  " vim-ctrlspace {{{
  " Fuzzy search engine for tabs / buffers / files / bookmarks
    Plug 'vim-ctrlspace/vim-ctrlspace'

    set nocompatible
    set hidden
    set encoding=UTF-8
    " turnes off tabline
    set showtabline=0

    " Neovim requires this
    let g:CtrlSpaceDefaultMappingKey = "<C-space> "
  " }}}

  " NERDTree {{{
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        " Required by vim-devicons
        set encoding=UTF-8

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <leader>nt :call ToggleNerdTree()<cr>
        " find the current file in nerdtree without needing to reload the drawer
        nmap <silent> <leader>nf :NERDTreeFind<cr>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
  " }}}

  " Airline {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    let g:airline_theme='simple'
    let g:airline_powerline_fonts = 1
    " Automatically displays all buffers when there's only one tab open
    let g:airline#extensions#tabline#enabled = 1
    set guifont=DroidSansMonoForPowerlinePlusNerdFileTypesMono,PowerlineExtraSymbols
    "set guifont=DroidSansMono\ Nerd\ Font\ 12
    "let g:airline_left_sep = "\uE0B4"
    "let g:airline_right_sep = "\uE0B6"

  " }}}

  " Close buffers but keep splits
  Plug 'moll/vim-bbye'
  nmap <leader>b :Bdelete<cr>

  " context-aware pasting
  Plug 'sickill/vim-pasta'

  " }}}
" }}}

" Initialize plugin system
call plug#end()

" General Mappings {{{

" clear highlighted search
noremap <leader>c :set hlsearch! hlsearch?<cr>

" }}}


" Color scheme
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
