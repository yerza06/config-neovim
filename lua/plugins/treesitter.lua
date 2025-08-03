
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "query", "python", "rust", "bash", "javascript", "html", "css", "json", "arduino", "yaml", "dockerfile", "gitignore" },
    ignore_install = { "markdown", "markdown-inline" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
}
