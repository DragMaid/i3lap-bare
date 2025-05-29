vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Shortcuts for fzf-lua actions (files, buffers, live_grep)
vim.keymap.set("n", "F", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "B", require('fzf-lua').buffers, { desc = "Fzf Buffers" })
vim.keymap.set("n", "R", require('fzf-lua').live_grep, { desc = "Fzf live_grep" })

-- Shortcuts for commenting upon hitting ctrl + /
vim.keymap.set("n", "<C-_>", "<plug>NERDCommenterToggle<CR>")
vim.keymap.set("v", "<C-_>", "<plug>NERDCommenterToggle<CR>")

-- Shortcuts to split panes
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<C-w>_", "<cmd>split<CR>")

-- Shortcuts to open new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Disable arrow keys in normal mode to learn vim motions
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

-- Shortcuts to set the current file as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Shortcuts to move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Shortcuts to join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Shortcuts to keep the cursor in the middle of the screen when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Shortcuts to keep the cursor in the middle of the screen when searching and expanding all folded
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Shortcuts to paste without losing the current selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Shortcuts to copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+yy")
vim.keymap.set("v", "<leader>y", "\"+yy")

-- Shortcuts to substitute the current word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Map the following characters to insert pairs of characters
function CMap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

CMap('i', '"', '""<left>')
CMap('i', "'", "''<left>")
CMap('i', '[', '[]<left>')
CMap('i', '(', '()<left>')
CMap('i', '{', '{}<left>')
CMap('i', '{<CR>', '{<CR>}<ESC>O')
CMap('i', ';<CR>', '{<CR>};<ESC>O')

-- Shortcuts for the primegen harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Shortcuts to navigate between harpoon files
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

-- Shortcuts to compile C++ code (for comptetitive programming)
vim.keymap.set("n", "gcc", function() CppCompile() end)

-- Shortcuts to open the file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Shortcuts to operate the Obsidian vault (accept / reject notes)
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' ~/Docs/obsidian/JCU-vault/zettelkasten<cr>:bd<cr>")
vim.keymap.set("n", "<leader>odd", ":!mv '%:p' ~/Docs/obsidian/JCU-vault/trash<cr>:bd<cr>")

-- Shortcuts to operate the Obsidian vault (open, format, create new note)
vim.keymap.set("n", "<leader>of", function() obsidian_format() end)
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>oo", ":cd ~/Docs/obsidian/JCU-vault")

-- Shortcuts to open the lazygit terminal
vim.keymap.set("n", "<leader>lg", ":LazyGit<cr>")

-- Shortcuts to toggle NERDTree and Undotree
vim.keymap.set("n", "<leader>e", function() ToggleNERDTree() end)
vim.keymap.set("n", "<leader>fe", function() FindNERDTree() end)
vim.keymap.set("n", "<leader>u", function() ToggleUndotree() end)

-- Shortcuts for undo tree
vim.api.nvim_create_autocmd("FileType", {
    pattern = "undotree",
    callback = function()
        vim.keymap.set("n", "K", "<plug>UndotreeNextState", { buffer = true })
        vim.keymap.set("n", "J", "<plug>UndotreePreviousState", { buffer = true })
    end,
})

-- Shortcuts for quickfix list navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>", { silent = true, noremap = true })

-- Shortcuts to operate the diagnostic messages
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
vim.keymap.set('n', '<leader>do', function() vim.diagnostic.setloclist() end, opts)
