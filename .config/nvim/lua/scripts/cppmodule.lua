function TmuxWindowValidate()
    local target_name = "output"
    local tmpfile = '/tmp/stmp.txt'
    os.execute("tmux lsw -F '#{window_name}' > "..tmpfile)
    local f = io.open(tmpfile)
    if not f then return 0 end  

    local k = 1
    local valid = false
    for line in f:lines() do
        if (line == target_name) then
            valid = true
            return k
        else k = k + 1
        end
    end
    if not valid then os.execute("tmux new-window && tmux rename-window output") end
    f:close()
    return k
end

function TmuxGetSession()
    local tmpfile = '/tmp/stmp2.txt'
    os.execute("tmux display-message -p '#S' > "..tmpfile)
    local f = io.open(tmpfile)
    if not f then return 0 end  
    local session
    for temp in f:lines() do session = temp end
    f:close()
    return session
end

function CppCompile() 
    if (vim.bo.filetype == "cpp") then 
        local path = vim.api.nvim_buf_get_name(0)
        local session_name = TmuxGetSession()
        local window_index = TmuxWindowValidate()
        local command = "tmux send-keys -t "..session_name..":"..window_index.." 'g++ -std=c++17 -Wall "..path.." -o output && ./output'".." ENTER"
        os.execute("tmux select-window -t:"..window_index.." && "..command)
    else print("No cpp file detected")
    end
end
