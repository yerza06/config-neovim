
-- nvim-treesitter 0.12+ — новый API
-- configs.setup() удалён, подсветка встроена в Neovim
require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',

  ensure_installed = { "c", "query", "python", "rust", "bash", "javascript", "html", "css", "json", "arduino", "yaml", "dockerfile", "gitignore", "sql" },
  ignore_install = { "markdown", "markdown-inline" },
})

-- Включить встроенную подсветку для всех файлов
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
