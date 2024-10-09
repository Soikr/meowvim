lua require('which-key').add({ '<leader>c', group = 'commenter' })
lua require('which-key').add({ '<leader>d', group = 'debugging' })

"other
nmap <leader>a :NvimTreeToggle<CR>
nmap <leader>s :FzfLua grep search=""<CR>
nmap <leader>ln :noh<CR>
nmap <leader>ls :s/"/'/g<bar>:noh<CR>
nmap <leader>lc :%s/\t/  /g<CR>
nmap <leader>lp :echo expand('%:p')<CR>
lua require('which-key').add({ '<leader>l', group = 'linting / syntax' })

"let g:indentLine_char = '|'
"let g:indentLine_char = '│'
"let g:indent_blankline_use_treesitter = v:true

highlight IndentBlanklineChar guifg=grey25 gui=nocombine

"vsnip
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

"fzf
nmap ; :FzfLua files<CR>
let g:fzf_layout = { 'window': { 'border': 'sharp', 'width': 0.9, 'height': 0.6 } }

"debugging
nnoremap <silent> <leader>dr :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dk :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>dj :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>dt :lua require'dap'.toggle_breakpoint()<CR>
"nnoremap <silent> <leader>db :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
"nnoremap <silent> <leader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>do :lua require'dap'.repl.open()<CR>
"nnoremap <silent> <leader>dh :lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>dh :lua :lua require('dap.ui.widgets').hover()<CR>
