-- require('lspconfig').setup{}
-- lua/plugins/lsp.lua — Neovim 0.11+ (без require('lspconfig'))

-- capabilities для nvim-cmp (если установлен)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_caps = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_caps.default_capabilities(capabilities)
end

-- Общий on_attach (можно расширять по желанию)
local function on_attach(client, bufnr)
  -- сюда можно класть буферные маппинги, если не хочешь autocommand ниже
end

-- 1) Объявляем конфиги серверов
vim.lsp.config('pyright', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.config('prismals', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.config('cssls', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.config('html', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.config('golangci_lint_ls', {
  capabilities = capabilities,
  on_attach    = on_attach,
  -- при необходимости можно добавить init_options / settings
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  on_attach    = on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
        experimental = { enable = true },
      },
    },
  },
})

-- 2) Включаем сервера (можно списком)
vim.lsp.enable({
  'pyright',
  'ts_ls',
  'prismals',
  'cssls',
  'html',
  'golangci_lint_ls',
  'rust_analyzer',
})

-- 3) Глобальные маппинги диагностики
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- 4) Буферные маппинги после attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>la', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<Leader>lf', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end
})

