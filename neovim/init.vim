" Theme: Atom One Dark
" Author: MineEjo
" RecommendedInstall: nodejs, npm, yarn, esbuild, ctags

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard+=unnamedplus
:set tw=4 ts=4 sw=4 et
:set cursorline

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " NerdTree git
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Onedark Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/sheerun/vim-polyglot' " More highlighting
Plug 'https://github.com/tpope/vim-fugitive' " Git wrapper
Plug 'https://github.com/airblade/vim-gitgutter' " Git diff
Plug 'https://github.com/ntpeters/vim-better-whitespace' " Whitespace highlighting
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' " Indent Guides

set encoding=UTF-8

call plug#end()

" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeTogle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:NERDTreeDirArrowExpandable='▶'
let g:NERDTreeDirArrowCollapsible='▼'
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusIndicatorMapCustom={
            \ 'Modified'  :'',
            \ 'Staged'    :'',
            \ 'Untracked' :'',
            \ 'Renamed'   :'',
            \ 'Unmerged'  :'',
            \ 'Deleted'   :'',
            \ 'Dirty'     :'',
            \ 'Ignored'   :'',
            \ 'Clean'     :'',
            \ 'Unknown'   :'',
            \ }

" Git
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gw :Git blame<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gl :Git log<CR>

" Binds
hi IndentGuidesEven ctermbg=blue
nnoremap <silent> <Leader>x :x<CR>
nnoremap <silent> <C-s> gg=G<CR> :w<CR>
map <silent> <Leader>y "*y<CR>
map <silent> <Leader>p "*p<CR>

" TagbarToggle
nnoremap <silent> <F8> :TagbarToggle<CR>

" Theme
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Other Colors Variables
let black_alt_color='#323840'
let gray_color='#515b69'
let white_color='#cad0db'
let magenta_color='#c678dd'
let green_color='#98c379'
let yellow_color='#e5c07b'

:syntax on
:colorscheme onedark

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" Visual whitespacea
let g:better_whitespace_enabled=1
let g:better_whitespace_guicolor=black_alt_color
let g:better_whitespace_filetypes_blacklist = ['<filetype1>', '<filetype2>', '<etc>', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']

" Air-line
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

" Airline symbols
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
