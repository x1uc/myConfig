vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.opt.tabstop = 4       -- Tab 显示为 4 个空格宽
vim.opt.shiftwidth = 4    -- >> << 缩进的宽度
vim.opt.expandtab = true  -- Tab 替换为空格
vim.opt.smartindent = true-- 启用智能缩进
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

-- 窗口切换
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')


-- 打开终端
vim.keymap.set('n', '<leader>j', function()
  vim.cmd('botright new | resize 10 | terminal')
end, { noremap = true, silent = true })

-- 终端模式下，jk回到普通模式
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })

vim.cmd([[
    call plug#begin('~/.local/share/nvim/plugged')
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-autopairs'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'  
    Plug 'folke/tokyonight.nvim'

    call plug#end()
]])


vim.g.coc_global_extensions = { "coc-tsserver" }

-- 补全用 Tab 键
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })

-- 跳转定义、诊断等
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {})
vim.api.nvim_set_keymap('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(1) : "<C-j>"', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'coc#pum#visible() ? coc#pum#next(-1): "<C-k>"', { silent = true, expr = true })


require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "json",
    "html",
    "css",
    "bash",
    "lua",
    "vim",
    "markdown"
  },
  auto_install = true, -- 自动下载缺失的 parser
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

vim.cmd("colorscheme tokyonight")
vim.g.tokyonight_style = "day"  -- "night", "day"


-- nvim-tree

-- 设置快捷键，<leader>e 打开/关闭文件树
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- 初始化插件
require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = true,         -- 显示文件图标
        folder = true,       -- 显示文件夹图标
        folder_arrow = true, -- 显示展开/折叠小箭头
        git = true,          -- 如果启用 git 支持，也能显示 git 状态小图标
      },
    },
  },
})


require("nvim-autopairs").setup({
  check_ts = true, -- 打开 Treesitter 检测（更智能，不会在字符串里瞎补）
})

