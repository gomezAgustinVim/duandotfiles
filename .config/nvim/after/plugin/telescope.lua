local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true , noremap = true })
end

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
