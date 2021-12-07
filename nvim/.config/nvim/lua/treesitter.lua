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
        enable = true
    },
    indent = {
        enable = true
    },
}
