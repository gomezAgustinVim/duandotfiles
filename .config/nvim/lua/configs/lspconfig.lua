require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local servers = {
  "pyright",
  "clangd",
  "beautysh",
  "rust_analyzer",
  "html",
  "cssls",
  "bashls",
  "markdown_oxide",
  "lua_ls",
  "eslint",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
