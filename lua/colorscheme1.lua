-- Определение цветовой палитры
local colors = {
  bg = "#1a1a1a",       -- Фон
  fg = "#d4d4d4",       -- Основной текст
  gray = "#6e6e6e",     -- Серый для комментариев
  blue = "#78dce8",     -- Синий для ключевых слов
  green = "#a9dc76",    -- Зелёный для строк
  red = "#ff6188",      -- Красный для ошибок
  yellow = "#ffd866",   -- Жёлтый для функций
  purple = "#ab9df2",   -- Фиолетовый для операторов
}

-- #ff6188
-- Функция установки темы
local function setup()
  -- Сброс всех подсветок (опционально)
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Установка базовых групп подсветки
  vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.blue, bold = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Error", { fg = colors.red })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "Operator", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "Number", { fg = colors.red })

  -- Подсветка интерфейса
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.gray })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.yellow, bold = true })
  vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.gray })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.gray, bg = colors.bg })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.gray })

  -- Подсветка для Telescope (пример интеграции с плагинами)
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.gray })
  vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = colors.fg, bg = colors.bg })
end

-- Экспорт темы как модуля
return {
  setup = setup,
}
