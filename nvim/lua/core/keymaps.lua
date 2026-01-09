-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>t', ':split | terminal<CR>', { desc = 'Open terminal in split' })

---------------------------------------------------------------------------
-- 🔍 Plugin Enhancements Keymaps
---------------------------------------------------------------------------

-- Trouble.nvim (Diagnostics / Quickfix UI)
vim.keymap.set('n', '<leader>tt', '<cmd>TroubleToggle<CR>', { desc = 'Toggle Trouble diagnostics', silent = true })

-- Harpoon (Quick file navigation)
vim.keymap.set('n', '<leader>ha', function() require('harpoon'):list():add() end, { desc = 'Add file to Harpoon list' })
vim.keymap.set('n', '<leader>hh', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, { desc = 'Open Harpoon menu' })
vim.keymap.set('n', '<leader>h1', function() require('harpoon'):list():select(1) end, { desc = 'Go to Harpoon file 1' })
vim.keymap.set('n', '<leader>h2', function() require('harpoon'):list():select(2) end, { desc = 'Go to Harpoon file 2' })
vim.keymap.set('n', '<leader>h3', function() require('harpoon'):list():select(3) end, { desc = 'Go to Harpoon file 3' })
vim.keymap.set('n', '<leader>h4', function() require('harpoon'):list():select(4) end, { desc = 'Go to Harpoon file 4' })

-- Spectre (Search & Replace across files)
vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").open()<CR>', { desc = 'Search & Replace (Spectre)', silent = true })

-- Todo-comments (Jump between TODO / FIX / NOTE)
vim.keymap.set('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Next TODO comment' })
vim.keymap.set('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Previous TODO comment' })

-- Symbols-outline (Code structure view)
vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>', { desc = 'Toggle Symbols Outline', silent = true })

-- Trouble / Todo / Diagnostics quick access
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics (Trouble)', silent = true })

-- Noice message history (if using folke/noice)
vim.keymap.set('n', '<leader>nm', '<cmd>Noice history<CR>', { desc = 'Show Noice message history', silent = true })

-- Markdown Preview
-- Markdown Preview (toggle)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>mp', function()
      if vim.g.mkdp_preview_is_open == 1 then
        vim.cmd('MarkdownPreviewStop')
      else
        vim.cmd('MarkdownPreview')
      end
    end, { buffer = true, desc = 'Toggle Markdown Preview', silent = true })
  end,
})

-- Leap.nvim: no mapping required; uses default “s/S” motions.
-- Flash.nvim: press <leader>s to invoke flash search.
vim.keymap.set('n', '<leader>f', function() require('flash').jump() end, { desc = 'Flash jump (visual search)' })

-- LSP Rename (using inc-rename.nvim)
vim.keymap.set('n', '<leader>rn', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true, desc = 'Incremental Rename Symbol' })
