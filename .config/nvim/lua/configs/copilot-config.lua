-- Suppress Copilot status messages
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = true

-- Optional: Auto-disable Copilot if quota is exceeded
vim.api.nvim_create_autocmd("User", {
  pattern = "CopilotStatusUpdated",
  callback = function()
    local status = vim.fn["copilot#status"]()
    if status == "Not available" or status:match("token") then
      vim.cmd("Copilot disable")
      vim.notify("Copilot disabled: quota reached", vim.log.levels.INFO)
    end
  end,
})

