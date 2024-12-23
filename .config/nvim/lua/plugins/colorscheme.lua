local tokyonight = { repo = 'folke/tokyonight.nvim', scheme = 'tokyonight' }
local everforest = { repo = 'neanias/everforest-nvim', scheme = 'everforest' }
return {
	everforest.repo,
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd('colorscheme ' .. everforest.scheme)
	end,
}
