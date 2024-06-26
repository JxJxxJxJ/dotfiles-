pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
-- NOTE: Cada comando tiene su representacion en whichkey
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
lvim.builtin.which_key.mappings["sh"] = { "<cmd>Telescope help_tags<cr>", "Help" }

vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
lvim.builtin.which_key.mappings["sk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" }

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
lvim.builtin.which_key.mappings["sf"] = { "<cmd>Telescope find_files<cr>", "Files" }

vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope builtin<cr>", "Select Telescope" }

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope grep_string<cr>", "Word" }

vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope help_tags<cr>", "Live Grep" }

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
lvim.builtin.which_key.mappings["sd"] = { "<cmd>Telescope help_tags<cr>", "Diagnostics" }

vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
lvim.builtin.which_key.mappings["sr"] = { "<cmd>Telescope resume<cr>", "Resume" }

vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
lvim.builtin.which_key.mappings["s."] = { "<cmd>Telescope oldfiles<cr>", 'Recent Files ("." for repeat)' }

vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
lvim.builtin.which_key.mappings["<leader>"] = { "<cmd>Telescope buffers<cr>", "Find existing buffers" }

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>\\', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[\\] Fuzzily search in current buffer' })
lvim.builtin.which_key.mappings["\\"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>",
  "Fuzzily search in current buffer" }

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
lvim.builtin.which_key.mappings["s/"] = { function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, "Live Grep in Open Files" }

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
lvim.builtin.which_key.mappings["sn"] = { function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, "Neovim files" }
