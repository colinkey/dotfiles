set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua << EOF
require('config')
EOF

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
