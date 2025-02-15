-- brew install neovim tree-sitter luajit
-- npm install -g typescript typescript-language-server

-- <Leader> key is backslash \

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.mouse = ''
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- no wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Findinf files - search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.list = true -- Enable list mode to show the characters
vim.opt.listchars = {
  space = '·',     -- Represent spaces with a dot
  tab = '→ ',      -- Represent tabs with an arrow and a space
  trail = '•',     -- Represent trailing spaces with a bullet
  extends = '⟩',   -- Represent lines extending past the window with this symbol
  precedes = '⟨',  -- Represent truncated lines with this symbol
  nbsp = '␣',      -- Represent non-breaking spaces with this symbol
  eol = '↲',       -- Represent end-of-line characters with an arrow
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd [[
      highlight NonText guifg=#333333
      highlight Whitespace guifg=#333333
    ]]
  end,
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iTerm2

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Show diagnostic floating window after 1 second of holding the cursor
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = '*',
  callback = function()
    local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
    if #line_diagnostics > 0 then
      vim.diagnostic.open_float(nil, {
        focusable = false,
        border = 'rounded',
        max_width = 80,
      }) -- Disable the ability to focus the float.
    end
  end,
})
