return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "lua",
        "json",
        "markdown",
        "markdown_inline",
        "vim",
        "bash",
        "tsx",
        "yaml",
        "gitignore",
        "http",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
