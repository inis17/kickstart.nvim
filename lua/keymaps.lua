vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Keymap tab to move to next delimiter just after
vim.keymap.set('n', '<Tab>', '/)\\|(\\|}\\|{\\|]\\|[\\|"\\|\\\'\\|`\\|<\\|><CR><cmd>nohlsearch<CR>', { desc = 'Move cursor to next delimiter' })
vim.keymap.set('i', '<Tab>', '<ESC>/)\\|(\\|}\\|{\\|]\\|[\\|"\\|\\\'\\|`\\|<\\|><CR><cmd>nohlsearch<CR>a', { desc = 'Move cursor after next delimiter' })
vim.keymap.set('n', '<S-Tab>', '?)\\|(\\|}\\|{\\|]\\|[\\|"\\|\\\'\\|`\\|>\\|<<CR><cmd>nohlsearch<CR>', { desc = 'Move cursor to previous delimiter' })
vim.keymap.set(
  'i',
  '<S-Tab>',
  '<ESC>l?)\\|(\\|}\\|{\\|]\\|[\\|"\\|\\\'\\|`\\|>\\|<<CR><cmd>nohlsearch<CR>i',
  { desc = 'Move cursor before previous delimiter' }
)
vim.keymap.set('n', '<C-o>', '<C-o>', { desc = 'Jump to previous cursor position' })
vim.keymap.set('n', '<C-i>', '<C-i>', { desc = 'Jump to previous cursor position' })
vim.keymap.set('i', 'Ì', '<Left>', { desc = 'Move cursor to the left' })
vim.keymap.set('i', '¬', '<Right>', { desc = 'Move cursor to the right' })
vim.keymap.set('i', 'Ï', '<Down>', { desc = 'Move cursor to the left' })
vim.keymap.set('i', 'È', '<Up>', { desc = 'Move cursor to the right' })
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- keymap to jump to diagnostic
vim.keymap.set('n', 'gh', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gH', vim.diagnostic.goto_prev)
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
