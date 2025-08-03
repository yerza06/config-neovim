-- ~/init.lua

-- Базовый настройки Neovim
require('core.configs')

-- Установка плагинов
require('core.plugins')

-- NOTE: Настройки плагинов
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
require('plugins.todo-comments')
require('plugins.comment-nvim')
require('plugins.nvim-autopairs')
require('plugins.bufferline')
require('plugins.dashboard-nvim')
require('plugins.nvim-highlight-colors')

-- Горячие клавиши
require('core.mappings')


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
  elseif ext == "md" then
    --vim.cmd("MarkdownPreview") -- Автоматический предпросмотр Markdown
    vim.opt.wrap = true
    vim.opt.wrap = true
  elseif ext == "html" then
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  else
    print("Открыт файл с расширением ." .. ext)
  end
end

-- Автокоманда для проверки расширения при открытии файла
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, {
  pattern = "*",
  callback = check_file_extension,
})

