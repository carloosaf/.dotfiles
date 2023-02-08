local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

lsp.ensure_installed({
    'sumneko_lua',
    'rus_analyzer',
})
