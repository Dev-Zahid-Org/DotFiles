local live_tab = nil

local function notify(msg)
  vim.notify(msg, vim.log.levels.INFO)
end

local function open_browser()
  vim.fn.jobstart({ "explorer.exe", "http://127.0.0.1:8080" }, { detach = true })
end

local function start_live_server()
  if live_tab and vim.api.nvim_tabpage_is_valid(live_tab) then
    notify("Live server already running!")
    return
  end

  vim.cmd("tabnew")
  vim.cmd("terminal live-server --host=0.0.0.0 --port=8080")
  live_tab = vim.api.nvim_get_current_tabpage()

  notify("Live server started on http://127.0.0.1:8080")
  open_browser()
end

local function kill_live_server()
  if live_tab and vim.api.nvim_tabpage_is_valid(live_tab) then
    vim.api.nvim_command(live_tab .. "tabclose")
    live_tab = nil
    notify("Live server tab closed, server stopped.")
  else
    notify("No live server tab found.")
  end
end

vim.keymap.set("n", "<leader>ml", start_live_server, { desc = "Start Live Server" })
vim.keymap.set("n", "<leader>mk", kill_live_server, { desc = "Kill Live Server" })
