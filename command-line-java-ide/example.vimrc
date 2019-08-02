source /usr/share/vim/vim81/defaults.vim
set hlsearch
set cscopeprg=gtags-cscope
if filereadable('GTAGS')
  cs add GTAGS
endif
set cscopetag
set shiftwidth=2
set softtabstop=2
set expandtab
let g:netrw_banner=0
let g:syntastic_java_javac_config_file_enabled=1
set tabpagemax=42
highlight ColorColumn ctermbg=lightgreen
set colorcolumn=80
:inoremap <C-w> <C-g>u<C-w>
let g:syntastic_mode_map={'mode':'active','passive_filetypes':['java']}
set ignorecase
set smartcase
autocmd FileType markdown setlocal spell
