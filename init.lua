-- Базовые настройки
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10           -- Аналог set so=10
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"
vim.opt.wrap = false
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.clipboard:append("unnamedplus") -- Аналог set clipboard+=unnamedplus
vim.opt.swapfile = false         -- Аналог set noswapfile

local function dashboard_header() return {
  '', '', '',
'██╗   ██╗███████╗██████╗ ███████╗ █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
'╚██╗ ██╔╝██╔════╝██╔══██╗╚══███╔╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║',
' ╚████╔╝ █████╗  ██████╔╝  ███╔╝ ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║',
'  ╚██╔╝  ██╔══╝  ██╔══██╗ ███╔╝  ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
'   ██║   ███████╗██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
'   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
'', '', ''
}
end

-- Установка lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Список плагинов с настройками
require("lazy").setup({
  -- Статусная строка
  { "nvim-lualine/lualine.nvim", config = function() require("lualine").setup() end },

  -- Файловый менеджер NERDTree
  { "preservim/nerdtree", cmd = "NERDTree" },

  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
    }
  },
{ 'nvim-treesitter/nvim-treesitter' },
  
  -- Иконки для Neovim
  { "nvim-tree/nvim-web-devicons" },

  -- Подсветка CSS цветов
  { "ap/vim-css-color" },

  -- Иконки для Vim
  { "ryanoasis/vim-devicons" },

  -- Учебный плагин для Vim
  { "ThePrimeagen/vim-be-good" },

  -- Emmet для быстрого HTML/CSS
  { "mattn/emmet-vim" },

  -- Тема GitHub
  { "projekt0n/github-nvim-theme", config = function() vim.cmd("colorscheme github_dark_high_contrast") end },

  -- Интеграция с Git
  { "tpope/vim-fugitive" },

  -- Просмотр Git-логов
  { "rbong/vim-flog" },

  -- Подсветка TODO-комментариев
  { "folke/todo-comments.nvim", config = function() require("todo-comments").setup() end },

  -- Автозакрытие скобок
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },

  -- Библиотека для Telescope и других плагинов
  { "nvim-lua/plenary.nvim" },

  -- Telescope для поиска файлов и буферов
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", config = function() require("telescope").setup() end },

  -- Рендеринг Markdown
  { "MeanderingProgrammer/render-markdown.nvim", opts = {} },

  -- Предпросмотр Markdown
  { "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" },

  -- Переключение между буферами
  { "akinsho/bufferline.nvim", tag = "*", opts = {} },
  --{"loctvl842/monokai-pro.nvim", config = function() vim.cmd("colorscheme monokai-pro-spectrum") end },

  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      config = {
        header = dashboard_header(),
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
})

-- Горячие клавиши
vim.keymap.set("n", "<C-b>", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

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

