-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	'tpope/vim-surround',

	{
		'nvimdev/dashboard-nvim',
		event = "VimEnter",
		config = function()
			require('dashboard').setup {
				theme = "hyper",
				config = {
					week_header = {
						enable = true
					}
				}
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},

	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {
			exclude = { filetypes = { "dashboard" } }
		},
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme 'tokyonight'
		end,
	},
}
