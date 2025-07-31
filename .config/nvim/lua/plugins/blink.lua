require('blink.cmp').setup({
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip' },
    opts = {
        snippets = { preset = 'luasnip' },
        -- ensure you have the `snippets` source (enabled by default)
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    fuzzy = { implementation = "lua" }
})
