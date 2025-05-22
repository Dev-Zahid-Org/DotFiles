-- in plugins/autosave.lua
return {
  "nvim-lua/plenary.nvim", -- just in case for safe delay handling
  config = function()
    local autosave_enabled = false
    local autosave_timer = nil

    function ToggleAutosave()
      autosave_enabled = not autosave_enabled
      if autosave_enabled then
        vim.notify("AutoSave: ON", vim.log.levels.INFO, { title = "AutoSave" })

        autosave_timer = vim.loop.new_timer()
        autosave_timer:start(
          1000,
          1000,
          vim.schedule_wrap(function()
            if autosave_enabled and vim.bo.modified and vim.api.nvim_buf_get_option(0, "modifiable") then
              vim.cmd("silent! write")
            end
          end)
        )
      else
        vim.notify("AutoSave: OFF", vim.log.levels.WARN, { title = "AutoSave" })
        if autosave_timer then
          autosave_timer:stop()
          autosave_timer:close()
          autosave_timer = nil
        end
      end
    end

    vim.keymap.set("n", "<leader>as", ToggleAutosave, { desc = "Toggle AutoSave" })
  end,
}
