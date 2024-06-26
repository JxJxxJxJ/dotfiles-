lvim.plugins = { {
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	lazy = true, --optional
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		require("todo-comments").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	end
},
	{              -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 10, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")
			-- You can configure highlights by doing something like:
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{ "tpope/vim-repeat" },
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-sleuth' },
	{ "HiPhish/nvim-ts-rainbow2" },
	{
		"folke/lsp-colors.nvim",
		event = "BufRead",
	},
	{ 'RaafatTurki/hex.nvim' },
	{ "ARM9/arm-syntax-vim", },
	{
		"ggandor/leap.nvim",
		name = "leap",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{ -- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Imágenes",
			-- has_breadcrumbs = true,
			bg_theme = "default",
			watermark = "",
		},
	},
	{ "ARM9/arm-syntax-vim", },
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require('nvim-autopairs').setup {}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
			local cmp = require 'cmp'
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},
	{ "LunarVim/lunar.nvim" },
}
