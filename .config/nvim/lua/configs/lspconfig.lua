-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
--
-- local lsp_zero = require('lsp-zero')
-- local cmp = require('cmp')
-- local cmp_lsp = require("cmp_nvim_lsp")
-- local capabilities = vim.tbl_deep_extend(
--     "force",
--     {},
--     vim.lsp.protocol.make_client_capabilities(),
--     cmp_lsp.default_capabilities())
-- 
-- require('lspconfig').intelephense.setup({})
-- 
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = {
--         'eslint',
--         'lua_ls',
--         'pylsp',
--         'bashls',
--         'jsonls',
--     },
-- 
--     handlers = {
--         function(server_name) -- Default handler
--             require('lspconfig')[server_name].setup {
--                 capabilities = capabilities
--             }
--         end,
--     },
-- })
-- 
-- lsp_zero.set_sign_icons({
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = '»'
-- })
-- 
-- lsp_zero.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
-- 
--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--     vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
--     vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
--     vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
-- end)
-- 
-- 
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- 
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body) -- For luasnip users
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--         ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     }),
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--     }, {
--         { name = 'buffer' }
--     }),
-- })
-- 
-- 
-- vim.diagnostic.config({
--     -- update_in_insert = true,
--     float = {
--         focusable = false,
--         style = "minimal",
--         border = "rounded",
--         source = "always",
--         header = "",
--         prefix = "",
--     },
-- })
