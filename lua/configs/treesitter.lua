local options = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

return options
