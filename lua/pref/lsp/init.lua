local lsp_status_ok,lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
    print 'lspconfig loading error!'
    return
end

require('nvim-lsp-installer').setup {}
lspconfig.pyright.setup {}
--lspconfig.sumneko_lua.setup {}

