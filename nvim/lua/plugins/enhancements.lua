return {
  ---------------------------------------------------------------------------
  -- 🔍 Productivity & Editing
  ---------------------------------------------------------------------------
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    version = '*',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- 🧠 LSP Enhancements
  ---------------------------------------------------------------------------
  {
    'ray-x/lsp_signature.nvim',
    event = 'LspAttach',
    opts = {
      floating_window = true,
      hint_prefix = '💡 ',
    },
  },
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    opts = {},
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' },
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- 🎨 UI / Aesthetic
  ---------------------------------------------------------------------------
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    opts = {
      stages = 'fade',
      timeout = 2500,
    },
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    opts = {
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- 🧭 Navigation
  ---------------------------------------------------------------------------
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- 🧰 Utilities
  ---------------------------------------------------------------------------
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gdiffsplit' },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      log_level = 'error',
      auto_session_enable_last_session = false,
    },
  },
  {
    'moll/vim-bbye',
    cmd = { 'Bdelete', 'Bwipeout' },
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
