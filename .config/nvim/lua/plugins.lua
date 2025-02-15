-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lazy").setup({
  { "folke/lazy.nvim", lazy = false },

  {
    -- color scheme
    'loctvl842/monokai-pro.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        inc_search = "background", -- underline | background
        background_clear = { "telescope" },
      })

      vim.cmd([[colorscheme monokai-pro]])
    end,
  },

  {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'monokai-pro',
          section_components = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status
              path = 0 -- 0 = just filename
            }
          },
          lualine_x = {
            {
              'diagnostics',
              sources = {
                'nvim_diagnostic', 'nvim_lsp', 'vim_lsp'
              }
            }
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1 -- 1 = relative path
            }
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'fugitive' }
      })
    end
  },

  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim',  'williamboman/mason-lspconfig.nvim' },
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = { 'ts_ls', 'eslint', 'jsonls', 'lua_ls', 'tailwindcss' },
      })

      local lspconfig = require('lspconfig')

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      end

      lspconfig.eslint.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.tailwindcss.setup {}

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        cmd = { 'typescript-language-server', '--stdio' },
        root_dir = lspconfig.util.root_pattern('tsconfig.json', 'package.json', '.git'),
        on_attach = on_attach,
      })

    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    lazy = false,
    dependencies = { 'nvim-lspconfig' }
  },

  {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init({
        mode = 'symbol_text',
        preset = 'codicons',
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })
    end
  },

  { 'L3MON4D3/LuaSnip' },

  -- Auto Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer'
    },
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'tsx', 'typescript', 'lua', 'vim', 'graphql', 'markdown', 'python', 'html', 'css', 'sql', 'json', 'yaml', 'toml', 'csv', 'go', 'dockerfile', 'css', 'clojure' },
        sync_install = false,
        highlight = {
          enable = true, -- enable syntax highlighting
          additional_vim_regex_highlighting = false, -- disable vim regex highlighting for performance
        },
        indent = {
          enable = true,
        },
        modules = {},
        auto_install = true,
        ignore_install = {},
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    'tpope/vim-surround',
    'lewis6991/gitsigns.nvim',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })
    end,
  },

  {
    'dinhhuy258/git.nvim',
    dependencies = { 'lewis6991/gitsigns.nvim' },
    config = function()
      require('git').setup({
        keymaps =  {
          blame = '<Leader>gb',
          browse = '<Leader>go',
        }
      })
    end
  },

  {
    'davidoc/taskpaper.vim',
    ft = 'taskpaper', -- Load the plugin only for TaskPaper files
    config = function()
      vim.opt.task_paper_follow_move = false
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.taskpaper" },
        callback = function()
          vim.bo.filetype = "taskpaper"
        end,
      })
    end,
  },
})
