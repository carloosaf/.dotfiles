local luasnip = require("luasnip")
local cmp = require("cmp")
local nvim_lsp = require("lspconfig")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end



---------------
-- AUTOPAIRS --
---------------

require('nvim-autopairs').setup{
    disable_filetype = { "TelescopePrompt", "gd" },
    disable_in_macro = false,  -- disable when recording or executing a macro
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    check_ts = true,
    map_bs = true,  -- map the <BS> key
    map_c_w = false, -- map <c-w> to delete an pair if possible
}

-- Autopairs + cmp for auto parenthesis in functions
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

---------
-- CMP --
---------

cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                return vim_item
            end

        })
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

    },

    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"},
        {name = "path"},
        {name = "buffer", keyword_length = 6},
    },
}

---------
-- LSP --
---------

require("mason").setup()
require("mason-lspconfig").setup()
local server_opts = {}
nvim_lsp.rust_analyzer.setup(server_opts)

-- Manually configured servers

-- nvim_lsp.ocamllsp.setup{
--   on_attach = on_attach,
--   cmd = {"/home/carlos/.opam/default/bin/ocamllsp"},
--   root_dir = require("lspconfig").util.root_pattern('*.ml')
-- }
-- nvim_lsp.gdscript.setup{}
