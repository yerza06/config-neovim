-- ~/lua/core/mappings.lua

-- Горячие клавиши
-- vim.keymap.set("n", "gn", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "g<space>", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "G<space>", ":Neotree position=float git_status<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-space>", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-space>", ":Neotree position=float git_status<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-b>", ":Neotree dir=./ position=left<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gto", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gtf", ":Telescope grep_string<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gtp", ":Telescope registers<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "gtm", ":Telescope marks<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "gtt", ":TodoTelescope<cr>", {noremap = true, silent = true})

vim.keymap.set("n", "<C-]>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-\\>", ":BufferLinePick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-\\>", ":BufferLinePickClose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-t>", ":TermOpen<CR>", {noremap = true, silent = true})

vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
