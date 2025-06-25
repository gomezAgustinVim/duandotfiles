local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    bash = { "beautysh" },
    sh = { "beautysh" },
    zsh = { "beautysh" },
    python = { "autoflake" },
    javascript = { "prettier" },
    typescript = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },
}

return options
