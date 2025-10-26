-- ~/init.lua

-- Базовый настройки Neovim
require('core.configs')

-- Установка плагинов
require('core.plugins')

-- Горячие клавиши
require('core.mappings')

-- Настройка темы
-- require('core.kanagawa')
require('core.monokai-pro')


-- Настройки плагинов
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.mason')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.todo-comments')
require('plugins.comment-nvim')
require('plugins.nvim-autopairs')
require('plugins.bufferline')
require('plugins.dashboard-nvim')
require('plugins.nvim-highlight-colors')
require('plugins.typst-preview')
require('plugins.terminal')

-- Функция проверки расширения файла
local function check_file_extension()
  local file = vim.fn.expand("%:p") -- Полный путь текущего файла
  local ext = vim.fn.expand("%:e")  -- Расширение файла

  if ext == "" then
    print("Файл без расширения")
    return
  end

  -- Примеры действий в зависимости от расширения
  if ext == "lua" then
    vim.opt.tabstop = 2  -- Установить табуляцию 2 для Lua
    vim.opt.shiftwidth = 2
  elseif ext == "py" then
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.keymap.set("n", "<F5>", ":TermRun uv run main.py<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<F6>", ":TermRun uv run src/main.py<CR>", { noremap = true, silent = true })
  elseif ext == "tsx" then
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.keymap.set("n", "<F5>", ":TermRun bun run dev<CR>", { noremap = true, silent = true })
  elseif ext == "md" then
    --vim.cmd("MarkdownPreview") -- Автоматический предпросмотр Markdown
    vim.opt.wrap = true
    vim.opt.wrap = true
  elseif ext == "html" then
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.keymap.set("n", "<F5>", ":TermRun python -m http.server 1000<CR>", { noremap = true, silent = true })
  else
    print("Открыт файл с расширением ." .. ext)
  end
end

-- Автокоманда для проверки расширения при открытии файла
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, {
  pattern = "*",
  callback = check_file_extension,
})

