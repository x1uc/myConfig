-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
  

-- 基础设置 ------------------------------------------------------
vim.g.mapleader = " "                     -- 设定 leader 键为空格
vim.opt.clipboard = "unnamedplus"         -- 与系统剪贴板共享
vim.opt.number = true                     -- 显示行号
vim.opt.tabstop = 4                       -- Tab 显示为 4 个空格
vim.opt.shiftwidth = 4                    -- 自动缩进宽度
vim.opt.expandtab = true                  -- 将 Tab 转为空格
vim.opt.smartindent = true                -- 启用智能缩进

-- 快捷函数 ------------------------------------------------------
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

------------------------------------------------------------------
-- 模式切换与复制 ------------------------------------------------
map('i', 'jk', '<Esc>', opt)                         -- 插入模式下，按 jk 返回普通模式
map('n', 'cpa', 'ggVG"+y', opt)                      -- 一键复制整个文件

------------------------------------------------------------------
-- 禁用方向键（鼓励用 hjkl）-------------------------------------
for _, mode in ipairs({ 'n', 'i', 'v' }) do
  for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    map(mode, key, '<NOP>', opt)
  end
end

------------------------------------------------------------------
-- 移动行（Alt + ↑ / ↓）----------------------------------------
map('n', '<A-k>', ':m .-2<CR>==', opt)
map('n', '<A-j>', ':m .+1<CR>==', opt)
------------------------------------------------------------------
-- 行首 / 行尾 & 快速移动 ----------------------------------------
map({'n', 'v'}, 'H', '^', opt)
map({'n', 'v'}, 'L', 'g_', opt)
map({'n', 'v'}, 'J', '5j', opt)
map({'n', 'v'}, 'K', '5k', opt)
------------------------------------------------------------------
