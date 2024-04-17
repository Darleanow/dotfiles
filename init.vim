call plug#begin('/home/devel/.local/share/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'

call plug#end()


let mapleader = " "
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>g :Telescope live_grep<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>h :Telescope help_tags<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- Enable Treesitter-based syntax highlighting
  },
}
EOF

syntax enable                " Make sure syntax highlighting is enabled
set termguicolors          " Optimal for dark color schemes, use 'light' for light color schemes
let g:tokyonight_style = "night"
let g:tokyonight_transparent = v:true 
colorscheme tokyonight
set number
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
