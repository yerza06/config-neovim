-- Comment.nvim
-- Настройка комментариев, включая файлы KDL (*.kdl)

-- Чтобы Neovim распознавал расширение .kdl как filetype "kdl"
vim.filetype.add({
  extension = {
    kdl = "kdl",
  },
})

-- KDL поддерживает однострочные // комментарии и блочные /* ... */
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kdl",
  callback = function()
    vim.bo.commentstring = "// %s"
    vim.bo.comments = "s1:/*,mb:*,ex:*/,://"
  end,
})

local ft = require("Comment.ft")
ft.set("kdl", { "//%s", "/*%s*/" })

require("Comment").setup({
  -- Для KDL явно возвращаем commentstring.
  -- Иначе Comment.nvim может пытаться взять его через treesitter и падать с `[Comment.nvim] nil`,
  -- если parser/дерево для kdl не установлено или не смогло построиться.
  pre_hook = function(ctx)
    if vim.bo.filetype == "kdl" then
      return ft.get("kdl", ctx.ctype)
    end
  end,
})
