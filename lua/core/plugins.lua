-- ~/lua/core/plugins.lua

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
  { "nvim-lualine/lualine.nvim" },

  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
    }
  },

  -- Рендеринг Markdown
  -- { "OXY2DEV/markview.nvim" },

  { 'nvim-treesitter/nvim-treesitter', dependencies = { "OXY2DEV/markview.nvim" } },

  -- Иконки для Neovim
  { "nvim-tree/nvim-web-devicons" },

  -- Учебный плагин для Vim
  { "ThePrimeagen/vim-be-good" },

  -- Emmet для быстрого HTML/CSS
  { "mattn/emmet-vim" },

  -- Тема Neovim
  --{ "projekt0n/github-nvim-theme", config = function() vim.cmd("colorscheme github_dark_high_contrast") end },
  { "thesimonho/kanagawa-paper.nvim", config = function() vim.cmd("colorscheme kanagawa-paper-ink") end },

  -- Интеграция с Git
  { "tpope/vim-fugitive" },

  -- Просмотр Git-логов
  { "rbong/vim-flog" },

  -- Подсветка TODO-комментариев
  { "folke/todo-comments.nvim" }, 

  { "numToStr/Comment.nvim" },

  -- Автозакрытие скобок
  { "windwp/nvim-autopairs" },

  -- Библиотека для Telescope и других плагинов
  { "nvim-lua/plenary.nvim" },

  -- Telescope для поиска файлов и буферов
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },

  -- Предпросмотр Markdown
  -- { "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" },

  -- Переключение между буферами
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

  { 'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}} },

  -- Подсветка CSS цветов
  { 'brenoprata10/nvim-highlight-colors' },

  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" }
})
