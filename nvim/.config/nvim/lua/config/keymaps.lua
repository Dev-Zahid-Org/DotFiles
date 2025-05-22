-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Live Server (in terminal split)
vim.keymap.set("n", "<leader>vl", function()
  vim.cmd("botright split | terminal live-server .")
end, { desc = "Live Server (Terminal)" })

-- Kill Live Server (if using background method)
vim.keymap.set("n", "<leader>vk", function()
  vim.fn.jobstart("pkill live-server")
  vim.notify("Live Server killed 💀", vim.log.levels.WARN)
end, { desc = "Kill Live Server" })
