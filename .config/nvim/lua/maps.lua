local keymap = vim.keymap

-- Rebind the movement keys
keymap.set('', 'j', 'h', { noremap = true, silent = true })
keymap.set('', 'k', 'j', { noremap = true, silent = true })
keymap.set('', 'l', 'k', { noremap = true, silent = true })
keymap.set('', ';', 'l', { noremap = true, silent = true })

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Split window and explore
keymap.set('n', 'ss', ':vsplit<Return>:Explore<Return>', { silent = true })

-- Movement
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<Backspace>', '<C-w>h')
keymap.set('', '<C-w>j', '<C-w>h')
keymap.set('', '<C-w>k', '<C-w>j')
keymap.set('', '<C-w>l', '<C-w>k')
keymap.set('', '<C-w>;', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Comment lines
keymap.set('v', '/', function()
  vim.cmd.norm('gc')
end)
