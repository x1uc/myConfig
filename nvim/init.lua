-- 在插入模式下，按 jk 返回普通模式
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- 复制当前文件内容到系统剪贴板
vim.api.nvim_set_keymap('n', 'cpa', 'ggVG"+y', { noremap = true, silent = true })

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


-- 变量保存终端窗口的 ID
local terminal_open = false
local terminal_win = nil

-- 切换终端窗口
function ToggleTerminal()
  if terminal_open then
    -- 终端已经打开，关闭它
    vim.api.nvim_win_close(terminal_win, true)
    terminal_open = false
  else
    -- 终端未打开，创建并打开一个新的终端窗口
    terminal_win = vim.api.nvim_get_current_win()
    vim.cmd('botright split')  -- 终端窗口在下方
    vim.cmd('resize 15')       -- 调整终端窗口大小
    vim.cmd('terminal')        -- 启动终端
    terminal_open = true
  end
end

-- 绑定 Ctrl + ~ 快捷键到所有模式
vim.api.nvim_set_keymap('n', '<C-i>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-i>', '<Esc>:lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-i>', '<Esc>:lua ToggleTerminal()<CR>', { noremap = true, silent = true })
