local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

lsp.ensure_installed({
    'sumneko_lua',
    'rus_analyzer',
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
