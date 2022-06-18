local lsp_status_ok,lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
    print 'lspconfig loading error!'
    return
end

require('pref.lsp.lsp-installer')
require('pref.lsp.handlers').setup()
