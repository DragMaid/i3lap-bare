vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
    aux_dir = "aux",
    out_dir = "build"
}
require('plugins')
require('configs')
require('scripts')
