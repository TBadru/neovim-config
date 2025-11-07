return {
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -------------------------------------------------------------------
      -- ⚙️ Settings
      -------------------------------------------------------------------
      local themes = { 'nord', 'catppuccin', 'tokyonight', 'gruvbox', 'kanagawa' }
      local state_path = vim.fn.stdpath('data') .. '/theme_state.json'
      local current = 1
      local bg_transparent = true

      -------------------------------------------------------------------
      -- 🧠 Helpers: Save / Load last used theme
      -------------------------------------------------------------------
      local function save_state(theme, transparent)
        local ok, data = pcall(vim.fn.writefile, { vim.json.encode({ theme = theme, transparent = transparent }) }, state_path)
        if not ok then
          vim.notify('Failed to save theme state', vim.log.levels.WARN)
        end
      end

      local function load_state()
        if vim.fn.filereadable(state_path) == 0 then
          return nil
        end
        local ok, content = pcall(vim.fn.readfile, state_path)
        if not ok or not content[1] then
          return nil
        end
        local decoded = vim.json.decode(content[1])
        return decoded.theme, decoded.transparent
      end

      -------------------------------------------------------------------
      -- 🎨 Apply theme and transparency
      -------------------------------------------------------------------
      local function apply_transparency(enable)
        if enable then
          vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
        else
          vim.cmd('colorscheme ' .. themes[current])
        end
      end

      local function apply_theme(name)
        vim.cmd('colorscheme ' .. name)
        apply_transparency(bg_transparent)
        save_state(name, bg_transparent)
        print('🌈 Theme: ' .. name)
      end

      -------------------------------------------------------------------
      -- 🎛️ Keymaps
      -------------------------------------------------------------------
      local function toggle_transparency()
        bg_transparent = not bg_transparent
        apply_theme(themes[current])
      end

      local function cycle_theme()
        current = current % #themes + 1
        apply_theme(themes[current])
      end

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true, desc = 'Toggle background transparency' })
      vim.keymap.set('n', '<leader>ct', cycle_theme, { noremap = true, silent = true, desc = 'Cycle color themes' })

      -------------------------------------------------------------------
      -- 🩵 Integrations: Lualine + Bufferline
      -------------------------------------------------------------------
      local function setup_integrations()
        local ok_lualine, lualine = pcall(require, 'lualine')
        if ok_lualine then
          lualine.setup({
            options = { theme = themes[current], globalstatus = true },
          })
        end

        local ok_bufferline, bufferline = pcall(require, 'bufferline')
        if ok_bufferline and themes[current] == 'nord' then
          bufferline.setup({
            highlights = require('nord').bufferline.highlights({
              italic = false,
              bold = true,
            }),
          })
        end
      end

      -------------------------------------------------------------------
      -- 🚀 Initialization
      -------------------------------------------------------------------
      local saved_theme, saved_transparency = load_state()
      if saved_theme then
        for i, theme in ipairs(themes) do
          if theme == saved_theme then
            current = i
            break
          end
        end
        bg_transparent = saved_transparency
      end

      vim.cmd('colorscheme ' .. themes[current])
      apply_transparency(bg_transparent)
      setup_integrations()
    end,
  },

  -- 🎨 Additional themes
  { 'catppuccin/nvim', name = 'catppuccin', lazy = true },
  { 'folke/tokyonight.nvim', lazy = true },
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
}
