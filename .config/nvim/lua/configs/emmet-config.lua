vim.g.user_emmet_install_global = 0
vim.g.user_emmet_mode = 'a'  
vim.g.user_emmet_leader_key = ','
vim.api.nvim_exec([[
    autocmd FileType html,css,ts,tsx EmmetInstall
]], false)
