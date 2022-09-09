-- Bugfix for allowing system copy/paste in neovide
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- Shade config
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>ts',
  }
})

-- Telescope
-- Required to set fzf as the default picker
require('telescope').load_extension('fzf')

-- Nvim Tree
require('nvim-tree').setup({
	view = {
		width = 40
	},
	update_focused_file = {
		enable = true
	}
})
vim.api.nvim_set_keymap('', '<Leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

require'nvim-treesitter.configs'.setup({
	ensure_installed = { "ruby", "javascript", "typescript", "html", "json", "elixir", "eex", "heex" },
	highlight = {
		enable = true
	}
})
