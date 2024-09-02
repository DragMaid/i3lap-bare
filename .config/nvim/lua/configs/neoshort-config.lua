--vim.keymap.del("n", "<SPACE>")
vim.g.mapleader = " "

vim.keymap.set("n", "F", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "R", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "B", "<cmd>Telescope buffers<CR>")

vim.keymap.set("n", "<C-_>", "<plug>NERDCommenterToggle<CR>")
vim.keymap.set("v", "<C-_>", "<plug>NERDCommenterToggle<CR>")

vim.keymap.set("n", "gt", "<Plug>ToggleGoldenViewAutoResize<CR>")

--vim.keymap.del("n", "<C-w>|")
--vim.keymap.del("n", "<C-w>_")

vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<C-w>_",  "<cmd>split<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.keymap.set("v", "J",         ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K",         ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J",         "mzJ`z")
vim.keymap.set("n", "<C-d>",     "<C-d>zz") 
vim.keymap.set("n", "<C-u>",     "<C-u>zz") 
vim.keymap.set("n", "n",         "nzzzv")
vim.keymap.set("n", "N",         "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+yy")
vim.keymap.set("v", "<leader>y", "\"+yy")
vim.keymap.set("n", "<C-f>",     "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader>t', vim.cmd.UndotreeToggle)

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

vim.api.nvim_exec([[
function! g:Undotree_CustomMap()
    nmap <buffer> K <plug>UndotreeNextState
    nmap <buffer> J <plug>UndotreePreviousState
endfunc
]], false)
vim.keymap.set("n", "<tab>", "<cmd>call undotree#UndotreeFocus()<CR>")

vim.keymap.set("n", "<F1>", function() CppCompile() end)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Vim surround plugin keybinds
-- cs"' , yssb , yss[ , ds", cst"
