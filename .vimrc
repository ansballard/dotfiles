" Vim Config, using vim-plug

call plug#begin()
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ap/vim-css-color'
  Plug 'scrooloose/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'scrooloose/syntastic'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'bling/vim-airline'
  Plug 'airblade/vim-gitgutter'
  Plug 'morhetz/gruvbox'
call plug#end()

set backspace=indent,eol,start

" Theme Config

colorscheme gruvbox
set background=dark

" Nerd Tree Config

map <C-\> :NERDTreeToggle<CR>

" Prettier Config

let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'

" Syntastic Config

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
