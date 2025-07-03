local function code_to_path(line)
    -- Check if line has a location specified
    local code = line:match("- %s*(.*)")
    if code:gsub("%s+", "") == "" then
        print("No location found in the line.")
        return
    end

    local vault_path = "~/Docs/obsidian/JCU-vault/notes/JCU\\ courses/"
    local search_path = vault_path .. "*"

    -- Find the folder that contains the course code
    local search_command = "find " .. search_path .. " -type d -name '*" .. code .. "*'"
    print(search_command)
    local handle = io.popen(search_command)
    if not handle then
        print("Error opening search handle.")
        return
    end

    -- Read the output of the command and check if any folder matches pattern
    local result = handle:read("*a")
    handle:close()
    if result == "" then
        print("No folder with matching pattern found for: " .. code)
        return
    end

    -- Extract the first matching folder path
    local folder_path = vim.fn.trim(result:match("(.-)\n"))
    if not folder_path then
        print("No valid folder found.")
        return
    end

    -- remove anything before and including notes
    folder_path = folder_path:gsub(".*notes/", "")
    print(folder_path)

    -- change everything after - into the new folder path in vim
    local new_line = line:gsub("- %s*(.*)", "- " .. folder_path)
    print(new_line)

    -- replace current line with the new line
    vim.api.nvim_set_current_line(new_line)

    return true
end

local function title_to_name(line)
    -- Extract the name from auto-generated title
    local _, name = line:match("# (%d%d%d%d%-%d%d%-%d%d)_(.*)")
    if not name then
        print("No valid name found in the line.")
        return
    end

    -- Replace that whole title with only the name and keep the #
    local new_title = "# " .. name
    vim.api.nvim_set_current_line(new_title)

    return true
end

function obsidian_format()
    -- Get current cursor position: (row, col)
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.fn.getline('.')

    print(row)

    if row > 1 then
        -- check if the line above the cursor in vim has the pattern "location:"
        local line_above = vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false)[1]
        print(line_above)
        if line_above:match("location:") then
            if code_to_path(line) then
                return
            end
            return
        end
    end

    title_to_name(line)
end
