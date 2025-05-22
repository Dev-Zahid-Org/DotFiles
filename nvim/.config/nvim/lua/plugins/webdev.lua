-- ~/.config/nvim/lua/plugins/webdev.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {}, -- for css-lsp
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
          },
        },
      },
    },
  },
}
