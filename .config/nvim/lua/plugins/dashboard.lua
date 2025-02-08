return {
	'nvimdev/dashboard-nvim',
	event = "VimEnter",
	config = function()
		require('dashboard').setup {
			theme = "hyper",
			config = {
				week_header = {
					enable = true
				},
				shortcut = {
					{ desc = '󰊳 Update packages', group = '@property', action = 'Lazy update', key = 'u' },
					{ desc = ' File picker', group = 'Number', action = 'Telescope find_files', key = 'f' },
					{
						desc = ' dotfiles',
						group = '@property',
						action = 'Telescope find_files cwd=~/Dev/dotfiles',
						key = 'd',
					},
				},
				packages = { enable = false },
				footer = {}
			}
		}
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
