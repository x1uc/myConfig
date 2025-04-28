vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
-- 在插入模式下，按 jk 返回普通模式
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- 复制当前文件内容到系统剪贴板
vim.api.nvim_set_keymap('n', 'cpa', 'ggVG"+y', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true, silent = true })

-- 禁用方向键（避免在 Vim 中误触）
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Alt + ↑ / ↓ 移动行
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=', { noremap = true, silent = true })

-- 打开终端
vim.keymap.set('n', '<leader>j', function()
  vim.cmd('botright new | resize 10 | terminal')
end, { noremap = true, silent = true })

-- 终端模式下，jk回到普通模式
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })


vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  " 在这里添加你的插件

  call plug#end()
]])



