return {
  "nvim-lua/plenary.nvim",
  lazy = false,
  config = function()
    local autosave_enabled = false
    local augroup = vim.api.nvim_create_augroup("autosave", { clear = true })
    local timer = vim.loop.new_timer()

    local function save_buffer()
      if vim.bo.modified and vim.bo.buftype == "" then
        vim.cmd("silent write")
      end
    end

    local function debounce_save()
      timer:stop()
      timer:start(
        500,
        0,
        vim.schedule_wrap(function() -- 500 ms debounce delay
          save_buffer()
        end)
      )
    end

    local function enable_autosave()
      vim.api.nvim_clear_autocmds({ group = augroup })
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
        group = augroup,
        callback = debounce_save,
        desc = "Debounced AutoSave on text change or insert leave",
      })
      vim.notify("AutoSave Enabled", vim.log.levels.INFO, { title = "AutoSave" })
    end

    local function disable_autosave()
      timer:stop()
      vim.api.nvim_clear_autocmds({ group = augroup })
      vim.notify("AutoSave Disabled", vim.log.levels.WARN, { title = "AutoSave" })
    end

    local function toggle_autosave()
      autosave_enabled = not autosave_enabled
      if autosave_enabled then
        enable_autosave()
      else
        disable_autosave()
      end
    end

    vim.keymap.set("n", "<leader>as", toggle_autosave, { desc = "Toggle AutoSave" })

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local ok, Snacks = pcall(require, "snacks")
        if ok and type(Snacks.toggle) == "function" then
          Snacks.toggle("autosave", {
            icons = { enabled = "", disabled = "" },
            get = function()
              return autosave_enabled
            end,
            toggle = toggle_autosave,
          })
        end
      end,
    })
  end,
}
