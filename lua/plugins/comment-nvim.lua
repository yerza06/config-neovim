-- Comment.nvim
-- Настройка комментариев, включая файлы KDL (*.kdl)

-- Чтобы Neovim распознавал расширение .kdl как filetype "kdl"
vim.filetype.add({
  extension = {
    kdl = "kdl",
    conf = "conf",
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

-- .conf использует символ # для однострочных комментариев
vim.api.nvim_create_autocmd("FileType", {
  pattern = "conf",
  callback = function()
    vim.bo.commentstring = "# %s"
    vim.bo.comments = ":#"
  end,
})

local ft = require("Comment.ft")
ft.set("kdl", { "//%s", "/*%s*/" })
ft.set("conf", "#%s")

require("Comment").setup({
  -- Для KDL явно возвращаем commentstring.
  -- Иначе Comment.nvim может пытаться взять его через treesitter и падать с `[Comment.nvim] nil`,
  -- если parser/дерево для kdl не установлено или не смогло построиться.
  pre_hook = function(ctx)
    if vim.bo.filetype == "kdl" then
      return ft.get("kdl", ctx.ctype)
    elseif vim.bo.filetype == "conf" then
      return ft.get("conf", ctx.ctype)
    end
  end,
})
