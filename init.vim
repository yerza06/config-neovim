

set number
set relativenumber
set so=10 
set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set cindent
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set nowrap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set clipboard+=unnamedplus


"set clibboard=unnamedplus
set noswapfile

call plug#begin()

"Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/nvim-lualine/lualine.nvim'
"Plug 'https://github.com/akinsho/bufferline.nvim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'nvim-tree/nvim-web-devicons'
"Plug 'https://github.com/tpope/vim-surround'
"Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
"Plug 'https://github.com/loctvl842/monokai-pro.nvim'
"Plug 'loctvl842/monokai-pro.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'mattn/emmet-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'folke/todo-comments.nvim'
Plug 'windwp/nvim-autopairs'
"Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" or                                , { 'branch': '0.1.x' }
Plug 'MeanderingProgrammer/render-markdown.nvim'

call plug#end()

lua << END 
require('lualine').setup()
END

lua << EOF
require("nvim-autopairs").setup {}
EOF

colorscheme github_dark_high_contrast


nnoremap <C-b> :NERDTree<CR>
nnoremap <space> :nohlsearch<CR>
