"======================================================================
"
" init.vim - initialize config
"
" Created by xjy on 2018/11/15
" Last Modified: 2018/11/15 21:30:00
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

let g:mapleader = ' '

if has('win32')
	nmap <leader>rc :tabedit e:/vim/vim-init/init.vim<CR>
else
	nmap <leader>rc :tabedit ~/.vim/vim-init/init.vim<CR>
endif

if has('win32')
	autocmd! bufwritepost init-basic.vim   source $VIM/vim-init/init/init-basic.vim
	autocmd! bufwritepost init-config.vim  source $VIM/vim-init/init/init-config.vim
	autocmd! bufwritepost init-tabsize.vim source $VIM/vim-init/init/init-tabsize.vim
	autocmd! bufwritepost init-plugins.vim source $VIM/vim-init/init/init-plugins.vim
	autocmd! bufwritepost init-style.vim   source $VIM/vim-init/init/init-style.vim
	autocmd! bufwritepost init-keymaps.vim source $VIM/vim-init/init/init-keymaps.vim
else
	autocmd! bufwritepost init-basic.vim   source ~/.vim/vim-init/init/init-basic.vim
	autocmd! bufwritepost init-config.vim  source ~/.vim/vim-init/init/init-config.vim
	autocmd! bufwritepost init-tabsize.vim source ~/.vim/vim-init/init/init-tabsize.vim
	autocmd! bufwritepost init-plugins.vim source ~/.vim/vim-init/init/init-plugins.vim
	autocmd! bufwritepost init-style.vim   source ~/.vim/vim-init/init/init-style.vim
	autocmd! bufwritepost init-keymaps.vim source ~/.vim/vim-init/init/init-keymaps.vim
endif

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-basic.vim

" 加载扩展配置
LoadScript init/init-config.vim

" 设定 tabsize
LoadScript init/init-tabsize.vim

" 插件加载
LoadScript init/init-plugins.vim

" 界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim

