require('nvim-treesitter.configs').setup{
    ensure_installed = {
        "c",
        "ocaml",
        "java",
        "gdscript",
        "python",
        "haskell",
        "lua",
        "toml",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    indent = {
        enable = true
    },
}

--Orgmode
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}
