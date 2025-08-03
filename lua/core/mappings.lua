-- ~/lua/core/mappings.lua

-- Горячие клавиши
vim.keymap.set("n", "<C-b>", ":Neotree dir=./ position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<*>", ":Telescope grep_string<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", ":Telescope registers<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "<C-t>", ":TodoTelescope<CR>", {noremap = true, silent = true});
