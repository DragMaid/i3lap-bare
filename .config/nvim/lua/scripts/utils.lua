-- Utility functions to detect if a buffer/window is open for a specific filetype
local function is_open(filetype)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == filetype then
            return true
        end
    end
    return false
end

-- Function to toggle NERDTree with Undotree conflict check
function ToggleNERDTree()
    if is_open("undotree") then
        vim.cmd("UndotreeHide")
    end
    if not is_open("nerdtree") then
        vim.keymap.set("n", "<tab>", ToggleNERDTreeFocus)
    end
    vim.cmd("NERDTreeToggle")
end

-- Function to toggle Undotree with NERDTree conflict check
function ToggleUndotree()
    if is_open("nerdtree") then
        vim.cmd("NERDTreeClose")
    end
    if not is_open("undotree") then
        vim.keymap.set("n", "<tab>", "<cmd>call undotree#UndotreeFocus()<CR>")
    end
    vim.cmd("UndotreeToggle")
end

function FindNERDTree()
    if is_open("undotree") then
        vim.cmd("UndotreeHide")
    end
    vim.cmd("NERDTreeFind")
end

local last_win = nil

function ToggleNERDTreeFocus()
    local nerdtree_win = nil

    -- Find the NERDTree window (by filetype or buftype)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == "nerdtree" then
            nerdtree_win = win
            break
        end
    end

    -- If NERDTree is not open, do nothing
    if not nerdtree_win then
        print("NERDTree is not open.")
        return
    end

    local current_win = vim.api.nvim_get_current_win()

    if current_win == nerdtree_win then
        -- Already focused on NERDTree, switch back to last window
        if last_win and vim.api.nvim_win_is_valid(last_win) then
            vim.api.nvim_set_current_win(last_win)
        else
            -- Fallback: just go to the next window
            vim.cmd("wincmd w")
        end
    else
        -- Save current window and switch focus to NERDTree
        last_win = current_win
        vim.api.nvim_set_current_win(nerdtree_win)
    end
end
