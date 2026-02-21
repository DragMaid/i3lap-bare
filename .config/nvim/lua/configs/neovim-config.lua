vim.o.mouse = ""

vim.o.background = 'dark'
--vim.g.gruvbox_contrast_dark = 'dark'
vim.cmd([[colorscheme gruvbox]])

-- Set theme transparency
vim.cmd([[
    highlight Normal     ctermbg=NONE guibg=NONE
    highlight LineNr     ctermbg=NONE guibg=NONE
    highlight SignColumn ctermbg=NONE guibg=NONE
]])

vim.opt.guifont="hack_nerd_font:h21"

-- Basic vim configs
vim.g.python_recommended_style = false
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.foldenable = false

-- UI related configs
vim.cmd("syntax on")
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autoread = true
vim.opt.colorcolumn = "120"

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.conceallevel = 1

-- Always source if Session.vim is found
vim.api.nvim_exec([[
function! RestoreSession()
  if filereadable(getcwd() . '/Session.vim')
    execute 'so ' . getcwd() . '/Session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction
]], false)

vim.api.nvim_exec([[
    autocmd VimEnter * nested call RestoreSession() 
]], false)

vim.api.nvim_exec([[
    au FocusGained,BufEnter * :checktime
    au VimLeave * :!clear
]], false)

-- Enable word wrap for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true       -- enable line wrapping
    vim.opt_local.linebreak = true  -- break at word boundaries
  end,
})

