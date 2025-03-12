set clipboard=unnamedplus

inoremap jk <Esc>
nnoremap cpa ggVG"+y
" ban vector 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>


" Alt + ↑ / ↓ 
nnoremap <A-k>   :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

vnoremap <A-k>   :m '<-2<CR>gv=
vnoremap <A-j> :m '>+1<CR>gv=


call plug#begin('./plugged')
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'java':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b,kspell,k/home/lixc/myConfig/nvim/plugged/vim-dict/dict/*


" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
set shortmess+=c
call plug#end()
