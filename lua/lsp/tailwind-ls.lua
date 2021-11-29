local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').tailwindcss.setup {
    capabilities = capabilities,
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    }
}
