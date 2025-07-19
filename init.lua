
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
--vim.opt.clipboard:append("unnamedplus") -- Аналог set clipboard+=unnamedplus
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


  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
    }
  },
  { 'nvim-treesitter/nvim-treesitter', config = function() require'nvim-treesitter.configs'.setup{
      -- A list of parser names, or "all" (the listed parsers MUST always be installed
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "rust", "bash", "javascript" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  } end },
  
  -- Иконки для Neovim
  { "nvim-tree/nvim-web-devicons" },

  -- Иконки для Vim
  { "ryanoasis/vim-devicons" },

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
  { "folke/todo-comments.nvim", config = function() require("todo-comments").setup{
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = true, -- enable multine todo comments
      multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = {}, -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" }
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  } end }, 

  -- Автозакрытие скобок
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },

  -- Библиотека для Telescope и других плагинов
  { "nvim-lua/plenary.nvim" },

  -- Telescope для поиска файлов и буферов
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", config = function() require("telescope").setup() end },

  -- Рендеринг Markdown
  --{ "MeanderingProgrammer/render-markdown.nvim", opts = {} },
  { "OXY2DEV/markview.nvim" },

  -- Предпросмотр Markdown
  { "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" },

  -- Переключение между буферами
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config = function() require("bufferline").setup() end },
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
  },

  -- Подсветка CSS цветов
  { 'brenoprata10/nvim-highlight-colors', config = function() require("nvim-highlight-colors").setup() end },

  { "mason-org/mason.nvim", config = function() require("mason").setup() end },

  { 
    "mason-org/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup{
       automatic_enable = {
         exclude = {
           "rust_analyzer",
           "ts_ls",
           "pyright"
         }
       }
     }
  end },

  { 
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ast_wget.setup({})
    end
  },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" }
})

-- Горячие клавиши
vim.keymap.set("n", "<C-b>", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":Telescope registers<CR>", {noremap = true, silent = true});

require("cmp")

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

