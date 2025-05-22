return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      -- Group title
      { "<leader>m", name = "+make-live" },

      -- Start Live Server
      {
        "<leader>ml",
        function()
          vim.cmd("tabnew")
          vim.cmd("terminal live-server --host=0.0.0.0 --port=8080")
          vim.fn.jobstart({ "explorer.exe", "http://127.0.0.1:8080" }, { detach = true })
          vim.notify("Live server started at http://127.0.0.1:8080", vim.log.levels.INFO)
        end,
        desc = "Start Live Server",
      },

      -- Kill Live Server
      {
        "<leader>mk",
        function()
          vim.cmd("tabclose")
          vim.notify("Live server stopped", vim.log.levels.INFO)
        end,
        desc = "Kill Live Server",
      },
    },
  },
}
