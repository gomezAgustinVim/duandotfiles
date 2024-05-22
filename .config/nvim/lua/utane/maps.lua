local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true , noremap = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Save neovim
map('n', '<C-s>', '<CMD>w<CR>')

-- Save and quit neovim
map('n', '<C-z>', '<CMD>x<CR>')

-- Shortcut to yank register
map({ 'n', 'x' }, '<leader>p', '"0p')

map('n', '<leader>o', '<CMD>setlocal spell! spelllang=es_ar<CR>')
map('n', '<leader>O', '<CMD>setlocal spell! spelllang=en_us<CR>')

-- Nerd tree
map('n', '<c-n>', '<CMD>NERDTreeToggle<CR>')

------------------------------------------------
-- ==>   Splits
------------------------------------------------

-- Make splits
-- Either vertical or horizontal
map('n', '<Leader>vs', '<CMD>vs<CR>')
map('n', '<Leader>hs', '<CMD>split<CR>')

-- Shortcutting split navigation, saving a keypress:
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Make adjusting split sizes a bit more friendly
map('n', '<C-Left>', '<CMD>vertical resize +3<CR>')
map('n', '<C-Right>', '<CMD>vertical resize -3<CR>')
map('n', '<C-Up>', '<CMD>resize +3<CR>')
map('n', '<C-Down>', '<CMD>resize -3<CR>')

-- Change 2 split windows from vert to horiz or horiz to vert
map('n', '<Leader>th', '<C-w>t<C-w>H')
map('n', '<Leader>tk', '<C-w>t<C-w>K')

-- Replace ex mode with gq
map('n', 'Q', 'gq')

-- Check file in shellcheck:
map('n', '<leader>s', ':!clear && shellcheck -x %<CR>')

-- Compile document, be it groff/LaTeX/markdown/etc.
map('n', '<leader>c', ':w! | !compiler "<c-r>%"<CR>')

-- Compile slide with pandoc
map('n', '<leader>e', ':!pandoc % -t beamer -o %.pdf<CR>')

-- Perform dot commands over visual blocks:
map('x', '.', ':normal .<CR>')

-- Mapping to open VimwikiIndex
map('n', '<leader>ww', ':VimwikiIndex<CR>', { noremap = true })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})

-- Open corresponding .pdf/.html or preview
-- map('n', '<leader>p', ':!opout <c-r>%<CR><CR>')
