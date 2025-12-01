-- =============================================
-- Настройки NeoWim
-- =============================================

-- Установка <Leader> (пробел)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Буфер обмена
vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ["+"] = 'wl-copy --foreground --type text/plain',
    ["*"] = 'wl-copy --foreground --primary --type text/plain'
  },
  paste = {
    ["+"] = 'wl-paste --no-newline',
    ["*"] = 'wl-paste --no-newline --primary'
  },
  cache_enabled = true
}

-- Относительная нумерация + обычная
vim.opt.number = true
vim.opt.relativenumber = true

-- Подсветка синтаксиса
vim.opt.syntax = on

-- Табы и отступы
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Отсутпы прокрутки
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

-- Поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- =============================================
-- Плагины (через lazy.nvim)
-- =============================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- Тема gruvdox material
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox_material",
    priority = 1,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
   -- Комментарии
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  -- Цветные скобки
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
       vim.cmd([[
        highlight RainbowDelimiterRed    guifg=#ff6b6b
        highlight RainbowDelimiterYellow guifg=#feca57  
        highlight RainbowDelimiterBlue   guifg=#48dbfb
        highlight RainbowDelimiterOrange guifg=#ff9ff3
        highlight RainbowDelimiterGreen  guifg=#1dd1a1
        highlight RainbowDelimiterViolet guifg=#f368e0
        highlight RainbowDelimiterCyan   guifg=#00d2d3
      ]])
      local rainbow_delimiters = require('rainbow-delimiters')
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
        },
        query = {
          [''] = 'rainbow-delimiters',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow', 
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },
  -- Полоски отступов
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
        highlight IblIndent1 guifg=#ff6b6b gui=nocombine
        highlight IblIndent2 guifg=#feca57 gui=nocombine
        highlight IblIndent3 guifg=#48dbfb gui=nocombine
        highlight IblIndent4 guifg=#ff9ff3 gui=nocombine
        highlight IblIndent5 guifg=#1dd1a1 gui=nocombine
        highlight IblIndent6 guifg=#f368e0 gui=nocombine
        
        highlight IblScope1 guifg=#ff6b6b gui=nocombine
        highlight IblScope2 guifg=#feca57 gui=nocombine
        highlight IblScope3 guifg=#48dbfb gui=nocombine
        highlight IblScope4 guifg=#ff9ff3 gui=nocombine
        highlight IblScope5 guifg=#1dd1a1 gui=nocombine
        highlight IblScope6 guifg=#f368e0 gui=nocombine
      ]])
      require("ibl").setup({
        indent = {
          char = "▏",
          highlight = {
            "IblIndent1",
            "IblIndent2", 
            "IblIndent3",
            "IblIndent4",
            "IblIndent5",
            "IblIndent6",
          },
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
          highlight = {
            "IblScope1",
            "IblScope2",
            "IblScope3",
            "IblScope4",
            "IblScope5",
            "IblScope6",
          },
        },
      })
    end
  },
  -- Отображение цветов
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
        }
      })
    end
  },
  -- Файловый менеджер (nvim-tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
        vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { silent = true })
      end,
  },
  -- Подсветка синтаксиса (tree-sitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "javascript", "lua", "json", "cpp" },
        highlight = { enable = true },
      })
    end,
  },
  -- LSP сервер
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  },
  },
  -- Mason для управления LSP
  {
    "williamboman/mason.nvim",
     dependencies = {
       "williamboman/mason-lspconfig.nvim",
     },
     config = function()
       require("mason").setup()
        require("mason-lspconfig").setup({
           ensure_installed = { "clangd", "pylsp" }
        })
     end,
  },
  -- Автодополнение (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
     dependencies = {
        "hrsh7th/cmp-nvim-lsp",  -- LSP-источник
        "hrsh7th/cmp-buffer",    -- Дополнение из буфера
        "hrsh7th/cmp-path",      -- Дополнение путей
     },
     config = function()
        local cmp = require("cmp")
        cmp.setup({
           mapping = cmp.mapping.preset.insert({
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<Tab>"] = cmp.mapping.confirm({ select = true }),
              ["<CR>"] = cmp.mapping.confirm({select = true}),
              ["<Esc>"] = cmp.mapping.abort(),
           }),
           sources = cmp.config.sources({
              { name = "nvim_lsp"},
              { name = "buffer" },
              { name = "path" },
           }),
        })
     end,
  },
  -- Инфа об затупах Trouble
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {},
  },
-- =============================================
-- Горячие клавиши
-- =============================================
  -- Запоминалка кеймапов
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
           --your  config here
    },
    keys = {
      {
        "<Leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Toggle NvimTree",
      },
      {
        "<Leader>cp",
        '<cmd>let @+ = expand("%:p")<cr>',
        desc = "Copy full path",
      },
      {
        "<Leader>cf",
        '<cmd>let @+ = expand("%:t")<cr>',
        desc = "Copy file name",
      },
      {
        "<Leader>cr",
        '<cmd>let @+ = expand("%")<cr>',
        desc = "Copy relative path",
      },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
})
