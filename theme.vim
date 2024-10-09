set background=dark
"colorscheme tokyonight-night
colorscheme kanagawa

"override colorscheme
"enable transparent background
"highlight Normal ctermbg=NONE guibg=NONE

"highlight only one character when line too long
highlight ColorColumn ctermbg=grey guibg=grey25
call matchadd('ColorColumn', '\%88v', 100)
