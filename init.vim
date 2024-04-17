call plug#begin('/home/devel/.local/share/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'

" Node
Plug 'hrsh7th/nvim-cmp'                 
Plug 'hrsh7th/cmp-nvim-lsp'           
Plug 'hrsh7th/cmp-buffer'            
Plug 'hrsh7th/cmp-path'             
Plug 'hrsh7th/cmp-cmdline'         
Plug 'saadparwaiz1/cmp_luasnip'   
Plug 'L3MON4D3/LuaSnip'          
Plug 'rafamadriz/friendly-snippets'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'neovim/nvim-lspconfig'

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


" Node
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

lua << EOF
local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    })
})
EOF

let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \}
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \}
let g:ale_fix_on_save = 1  " Automatically fix issues on save

